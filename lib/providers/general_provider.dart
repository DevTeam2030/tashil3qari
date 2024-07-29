import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/utils.dart';
import '../app/contants.dart';
import '../domain/controller/general_controller.dart';
import '../domain/model/models/add_complaint_request_body.dart';
import '../domain/model/models/country_model.dart';
import '../domain/model/models/setting_model.dart';
import '../presentation/dashboard/dash_board_screen.dart';
import '../utilites/route_manager.dart';



class GeneralProvider extends ChangeNotifier {
  final GeneralController _api=GeneralController();
  bool isLoading=false;
  // List<CountryModel> countries=[];
  // List<CityModel> cities=[];
  late CountryModel userCountry;
  late CountryModel mapCountry; // -- to show data on map for this country
  late CityModel userCity;

  Future<void>notify()async{
    isLoading=true;
    isLoading=false;
    notifyListeners();

  }





  // to set country for map
  setUserCountry({required SettingModel setting}){
  if(Constants.userDataModel==null) {
    userCountry = Constants.settingModel.countries.first;
    userCity = userCountry.cities.first;
    mapCountry =userCountry;
    return;
  }
    if (Constants.userDataModel!.address.isNotEmpty) {
      var countryId = Constants.userDataModel!.address.first.countryId;
      var cityId = Constants.userDataModel!.address.first.cityId;
      try {
        userCountry = setting.countries.firstWhere((element) => element.id == countryId);
      } catch (e) {

        userCountry = setting.countries.first;
      }

      try {
        userCity = userCountry.cities.firstWhere((element) => element.id == cityId);
      } catch (e) {
        userCity = userCountry.cities.first;
      }
    } else {
      userCountry = setting.countries.first;
      userCity = userCountry.cities.first;
    }

  mapCountry =userCountry;
  }


  // Future<void>getCountries({required BuildContext context,required bool isNotify})async{
  //   isLoading=true;
  //   countries=[];
  //   cities=[];
  //   if(isNotify)  notifyListeners();
  //   countries=await _api.getCountries(context: context,);
  //   isLoading=false;
  // notifyListeners();
  // for(var country in countries){
  //   Utils.precacheImageNetwork(country.cities.map((e) => e.image).toList(),);
  // }
  //
  //
  //
  // // if(countries.isNotEmpty) getCities(context: context,isNotify: isNotify,country: countries.first);
  // }
  // Future<void>getCities({required BuildContext context,required bool isNotify,required CountryModel country})async{
  //   isLoading=true;
  //   cities=[];
  //   if(isNotify)  notifyListeners();
  //   cities=await _api.getCities(context: context,countryId: country.id);
  //   isLoading=false;
  //   notifyListeners();
  // }


  Set<Marker>  allCitiesMarkers = {};
  Future<void>getSetting({required bool isNotify})async{
    isLoading=true;
    // allCitiesMarkers = {};
    if(isNotify)  notifyListeners();
    BuildContext context=Constants.navigatorAppKey.currentContext!;
    var data=await _api.getSettingData(context: context,);
    Constants.settingModel=data;
    isLoading=false;
    notifyListeners();
    for(var country in data.countries){
      Utils.precacheImageNetwork(country.cities.map((e) => e.image).toList(),);
        // for (var city in country.cities) {
        //   allCitiesMarkers.add(Marker(
        //       markerId: MarkerId("${city.id}"),
        //       position: LatLng(city.latitude, city.longitude),
        //       icon: await TextImage(
        //         text: city.name,
        //         image: city.image,
        //       ).toBitmapDescriptor(
        //         // logicalSize: const Size(150, 150),
        //         // imageSize: const Size(200, 200)
        //       ),
        //       ));
        // }

    }
    // if(allCitiesMarkers.isEmpty){
    //   for (var city in data.countries.first.cities) {
    //     allCitiesMarkers.add(Marker(
    //         markerId: MarkerId("${city.id}"),
    //         position: LatLng(city.latitude, city.longitude),
    //         icon: await TextImage(
    //           text: city.name,
    //           image: city.image,
    //         ).toBitmapDescriptor(
    //           // logicalSize: const Size(150, 150),
    //           // imageSize: const Size(150, 150)
    //         ),
    //         onTap: () async{
    //           showCitiesMarkers=false;
    //           selectedCity.value=city;
    //           await context.read<HomeProvider>().getProperties(context: context,
    //             forSale: selectedAdType==AdType.forSale,
    //             forRent: selectedAdType==AdType.forRent,
    //             cityId: city.id,isAuction:showAuctionOnMap.value,).then((value) =>
    //               initPropertiesMarkers(context: context));
    //
    //         }));
    //   }
    // }
   setUserCountry(setting: data);
      // ignore: use_build_context_synchronously
      MyRoute().navigate(context: context, route: const DashBoardScreen(currentIndexScreen: 0),withReplace: true);

    // if(countries.isNotEmpty) getCities(context: context,isNotify: isNotify,country: countries.first);
  }

  Future<void> sentComplaint({required BuildContext context, required AddComplaintRequestModel model}) async {
    isLoading = true;
    notifyListeners();
    bool data= await _api.sentComplaint(context: context, model: model);
    isLoading = false;
    notifyListeners();
  }
}
