import 'dart:async';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import '../../../../../app/contants.dart';
import '../../../../../app/enums.dart';
import '../../../../../components/loading_manager.dart';
import '../../../../../domain/model/models/auth/register_model.dart';
import '../../../../../domain/model/models/country_model.dart';
import '../../../../../domain/model/models/register_request_body.dart';
import '../../../../../providers/auth_provider.dart';
import '../../../../../utilites/color_manager.dart';
import '../../../../../utilites/font_manager.dart';
import '../../../../../utilites/image_manager.dart';
import '../../../../../utilites/route_manager.dart';
import '../../../../../utilites/styles_manager.dart';
import '../../../../../utilites/values_manager.dart';
import '../../../../dashboard/dash_board_screen.dart';
import '../fill_personal_data/fill_personal_data_register_data.dart';

class AddLocationRegisterData {
  late RegisterModel registerModel;

  AddLocationRegisterData({required this.registerModel});

  // final formKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();

  Set<Marker> markers = {};
  Completer<GoogleMapController> mapController = Completer();
  LatLng p1 = const LatLng(40.153474463955796, 35.33852195739747);
  LatLng currentLocation =  LatLng(23.8859, 45.0792);


  String googleApikey = Constants.mapKey;

  //GoogleMapController? mapController; //contrller for Google map
  CameraPosition? cameraPosition;

  //LatLng startLocation = LatLng(27.6602292, 85.308027);
  String location = "Search Location";

  followUser(
      {required BuildContext context,}) async {
    FocusScope.of(context).requestFocus(FocusNode());
    UpdateUserLocationRequestModel updateLocationRequestModel =
    UpdateUserLocationRequestModel(id: registerModel.id, addresses: [
      RegisterUserCityModel(
        longitude: currentLocation.longitude.toString(),
        latitude: currentLocation.latitude.toString(),
      )
    ]);
    context.read<AuthProvider>().updateUserLocation(context: context, model: updateLocationRequestModel);
  }

  followConsultant(
      {required BuildContext context,
      required List<CountryModel> countries,
      required List<CityCountryModel> cities
      }) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if(cities.isEmpty){
      LoadingDialog.showToastNotification('PleaseEnterCountriesCities'.tr());
      return;
    }
    UpdateLocationRequestModel updateLocationRequestModel = UpdateLocationRequestModel(
        id: registerModel.id,
        addresses: cities.map((e) => RegisterCityModel(
          cityId: e.id,
          longitude: currentLocation.longitude.toString(),
          latitude: currentLocation.latitude.toString(),
        )).toList());
    context
        .read<AuthProvider>().updateConsultantLocation(context: context, model: updateLocationRequestModel);
  }
}
