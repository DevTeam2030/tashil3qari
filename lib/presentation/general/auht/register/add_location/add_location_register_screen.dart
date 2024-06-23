import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/app/validator.dart';
import 'package:tashil_agary/components/buttons/back_button.dart';
import 'package:tashil_agary/components/buttons/text_button.dart';
import 'package:tashil_agary/components/screen_loading.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/components/text_field/text_field_imports.dart';
import 'package:tashil_agary/providers/auth_provider.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

import '../../../../../app/contants.dart';
import '../../../../../domain/model/models/auth/register_model.dart';
import '../../../../../domain/model/models/country_model.dart';
import '../../../../../providers/general_provider.dart';
import '../../widgets/add_country_widget.dart';
import '../../widgets/bar_title_value.dart';
import '../../widgets/loginImage.dart';
import '../../widgets/selected_city.dart';
import 'add_location_register_data.dart';



class AddLocationRegisterScreen extends StatefulWidget {
  final RegisterModel registerModel;
  const AddLocationRegisterScreen({super.key,required this.registerModel,});

  @override
  State<AddLocationRegisterScreen> createState() => _AddLocationRegisterScreenState();
}

class _AddLocationRegisterScreenState extends State<AddLocationRegisterScreen> {

   late AddLocationRegisterData _addLocationRegisterData;
   bool isConsultant=false;
   List<CountryModel>selectedCountries =[];
   List<CityCountryModel>selectedCities =[];
   @override
   void initState() {
     super.initState();
     _addLocationRegisterData=AddLocationRegisterData(registerModel: widget.registerModel);
     isConsultant=widget.registerModel.type==UserType.consultant;
     if(isConsultant){
       for(var item in Constants.settingModel.countries){
         if(item.cities.isEmpty)break;
         if(!selectedCountries.contains(item)){
           selectedCountries.add(item);
           selectedCities.add(CityCountryModel(id: item.cities.first.id,
               countryId: item.id, name: item.cities.first.name));
           break;
         }
       }
     }
     getCurrentLocation();
   }

   @override
   void dispose() {
     _addLocationRegisterData.mapController.future.then((controller) => controller.dispose());
     _addLocationRegisterData.searchController.dispose();
     super.dispose();

   }

  @override
  Widget build(BuildContext context) {
    return Material(
      child:Stack(
          children: [
          const LoginImage(),
          Scaffold(
              backgroundColor: ColorManager.transparent,
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyTextButton(title: 'Continue'.tr(),
                      size: Size( .8.sw,  47),
                      radius: 8,
                      fontWeightType: FontWeightType.bold,
                      titleSize: FontSize.s18,
                      primaryColor: ColorManager.primary,
                      titleColor: ColorManager.white,
                      onPressed: ()=>!isConsultant?_addLocationRegisterData.followUser(context: context):
                      _addLocationRegisterData.followConsultant(context: context,countries: selectedCountries,
                          cities: selectedCities),
                            )

                  ],
                ),
              ),
              body:Consumer<GeneralProvider>(
                  builder: (context, generalProvider, child) =>  Consumer<AuthProvider>(
                      builder: (context, provider, child) =>  InkWell(
                        splashColor:ColorManager.white,
                        focusColor: ColorManager.white,
                        onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
                        child: ScreenLoading(
                          isLoading: provider.isLoading,
                          child: Container(
                            height: 1.0.sh,
                            width: 1.0.sw,
                            margin:returnPadding(),
                            child:  SizedBox(
                              child:SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const AppSizeBox(height: AppSize.s60),
                                    if(Navigator.canPop(context))
                                       Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          BackAppBarButton(),

                                        ],
                                      ),
                                    // const AppSizeBox(height: AppSize.s20),


                                    const AppSizeBox(height: AppSize.s30),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          BarTitleValue(
                                            title: 'AddYourSite'.tr(),
                                            subtitle:isConsultant?'locationRealEstateMessage'.tr():'AddYourSiteMessage'.tr() ,
                                            width: .75.sw,
                                          ),


                                          // if(isConsultant)const AppSizeBox(width: 10,),
                                          // if(isConsultant)
                                          //   InkWell(
                                          //     splashColor: ColorManager.white,
                                          //     highlightColor:ColorManager.white ,
                                          //     onTap: (){
                                          //
                                          //
                                          //       for(var item in Constants.settingModel.countries){
                                          //         if(item.cities.isEmpty)break;
                                          //         if(!selectedCountries.contains(item)){
                                          //           selectedCountries.add(item);
                                          //           selectedCities.add(CityCountryModel(id: item.cities.first.id,
                                          //               countryId: item.id, name: item.cities.first.name));
                                          //
                                          //           provider.notify();
                                          //           break;
                                          //         }
                                          //       }
                                          //
                                          //
                                          //     } ,
                                          //     child: Container(
                                          //       // height: 20,
                                          //       // width: 20,
                                          //       margin: const EdgeInsets.all(4),
                                          //       padding: const EdgeInsets.all(4),
                                          //       decoration: BoxDecoration(
                                          //         borderRadius: BorderRadius.circular(RadiusManager.r4),
                                          //         color: ColorManager.primary,
                                          //       ),
                                          //       child: Icon(
                                          //         Icons.add,
                                          //         color: ColorManager.white,
                                          //         size: 16,
                                          //       ),
                                          //     ),
                                          //   ),
                                        ],
                                      ),
                                    ),






                                    const AppSizeBox(height: AppSize.s25),

                                    if(isConsultant)
                                      Column(
                                        children: [

                                          for(var country in selectedCountries)
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 6),
                                              child: Column(
                                                children: [
                                                  // Row(
                                                  //   mainAxisAlignment: MainAxisAlignment.end,
                                                  //   children: [
                                                  //     InkWell(
                                                  //       splashColor: ColorManager.white,
                                                  //       highlightColor:ColorManager.white ,
                                                  //       onTap: (){
                                                  //         selectedCountries.remove(country);
                                                  //         selectedCities.removeWhere((element) => element.countryId==country.id);
                                                  //
                                                  //         provider.notify();
                                                  //
                                                  //
                                                  //       } ,
                                                  //       child: Container(
                                                  //         // height: 20,
                                                  //         // width: 20,
                                                  //         margin: const EdgeInsets.all(4),
                                                  //         padding: const EdgeInsets.all(4),
                                                  //         decoration: BoxDecoration(
                                                  //           borderRadius: BorderRadius.circular(RadiusManager.r4),
                                                  //           color: ColorManager.primary,
                                                  //         ),
                                                  //         child: Icon(
                                                  //           Icons.remove,
                                                  //           color: ColorManager.white,
                                                  //           size: 16,
                                                  //         ),
                                                  //       ),
                                                  //     ),
                                                  //   ],
                                                  // ),
                                                  RealStateAddCountryDropdownButton(
                                                    selectedCountry: country,
                                                    selectedCities:selectedCities,
                                                    onSelectedCity: (v) {
                                                      if(v==null)return;
                                                      if(selectedCities.contains(v)){
                                                        selectedCities.remove(v);
                                                      }else{
                                                        selectedCities.add(v);
                                                      }
                                                      provider.notify();
                                                      // if(v==null)return;
                                                      // if(v==country)return;
                                                      //
                                                      //   for(var item in selectedCities){
                                                      //     if(item.countryId==country.id){
                                                      //       selectedCities.remove(item);
                                                      //     }
                                                      //   }
                                                      // country=v;
                                                      //   selectedCities.add(CityCountryModel(id: country.cities.first.id,
                                                      //       countryId: country.id, name:country.cities.first.name));

                                                    },
                                                  ),
                                                  for(var item in selectedCities.where((element) => element.countryId==country.id))
                                                    SelectedCityWidget(
                                                      city: item,
                                                      onRemove: (){
                                                        selectedCities.remove(item);
                                                        provider.notify();
                                                      },
                                                    )
                                                ],
                                              ),
                                            ),


                                          // RealStateCitiesDropdownButton(
                                          //   selectedCity:selectedCites.isNotEmpty?selectedCites.last: selectedCity,
                                          //   onChanged: (v) {
                                          //     setState(() {
                                          //       selectedCity=v;
                                          //       if(!selectedCites.contains(v)&&v!=null) selectedCites.add(v);
                                          //     });
                                          //   },
                                          // ),

                                          // const AppSizeBox(height: 10,),
                                          // for(String item in selectedCites)
                                          //   Container(
                                          //     margin: EdgeInsets.symmetric(vertical: 4),
                                          //     padding: const EdgeInsets.symmetric(vertical: PaddingManager.p10, horizontal: PaddingManager.p16),
                                          //     width: 1.0.sw,
                                          //     // height: value ? 280 : 45,
                                          //     decoration: BoxDecoration(
                                          //       borderRadius: BorderRadius.circular(RadiusManager.r12),
                                          //       border: Border.all(color: ColorManager.grey, width: 1),
                                          //       color: ColorManager.textGrey,
                                          //       // boxShadow: Constants.kBoxShadow
                                          //     ),
                                          //     child: InkWell(
                                          //       onTap: () {
                                          //         setState(() {
                                          //           selectedCites.remove(item);
                                          //         });
                                          //       },
                                          //       child: Row(
                                          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //         children: [
                                          //           Row(
                                          //             mainAxisAlignment: MainAxisAlignment.start,
                                          //             children: [
                                          //               Icon(
                                          //                 Icons.location_on,
                                          //                 color: ColorManager.icons,
                                          //                 size: 16,
                                          //               ),
                                          //               AppSizeBox(
                                          //                 width: 4,
                                          //               ),
                                          //               AppText(
                                          //                 title: item,
                                          //                 titleSize: FontSize.s14,
                                          //                 titleAlign: TextAlign.start,
                                          //                 titleHeight: 1.4,
                                          //                 titleMaxLines: 4,
                                          //                 titleColor: ColorManager.black,
                                          //                 fontWeightType: FontWeightType.medium,
                                          //               ),
                                          //
                                          //             ],
                                          //           ),
                                          //
                                          //           Container(
                                          //             decoration: BoxDecoration(
                                          //               borderRadius: BorderRadius.circular(RadiusManager.r4),
                                          //               color: ColorManager.transparent,
                                          //               border: Border.all(color: ColorManager.icons, width: 1),
                                          //             ),
                                          //             child: Icon(
                                          //               Icons.remove,
                                          //               color: ColorManager.icons,
                                          //               size: 16,
                                          //             ),
                                          //           ),
                                          //         ],
                                          //       ),
                                          //     ),
                                          //   ),

                                        ],
                                      )
                                    else Column(
                                      children: [
                                        DefaultTextFormField(
                                          controller: _addLocationRegisterData.searchController,
                                          hintTitle: 'AddYourSite'.tr(),
                                          labelTitle: 'AddYourSite'.tr(),
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.text,
                                          hintFontSize: FontSize.s12,
                                          hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                          textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                          textSize: FontSize.s12,
                                          fillColor: ColorManager.textGrey,
                                          borderColor: ColorManager.textGrey,
                                          borderRadius: RadiusManager.r10,
                                          prefixIcon: const Icon(Icons.location_on,color: ColorManager.icons,size: AppSize.s20,),
                                          validator: (v) {},
                                        ),


                                        Container(
                                          height: .4.sh,
                                          width: 1.0.sw,
                                          margin: const EdgeInsets.only(top: AppSize.s20),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(AppSize.s20),
                                            color: ColorManager.textGrey,
                                          ),
                                          child:   Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(AppSize.s20),
                                                child: GoogleMap(
                                                  mapType: MapType.normal,
                                                  zoomControlsEnabled: false,
                                                  initialCameraPosition: CameraPosition(
                                                    target: _addLocationRegisterData.currentLocation,
                                                    zoom: 12,
                                                  ),
                                                  markers:_addLocationRegisterData.markers,
                                                  // polygons: polygon(),
                                                  onTap: (LatLng latLng){
                                                    Marker marker = Marker(
                                                      markerId: MarkerId(latLng.latitude.toString()),
                                                      position: latLng,
                                                      onTap: () async {

                                                      },
                                                      infoWindow: InfoWindow(
                                                        title: '${latLng.latitude} , ${latLng.longitude}',
                                                      ),
                                                    );
                                                    _addLocationRegisterData.currentLocation=latLng;
                                                    _addLocationRegisterData.markers={marker};
                                                    setState(() {});
                                                  },
                                                  onMapCreated: (GoogleMapController controller) {
                                                    _addLocationRegisterData.mapController.complete(controller);
                                                    // setState(() {});
                                                  },
                                                ),
                                              ),

                                              Align(
                                                alignment: Alignment.bottomCenter,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(bottom:15),
                                                  child: MyTextButton(title: 'Choose your location from map'.tr(),
                                                      size: Size( .8.sw,  47),
                                                      radius: 8,
                                                      fontWeightType: FontWeightType.medium,
                                                      titleSize: FontSize.s12,
                                                      primaryColor: ColorManager.fff.withOpacity(.9),
                                                      titleColor: ColorManager.text,
                                                      onPressed: ()=>getCurrentLocation()),
                                                ),
                                              ),
                                            ],
                                          ),

                                        ),
                                      ],
                                    ),



                                    //  AppSizeBox(height: .13.sh),
                                    // MyTextButton(title: 'Continue'.tr(),
                                    //   size: Size( .8.sw,  47),
                                    //   radius: 8,
                                    //   fontWeightType: FontWeightType.bold,
                                    //   titleSize: FontSize.s18,
                                    //   primaryColor: ColorManager.primary,
                                    //   titleColor: ColorManager.white,
                                    //   onPressed: ()=>_addLocationRegisterData.follow(context: context),),

                                    const AppSizeBox(height: AppSize.s20),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                  )
              )


          ),
        ],
      ),
    );
  }


   Future<void> getCurrentLocation() async {
     try {
       if(isConsultant)return;
       // LatLng? latLng =await Utils.getCurrentLocationLatLng();
       LatLng? latLng =LatLng(40.153474463955796, 35.33852195739747);
       if(latLng==null)return;
       _addLocationRegisterData.currentLocation=latLng;
       CameraPosition kLake = CameraPosition(
         target: _addLocationRegisterData.currentLocation,
         zoom: 12,
       );
       final GoogleMapController controller = await _addLocationRegisterData.mapController.future;
       await controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
       // animateTo(latLng.latitude,latLng.longitude);

       Marker marker = Marker(
         markerId: MarkerId(_addLocationRegisterData.currentLocation.latitude.toString()),
         position: _addLocationRegisterData.currentLocation,
         // icon: icon,
         onTap: () async {},
         infoWindow: InfoWindow(
           title: '${_addLocationRegisterData.currentLocation.latitude} , ${_addLocationRegisterData.currentLocation.longitude}',
         ),
       );
       _addLocationRegisterData.markers={marker};
       setState(() {});
     } catch (e) {
       // Handle errors gracefully
       print('Error getting current location: $e');
     }
   }

   Future<void> animateTo(double lat, double lng) async {
     GoogleMapController  c = await _addLocationRegisterData.mapController.future;
     final p = CameraPosition(target: LatLng(lat, lng), zoom: 14.4746);
     c.animateCamera(CameraUpdate.newCameraPosition(p));
   }
}
