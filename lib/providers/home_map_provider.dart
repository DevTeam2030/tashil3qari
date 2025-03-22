import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/cache_helper.dart';
import 'package:tashil_agary/domain/controller/home_controller.dart';
import 'package:tashil_agary/domain/model/models/country_model.dart';
import 'package:tashil_agary/presentation/general/home_Screen/widgets/widget_imports.dart';
import 'package:tashil_agary/providers/profile_provider.dart';
import 'package:widget_to_marker/widget_to_marker.dart';
import '../app/contants.dart';
import '../app/enums.dart';
import '../app/my_app.dart';
import '../app/utils.dart';
import '../components/loading_manager.dart';
import '../domain/model/models/general_property_model.dart';
import '../domain/model/models/home_catogery_model.dart';
import '../presentation/general/ad/ad_imports.dart';
import '../presentation/general/home_Screen/home_imports.dart';
import '../utilites/route_manager.dart';
import 'general_provider.dart';

class HomeMapProvider extends ChangeNotifier {
  final HomeController _api = HomeController();
  bool isLoading = false;
  ValueNotifier<bool> openSearch = ValueNotifier<bool>(false);
  ValueNotifier<HomeCatogeryModel?> selectedCategory = ValueNotifier<HomeCatogeryModel?>(null);
  late Completer<GoogleMapController> mapController;
var saudiBounds=LatLngBounds(
  // southwest:const LatLng(18.35, 34.5), // Southern-western coordinate of Saudi Arabia
  // northeast:const LatLng(32.15, 55.67), // Northern-eastern coordinate of Saudi Arabia
  // southwest: LatLng(16.0, 34.0),      // أقصى جنوب غرب (جازان)
  // northeast: LatLng(32.5, 55.8),      // أقصى شمال شرق (الحدود الكويت/العراق)
  southwest: LatLng(16.0, 33.5),      // غرب أكثر لتغطية نيوم/تبوك
  northeast: LatLng(32.5, 56.0),      // شرق أكثر لتغطية الشرقية والحدود

);
  MapType mapType = MapType.normal;
  ValueNotifier<bool> monthly = ValueNotifier<bool>(false);
  double cameraZoom = 5;
  LatLng locationCustom = const LatLng(23.8859, 45.0785);
  LatLng currentLocation = const LatLng(25.8859, 45.0785);
  CityModel? selectedCity;
  // bool showLocationPermiosion = false;
  bool showCitiesMarkers = true;
  Set<Marker> citiesMarkers = {};
  Set<Marker> propertiesMarkers = {};
  bool showAllSamePosition = true;
  List<GeneralPropertyModel> properties = [];
  AdType? selectedAdType;
  bool showAuctionOnMap = false;
  bool showAllMap = true;

  bool userDocumented = false;

  getDocumented({required BuildContext context}) {
    // if(userDocumented)return;
    if (Constants.userDataModel != null && !Constants.userDataModel!.isUser) {
      context.read<ProfileProvider>().getAllProfileDataOnly(context: context, notify: false);
    }

    try {
      if (isLinkDynamic.value) {
        MyRoute().navigate(context: context, route: AdScreen(propertyId: addDynamicLinkId.value),);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  getByCategory({required BuildContext context, required HomeCatogeryModel? category}) async {
    // if (selectedCategory.value == category) return;
    selectedCategory.value = category;
    showCitiesMarkers = false;
    await getProperties(context: context,
        isAuction: showAuctionOnMap,
        forSale: selectedAdType == AdType.forSale,
        forRent: selectedAdType == AdType.forRent,
        cityId: selectedCity?.id,
        categoryId: category?.id)
        .then((value) => initPropertiesMarkers(context: context));
  }

  initDataCitiesMarkers({required BuildContext context, required bool notify}) async {
    try {
      var country = context.read<GeneralProvider>().mapCountry;
      int? savedCityBefore = CacheHelper.getData(key: ConstantsKeys.selectedCityIdnMapKey);
      isLoading = false;
      if(notify) notifyListeners();
      if (savedCityBefore != null) {
        selectedCity = country.cities.firstWhere((element) => element.id == savedCityBefore);
        showCitiesMarkers = false;
        if(properties.isEmpty) {
          await getProperties(
          context: context,
          forSale: selectedAdType == AdType.forSale,
          forRent: selectedAdType == AdType.forRent,
          cityId: selectedCity!.id,
          isNotify: false,
          isAuction: showAuctionOnMap,).then((value) => initPropertiesMarkers(context: context));
        } else {
          initPropertiesMarkers(context: context);
        }
      }
      else {
        properties.clear();
        showAllMap = true;
        if (citiesMarkers.isEmpty) {
          for (var city in country.cities) {
            citiesMarkers.add(Marker(
                markerId: MarkerId("${city.id}"),
                position: LatLng(city.latitude, city.longitude),
                icon: await TextBoxWidget(
                  text: city.name,
                ).toBitmapDescriptor(),
                onTap: () async {
                  showCitiesMarkers = false;
                  selectedCity = city;
                  CacheHelper.saveData(
                      key: ConstantsKeys.selectedCityIdnMapKey, value: city.id);
                  await getProperties(
                    context: context,
                    forSale: selectedAdType == AdType.forSale,
                    forRent: selectedAdType == AdType.forRent,
                    cityId: city.id,
                    isAuction: showAuctionOnMap,
                  ).then((value) => initPropertiesMarkers(context: context));
                }));
          }
        }
        isLoading = false;
        // if(notify) notifyListeners();
        final GoogleMapController controller = await mapController.future;
        CameraPosition kLake = CameraPosition(
          target: locationCustom,
          zoom: cameraZoom,
        );
        await controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
  }



  initPropertiesMarkers({
    required BuildContext context,
  }) async {
    isLoading = true;
    propertiesMarkers.clear();

    for (var prop in properties) {
      var marks = propertiesMarkers
          .where((element) =>
              element.position.latitude == prop.latitude &&
              element.position.longitude == prop.longitude)
          .toList();
      var numbers = properties
          .where((element) =>
              element.latitude == prop.latitude &&
              element.longitude == prop.longitude)
          .toList();
      if (marks.isNotEmpty && showAllSamePosition) {
        Marker m = marks.first;
        propertiesMarkers.removeAll(marks);
        propertiesMarkers.add(Marker(
            markerId: MarkerId(m.markerId.value),
            position: LatLng(m.position.latitude, m.position.longitude),
            icon: await MoreIcon(
              number: numbers.length,
            ).toBitmapDescriptor(),
            onTap: () {
              showAllSamePosition = false;
              initPropertiesMarkers(context: context);
            }));
      } else {
        marks.isNotEmpty
            ? propertiesMarkers.add(Marker(
                markerId: MarkerId("${prop.id}"),
                position: LatLng(prop.latitude, prop.longitude),
                icon: await TextPrice(
                  price: prop.price,
                  currency: prop.currency,
                  auction: prop.isAuction,
                  type: prop.featured
                      ? MapAdType.premium
                      : (prop.show ? MapAdType.other : MapAdType.primary),
                ).toBitmapDescriptor(),
                onTap: () =>
                    optionalAlertDialog(context: context, property: prop)))
            : propertiesMarkers.add(Marker(
                markerId: MarkerId("${prop.id}"),
                position: LatLng(prop.latitude, prop.longitude),
                icon: await TextPrice(
                  price: prop.price,
                  currency: prop.currency,
                  auction: prop.isAuction,
                  type: prop.featured
                      ? MapAdType.premium
                      : (prop.show ? MapAdType.other : MapAdType.primary),
                ).toBitmapDescriptor(),
                onTap: () =>
                    optionalAlertDialog(context: context, property: prop)));
      }
    }

    currentLocation = selectedCity != null
        ? LatLng(selectedCity!.latitude, selectedCity!.longitude)
        : properties.isNotEmpty
            ? LatLng(properties.first.latitude, properties.first.longitude)
            : locationCustom;
    CameraPosition kLake = CameraPosition(
      target: currentLocation,
      zoom: 12,
    );
    final GoogleMapController controller = await mapController.future;
    try {
      await controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
    } catch (e) {
      log('Error during map creation: $e');
    }
    Future.delayed(const Duration(seconds: 2)).then((value) => showAllMap = false);

    isLoading = false;
    notifyListeners();
  }

  gotToCountries({required BuildContext context}) async {
    showCitiesMarkers = true;
    selectedCity=null;
    propertiesMarkers.clear();
    properties.clear();
    CameraPosition kLake = CameraPosition(target: locationCustom, zoom: cameraZoom,);
    final GoogleMapController controller = await mapController.future;
    try{
      await controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
    }catch(e){
      log(e.toString());
    }
    Future.delayed(const Duration(seconds: 2)).then((value) => showAllMap = true);
    isLoading=false;
    notifyListeners();
  }

  Future<void>onRemoveSelectedCity({required BuildContext context})async {
   CacheHelper.removeData(key:ConstantsKeys.selectedCityIdnMapKey);
   // showLocationPermiosion=false;
  showAllSamePosition=true;
   showCitiesMarkers=true;
  selectedCity=null;
   // provider.showAllMap=true;
   mapType= MapType.normal;
   properties=[];
   notifyListeners();
   context.read<HomeMapProvider>().initDataCitiesMarkers(context: context,notify: true);
  }

  Future<void>onChangeMapType()async {
    mapType= mapType == MapType.normal? MapType.satellite: MapType.normal;
    notifyListeners();
  }

  Future<void> getCurrentLocation({required BuildContext context}) async {
    try {
      LatLng? latLng = await Utils.getCurrentLocationLatLng();
      // showLocationPermiosion=true;
      if (latLng == null) return;

      currentLocation = latLng;
      CameraPosition kLake = CameraPosition(
        target: latLng,
        zoom: 12,
      );


      final GoogleMapController controller = await  mapController.future;
      await controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
    } catch (e) {
      // Handle errors gracefully
      log('Error getting current location: $e');
    }
  }
  optionalAlertDialog({
    required BuildContext context,
    required GeneralPropertyModel property,
  }) =>
      LoadingDialog().widgetAlertDialog(
          context: context,
          widget: AdAlertWidget(
              property: property,
              afterOnTap: () {
                if (property.show) return;
                property.show = true;
                initPropertiesMarkers(context: context);
              }));




  Future<List<GeneralPropertyModel>> getProperties(
      {required BuildContext context,
        bool? isNotify,
        int? cityId,
        int? categoryId,
        int? floor,
        int? bathroomsNo,
        int? roomsNo,
        double? propertySize,
        double? minPrice,
        double? maxPrice,
        int? finishingTypeId,
        required bool isAuction,
        bool? forSale,
        bool? forRent,
        bool? monthly,
        bool? annex,
        bool? carEntrance,
        bool? elevator,
        bool? airConditioners,
        bool? waterAvailability,
        bool? electricityAvailability,
        bool? swimmingPool,
        bool? footballField,
        bool? volleyballCourt,
        bool? amusementPark,
        bool? familySection,
        int? kitchensNo,
        int? receptionsNo,
        int? apartmentsNo,
        bool? feminine,
        int? storesNo,
        int? floorsNo,
        int? buildingAge,
        List<String>? direction,
        double? streetWidth}) async {
    isLoading = true;
    properties = [];
    propertiesMarkers .clear();
    if (isNotify != false) notifyListeners();

    // ignore: use_build_context_synchronously
    properties = await _api.getProperties(
        context: context,
        cityId: cityId,
        categoryId: categoryId,
        floor: floor,
        bathroomsNo: bathroomsNo,
        roomsNo: roomsNo,
        propertySize: propertySize,
        receptionsNo: receptionsNo,
        apartmentsNo: apartmentsNo,
        storesNo: storesNo,
        buildingAge: buildingAge,
        streetWidth: streetWidth,
        direction: direction,
        monthly: monthly,
        waterAvailability: waterAvailability,
        volleyballCourt: volleyballCourt,
        swimmingPool: swimmingPool,
        carEntrance: carEntrance,
        footballField: footballField,
        feminine: feminine,
        familySection: familySection,
        airConditioners: airConditioners,
        amusementPark: amusementPark,
        annex: annex,
        elevator: elevator,
        electricityAvailability: electricityAvailability,
        forRent: forRent,
        forSale: forSale,
        kitchensNo: kitchensNo,
        floorsNo: floorsNo,
        minPrice: minPrice,
        maxPrice: maxPrice,
        finishingTypeId: finishingTypeId,
        isAuction: isAuction);
    isLoading = false;
    notifyListeners();

    return properties;
  }
}
