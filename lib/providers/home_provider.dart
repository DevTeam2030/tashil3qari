import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/cache_helper.dart';
import 'package:tashil_agary/domain/controller/home_controller.dart';
import 'package:tashil_agary/domain/controller/search_controller.dart';
import 'package:tashil_agary/domain/model/models/country_model.dart';
import 'package:tashil_agary/domain/model/models/home_catogery_model.dart';
import 'package:tashil_agary/presentation/general/home_Screen/widgets/widget_imports.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

import '../app/contants.dart';
import '../app/enums.dart';
import '../components/loading_manager.dart';
import '../domain/model/models/general_property_model.dart';
import '../presentation/general/home_Screen/home_imports.dart';
import 'general_provider.dart';


class HomeProvider extends ChangeNotifier {
  final HomeController _api=HomeController();
  final SearchApiController _apiSearch=SearchApiController();
bool isLoading=false;
  List<GeneralPropertyModel>properties=[];
  // List<FinishingTypesModel>finishingTypes=[];
  // List<HomeCatogeryModel> categories=[];
  //-------------------------------------------------
  double cameraZoom=4.5;
  Set<Marker> markers = {};
  Set<Marker> allCitiesMarkers = {};
  Completer<GoogleMapController> mapController = Completer();

  // LatLng p1 = const LatLng(40.153474463955796, 35.33852195739747);
  LatLng locationCustom = const LatLng(23.8859, 45.0792);
  LatLng currentLocation = const LatLng(23.8859, 45.0785);
  AdType? selectedAdType;
  ValueNotifier<bool> monthly = ValueNotifier<bool>(false);
  // AdType selectedAdType= AdType.forSale;
  String googleApikey = Constants.mapKey;
  MapType mapType = MapType.normal;

  //GoogleMapController? mapController; //contrller for Google map
  CameraPosition? cameraPosition;

  //LatLng startLocation = LatLng(27.6602292, 85.308027);
  String location = "Search Location";

  ValueNotifier<bool> openSearch = ValueNotifier<bool>(false);
  ValueNotifier<HomeCatogeryModel?> selectedCategory = ValueNotifier<HomeCatogeryModel?>(null);
  // ValueNotifier<HomeCatogeryModel> selectedCategory = ValueNotifier<HomeCatogeryModel>(Constants.settingModel.categories.first);
  ValueNotifier<CityModel?> selectedCity = ValueNotifier<CityModel?>(null);
  ValueNotifier<bool> showAuctionOnMap = ValueNotifier<bool>(false);
  bool showCitiesMarkers = true;
  bool showAllMap = true;




  getByCategory({required BuildContext context, required HomeCatogeryModel? category}) async {
    // if (selectedCategory.value == category) return;
    selectedCategory.value = category;
    showCitiesMarkers = false;


    await getProperties(context: context,
        isAuction: showAuctionOnMap.value,
        forSale: selectedAdType == AdType.forSale,
        forRent: selectedAdType == AdType.forRent,
        cityId: selectedCity.value?.id,
        categoryId: category?.id)
        .then((value) => initPropertiesMarkers(context: context));
  }


  optionalAlertDialog({required BuildContext context, required GeneralPropertyModel property,}) {
    LoadingDialog().widgetAlertDialog(
        context: context,
        widget: AdAlertWidget(
            property: property,
            afterOnTap: () {
              if (property.show) return;
              property.show = true;
              initPropertiesMarkers(context: context);
            }

        ));
  }

  initDataCitiesMarkers({required BuildContext context, }) async {
    try {

      var country = context.read<GeneralProvider>().mapCountry;
      int? savedCityBefore=CacheHelper.getData(key: ConstantsKeys.selectedCityIdnMapKey);
      if(savedCityBefore!=null){
        selectedCity.value=country.cities.firstWhere((element) => element.id==savedCityBefore);
        showCitiesMarkers = false;
        // CameraPosition kLake = CameraPosition(
        //   // bearing: 192.8334901395799,
        //   // target: currentLocation,
        //   target: currentLocation,
        //   //tilt: 59.440717697143555,
        //   zoom: cameraZoom,
        // );
        // final GoogleMapController controller = await mapController.future;
        // await controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
        // isLoading=true;
        // notifyListeners();

        print(properties.length.toString() +' xxxxx');
        log('xxxx dddddddddddddddddddddddddddddd');

        if(properties.isEmpty)
        await getProperties(
          context: context,
          forSale: selectedAdType == AdType.forSale,
          forRent: selectedAdType == AdType.forRent,
          cityId: selectedCity.value!.id,
          isNotify: false,
          isAuction: showAuctionOnMap.value,).then((value) => initPropertiesMarkers(context: context));
        else initPropertiesMarkers(context: context);

      }
      else{
        log('xxxx ffffffffffffffffffffffffffffffff');
        showAllMap = true;
        properties=[];

        if (allCitiesMarkers.isEmpty) {
          log('xxxx sssssssssssssssssssssss');
          for (var city in country.cities) {
            allCitiesMarkers.add(Marker(
                markerId: MarkerId("${city.id}"),
                position: LatLng(city.latitude, city.longitude),
                icon: await TextBoxWidget(
                  text: city.name,
                ).toBitmapDescriptor(
                  // logicalSize: const Size(150, 150),
                  // imageSize: const Size(150, 150)
                ),
                onTap: () async {
                  showCitiesMarkers = false;
                  selectedCity.value = city;
                  CacheHelper.saveData(key: ConstantsKeys.selectedCityIdnMapKey, value: city.id);
                  await getProperties(
                    context: context,
                    forSale: selectedAdType == AdType.forSale,
                    forRent: selectedAdType == AdType.forRent,
                    cityId: city.id,
                    isAuction: showAuctionOnMap.value,).then((value) => initPropertiesMarkers(context: context));
                }));
          }
        }
        isLoading=false;
        notifyListeners();
        final GoogleMapController controller = await mapController.future;

        // Constants.buildAllCitiesMarkersBefore = true;
        // var city = country.cities.isNotEmpty ? country.cities.first : context.read<GeneralProvider>().userCity;
        // currentLocation = LatLng(city.latitude, city.longitude);
        CameraPosition kLake = CameraPosition(
          // bearing: 192.8334901395799,
          // target: currentLocation,
          target: currentLocation,
          //tilt: 59.440717697143555,
          zoom: cameraZoom,
        );
        await controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
        isLoading=false;
        notifyListeners();

      }



    } catch (e) {

    }
  }


  gotToCountries({required BuildContext context}) async {
    showCitiesMarkers = true;

    // selectedCity.value = null;
    // var country = context.read<GeneralProvider>().mapCountry;
    // var city = country.cities.isNotEmpty ? country.cities.first : context.read<GeneralProvider>().userCity;
    // var currentLocation = LatLng(city.latitude, city.longitude);
    CameraPosition kLake = CameraPosition(
      // bearing: 192.8334901395799,
      target: currentLocation,
      //tilt: 59.440717697143555,
      zoom: cameraZoom,
    );
    final GoogleMapController controller = await mapController.future;
    try{
      await controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
    }catch(e){
      print(e.toString());
    }
    Future.delayed(const Duration(seconds: 2)).then((value) =>
    showAllMap = true);
    isLoading=false;
    notifyListeners();
  }


  getMarkerTap({required BuildContext context, required CityModel city}) async {
    showCitiesMarkers = false;
    selectedCity.value = city;
    await getProperties(context: context,
      forSale: selectedAdType == AdType.forSale,
      forRent: selectedAdType == AdType.forRent,
      cityId: city.id,
      isAuction: showAuctionOnMap.value,).then((value) =>
        initPropertiesMarkers(context: context));
  }

  bool showAllSamePosition=true;
  initPropertiesMarkers({required BuildContext context,}) async {
    isLoading=true;
    markers = {};

    print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
    for (var prop in properties) {
      var marks=markers.where((element) => element.position.latitude==prop.latitude
          &&element.position.longitude==prop.longitude).toList();
      var numbers=properties.where((element) => element.latitude==prop.latitude
          &&element.longitude==prop.longitude).toList();
      if(marks.isNotEmpty&&showAllSamePosition){
        Marker  m=marks.first;
        markers.removeAll(marks);
        markers.add(Marker(
            markerId: MarkerId("${m.markerId.value}"),
            position: LatLng(m.position.latitude, m.position.longitude),
            icon: await MoreIcon(number:numbers.length ,).toBitmapDescriptor(),
            onTap: (){
              showAllSamePosition=false;
              initPropertiesMarkers(context: context);
            } ));
      }
      else{

        marks.isNotEmpty?
        markers.add(Marker(
            markerId: MarkerId("${prop.id}"),
            position: LatLng(prop.latitude, prop.longitude),
            icon: await TextPrice(price: '${prop.price}',
              currency: prop.currency,
              auction: prop.isAuction,
              type: prop.featured ? MapAdType.premium : (prop.show ? MapAdType
                  .other : MapAdType.primary),
            ).toBitmapDescriptor(),
            onTap: () => optionalAlertDialog(context: context, property: prop))):
        markers.add(Marker(
            markerId: MarkerId("${prop.id}"),
            position: LatLng(prop.latitude, prop.longitude),
            icon: await TextPrice(price: '${prop.price}',
              currency: prop.currency,
              auction: prop.isAuction,
              type: prop.featured ? MapAdType.premium : (prop.show ? MapAdType
                  .other : MapAdType.primary),
            ).toBitmapDescriptor(),
            onTap: () => optionalAlertDialog(context: context, property: prop)));
      }




    }
    // var country = context.read<GeneralProvider>().mapCountry;
    // var city = country.cities.isNotEmpty ? country.cities.first : context.read<GeneralProvider>().userCity;
    // currentLocation =properties.isNotEmpty?LatLng(properties.first.latitude, properties.first.longitude): LatLng(city.latitude, city.longitude);


    currentLocation =
    selectedCity.value!=null?
    LatLng(selectedCity.value!.latitude, selectedCity.value!.longitude):
    properties.isNotEmpty?
    LatLng(properties.first.latitude, properties.first.longitude): locationCustom;
    // currentLocation = LatLng(city.latitude, city.longitude);
    CameraPosition kLake = CameraPosition(
      // bearing: 192.8334901395799,
      target: currentLocation,
      //tilt: 59.440717697143555,
      zoom: 12,
    );

    final GoogleMapController controller = await mapController.future;
  try{
    await controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
  }catch(e){

  }
    Future.delayed(const Duration(seconds: 2)).then((value) =>
    showAllMap = false);

    isLoading=false;
    notifyListeners();
  }




















  //----------------------------

changeLoading([bool? isloading,bool? isNotify]){
  // isLoading=!isLoading;
  isLoading=isloading??false;
  if(isNotify!=false)
  notifyListeners();
}




  Future< List<GeneralPropertyModel>>getProperties({required BuildContext context,bool?isNotify,
    int? cityId,int? categoryId,
    int? floor,int? bathroomsNo,int? roomsNo,double? propertySize,double? minPrice,double? maxPrice,
    int? finishingTypeId,required bool isAuction, bool? forSale,bool? forRent,bool? monthly,
    bool? annex, bool? carEntrance, bool? elevator, bool?  airConditioners, bool? waterAvailability,
    bool? electricityAvailability,
    bool? swimmingPool, bool?  footballField, bool?  volleyballCourt, bool?  amusementPark,
    bool? familySection,
    int? kitchensNo, int? receptionsNo,int?apartmentsNo,bool?feminine,int? storesNo,int? floorsNo,
    int?buildingAge,
    List<String>? direction,double? streetWidth})async{
    isLoading=true;
    properties=[];
    if(isNotify!=false) notifyListeners();

    // ignore: use_build_context_synchronously
    properties=await _api.getProperties(context: context,cityId: cityId,categoryId: categoryId,
        floor: floor,bathroomsNo: bathroomsNo,roomsNo: roomsNo,propertySize: propertySize,
        receptionsNo: receptionsNo,apartmentsNo: apartmentsNo,storesNo: storesNo,buildingAge: buildingAge,
        streetWidth: streetWidth,direction: direction,monthly: monthly,
        waterAvailability: waterAvailability,volleyballCourt: volleyballCourt,
        swimmingPool: swimmingPool,carEntrance: carEntrance,footballField: footballField,feminine:feminine ,
        familySection:familySection ,airConditioners: airConditioners,amusementPark: amusementPark,annex:annex,
        elevator:elevator , electricityAvailability:electricityAvailability ,
        forRent: forRent,forSale: forSale,kitchensNo: kitchensNo,floorsNo: floorsNo,
        minPrice: minPrice,maxPrice: maxPrice,finishingTypeId: finishingTypeId,isAuction:isAuction );
    isLoading=false;
    notifyListeners();

    return properties;
  }

  // Future<void>getFinishingTypes({required BuildContext context,bool?isNotify,int? cityId})async{
  //   isLoading=true;
  //   if(isNotify!=false) notifyListeners();
  //
  //   // ignore: use_build_context_synchronously
  //   finishingTypes=await _api.getFinishingTypes(context: context);
  //   isLoading=false;
  //   notifyListeners();
  //
  // }
  //
  // Future<void>getCategories({required BuildContext context,bool?isNotify,})async{
  //   isLoading=true;
  //   if(isNotify!=false) notifyListeners();
  //
  //   // ignore: use_build_context_synchronously
  //   var data=await _api.getCategories(context: context);
  //   categories=[HomeCatogeryModel(id: 0,name: 'all'.tr())];
  //   categories.addAll(data);
  //   isLoading=false;
  //   notifyListeners();
  //
  // }


  // Future<void>getHomeData({required BuildContext context})async{
  //   // if(homeModel.categories.isEmpty) isLoading=true;
  //   //
  //   // // notifyListeners();
  //   //
  //   // // ignore: use_build_context_synchronously
  //   // homeModel=await _api.getHomeData(context: context,);
  //   // isLoading=false;
  //   // notifyListeners();
  //   return;
  //   // ignore: use_build_context_synchronously
  //   if(Constants.userDataModel!=null&&Constants.isLogin) {
  //    // ignore: use_build_context_synchronously
  //    Constants.navigatorAppKey.currentContext?.read<NotificationsProvider>().getCountUnreadNotification(context: context);
  //
  //   }
  //
  // }



}
