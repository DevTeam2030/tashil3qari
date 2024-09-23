part of 'add_ad_imports.dart';

class AddAdLocationScreen extends StatefulWidget {
  final AddAdtData addAdtData;

  const AddAdLocationScreen({Key? key, required this.addAdtData})
      : super(key: key);

  @override
  State<AddAdLocationScreen> createState() => _AddAdLocationScreenState();
}

class _AddAdLocationScreenState extends State<AddAdLocationScreen> {
  late AddAdtData addAdtData;
  TextEditingController searchController = TextEditingController();
  bool selectedLocationFromMap = false;
  ValueNotifier<bool> agreePledge= ValueNotifier<bool>(false);
  // final ValueNotifier<bool> openMap = ValueNotifier<bool>(false);

  Set<Marker> markers = {};
  Completer<GoogleMapController> mapController = Completer();
  LatLng p1 = const LatLng(40.153474463955796, 35.33852195739747);
  LatLng currentLocation = LatLng(23.8859, 45.0792);

  String googleApikey = Constants.mapKey;

  //GoogleMapController? mapController; //contrller for Google map
  CameraPosition? cameraPosition;

  //LatLng startLocation = LatLng(27.6602292, 85.308027);
  String location = "Search Location";
  List<CountryModel> selectedCountries = [];
  List<CityCountryModel> selectedCities = [];

  @override
  void initState() {
    addCity();
    super.initState();
    addAdtData = widget.addAdtData;
    //getCurrentLocation();
  }

  @override
  void dispose() {
    mapController.future.then((controller) => controller.dispose());
    searchController.dispose();
    super.dispose();
  }
addCity(){
  for (var item in Constants.settingModel.countries) {
    if (item.cities.isEmpty) break;
    if (!selectedCountries.contains(item)) {
      selectedCountries.add(item);
      selectedCities.add(CityCountryModel(
          id: item.cities.first.id,
          countryId: item.id,
          name: item.cities.first.name));
      getCurrentLocation(LatLng(
          item.cities.first.latitude,
          item.cities.first.longitude));
      setState(() {});
      break;
    }
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GeneralAppBar(
            title: 'AddPropertyLocation'.tr(),
            showChatNotify: false,
            showDivider: false),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextButton(
                  title: 'next'.tr(),
                  size: Size(.8.sw, 47),
                  radius: 6,
                  fontWeightType: FontWeightType.bold,
                  titleSize: FontSize.s18,
                  primaryColor: ColorManager.primary,
                  titleColor: ColorManager.white,
                  onPressed: () {
                    if (selectedCountries.isNotEmpty && selectedCities.isNotEmpty) {
                      if(agreePledge.value==false&&Constants.settingModel.appValueAfterSelling>0){
                        LoadingDialog.showToastNotification('pledgeAlert'.tr());
                        return;
                      }
                      addAdtData.selectedCountries = selectedCountries;
                      addAdtData.selectedCities = selectedCities;
                      addAdtData.adLocation = currentLocation;
                      MyRoute().navigate(context: context, route: AddAdRequirementsScreen(addAdtData: addAdtData,));
                    } else {
                      LoadingDialog.showToastNotification('PleaseEnterAllDataCorrectly'.tr());
                    }
                  }),
            ],
          ),
        ),
        body: InkWell(
            splashColor: ColorManager.white,
            focusColor: ColorManager.white,
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Container(
                height: 1.0.sh,
                width: 1.0.sw,
                margin: returnPadding(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // const AppSizeBox(height: 50,),
                      // GeneralAppBar(title: 'AddPropertyLocation'.tr(),
                      //     showChatNotify: false,showDivider: false),
                      const AppSizeBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                              title: 'AddPropertyLocation'.tr(),
                              titleAlign: TextAlign.start,
                              titleMaxLines: 1,
                              fontWeightType: FontWeightType.medium,
                              titleSize: FontSize.s20,
                              titleColor: ColorManager.black),
                          if (selectedCountries.isEmpty)
                            InkWell(
                              splashColor: ColorManager.white,
                              highlightColor: ColorManager.white,
                              onTap: () {
                                for (var item in Constants.settingModel.countries) {
                                  if (item.cities.isEmpty) break;
                                  if (!selectedCountries.contains(item)) {
                                    selectedCountries.add(item);
                                    selectedCities.add(CityCountryModel(
                                        id: item.cities.first.id,
                                        countryId: item.id,
                                        name: item.cities.first.name));
                                    getCurrentLocation(LatLng(
                                        item.cities.first.latitude,
                                        item.cities.first.longitude));
                                    setState(() {});
                                    break;
                                  }
                                }
                              },
                              child: Container(
                                // height: 20,
                                // width: 20,
                                margin: const EdgeInsets.all(4),
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(RadiusManager.r4),
                                  color: ColorManager.primary,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: ColorManager.white,
                                  size: 16,
                                ),
                              ),
                            ),
                        ],
                      ),

                      const AppSizeBox(
                        height: 20,
                      ),
                      for (var country in selectedCountries)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    splashColor: ColorManager.white,
                                    highlightColor: ColorManager.white,
                                    onTap: () {
                                      selectedCountries.remove(country);
                                      selectedCities.removeWhere((element) =>
                                          element.countryId == country.id);
                                      setState(() {});
                                    },
                                    child: Container(
                                      // height: 20,
                                      // width: 20,
                                      margin: const EdgeInsets.all(4),
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            RadiusManager.r4),
                                        color: ColorManager.primary,
                                      ),
                                      child: Icon(
                                        Icons.remove,
                                        color: ColorManager.white,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              RealStateAddCountryDropdownButton(
                                selectedCountry: country,
                                selectedCities: selectedCities,
                                onSelectedCity: (v) {
                                  if (v == null || selectedCities.contains(v))
                                    return;
                                  selectedCities = [v];

                                  var c = country.cities.firstWhere(
                                      (element) => element.id == v.id);
                                  getCurrentLocation(
                                      LatLng(c.latitude, c.longitude));
                                  setState(() {});
                                },
                              ),
                              for (var item in selectedCities.where(
                                  (element) => element.countryId == country.id))
                                SelectedCityWidget(
                                  city: item,
                                  onRemove: () {
                                    selectedCities.remove(item);
                                    setState(() {});
                                  },
                                )
                            ],
                          ),
                        ),
                      // const AppSizeBox(
                      //   height: 20,
                      // ),

                      // DefaultTextFormField(
                      //   controller: searchController,
                      //   hintTitle: 'AddYourSite'.tr(),
                      //   labelTitle: 'AddYourSite'.tr(),
                      //   textInputAction: TextInputAction.next,
                      //   textInputType: TextInputType.text,
                      //   hintFontSize: FontSize.s12,
                      //   hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                      //   textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                      //   textSize: FontSize.s12,
                      //   fillColor: ColorManager.textGrey,
                      //   borderColor: ColorManager.textGrey,
                      //   borderRadius: RadiusManager.r10,
                      //   prefixIcon: const Icon(Icons.location_on,color: ColorManager.icons,size: AppSize.s20,),
                      //   validator: (v) => Validator().validateEmpty(value: v.toString(),),
                      // ),

                      Container(
                        height: .4.sh,
                        width: 1.0.sw,
                        margin: const EdgeInsets.only(top: AppSize.s10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s20),
                          color: ColorManager.textGrey,
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(AppSize.s20),
                              child: GoogleMap(
                                mapType: MapType.normal,
                                // zoomControlsEnabled: true,
                                initialCameraPosition: CameraPosition(
                                  target: currentLocation,
                                  zoom: 12,
                                ),
                                markers: markers,
                                // polygons: polygon(),
                                onTap: (LatLng latLng) {
                                  Marker marker = Marker(
                                    markerId:
                                        MarkerId(latLng.latitude.toString()),
                                    position: latLng,
                                    onTap: () async {},
                                    infoWindow: InfoWindow(
                                      title:
                                          '${latLng.latitude} , ${latLng.longitude}',
                                    ),
                                  );
                                  currentLocation = latLng;
                                  markers = {marker};
                                  setState(() {});
                                },
                                onMapCreated: (GoogleMapController controller) {
                                  mapController.complete(controller);
                                  // setState(() {});
                                },
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: MyTextButton(
                                    title: 'Choose your location from map'.tr(),
                                    size: Size(.8.sw, 47),
                                    radius: 8,
                                    fontWeightType: FontWeightType.medium,
                                    titleSize: FontSize.s12,
                                    primaryColor:
                                        ColorManager.fff.withOpacity(.9),
                                    titleColor: ColorManager.text,
                                    onPressed: () => setState(
                                          () => selectedLocationFromMap = true,
                                        )),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // const AppSizeBox(height: 20,),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     AppText(
                      //         title: 'Places that have been entered before'.tr(),
                      //         titleAlign: TextAlign.start,
                      //         titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                      //         titleSize: FontSize.s14,titleColor: ColorManager.black),
                      //
                      //
                      //
                      //   ],
                      // ),
                      // const AppSizeBox(height: 10,),
                      // for(var item in ['المملكة العربية السعودية , الرياض','المملكة العربية السعودية , جدة'])
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
                      //         MyRoute().navigate(context: context, route: AddAdRequirementsScreen(addAdtData: addAdtData,));
                      //       },
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         children: [
                      //           Icon(
                      //             Icons.location_on,
                      //             color: ColorManager.icons,
                      //             size: 16,
                      //           ),
                      //           AppSizeBox(
                      //             width: 4,
                      //           ),
                      //           AppText(
                      //             title: item,
                      //             titleSize: FontSize.s14,
                      //             titleAlign: TextAlign.start,
                      //             titleHeight: 1.4,
                      //             titleMaxLines: 4,
                      //             titleColor: ColorManager.black,
                      //             fontWeightType: FontWeightType.medium,
                      //           ),
                      //
                      //         ],
                      //       ),
                      //     ),
                      //   ),

                      const AppSizeBox(height: 10,),
                      if(Constants.settingModel.appValueAfterSelling>0)
                      ValueListenableBuilder(valueListenable: agreePledge,
                        builder: (context, value, child) =>    CheckBoxWidget(
                          checkBoxValue: value,
                          title: 'pledgeMessage'.tr().replaceFirst('num', Constants.settingModel.appValueAfterSelling.toString()),
                          checkBoxFunction: (v)=>agreePledge.value=v!,
                        ),),



                      const AppSizeBox(height: 10,),
                    ],
                  ),
                ))));
  }

  Future<void> getCurrentLocation([LatLng? location]) async {
    try {
      LatLng? latLng = location ?? await Utils.getCurrentLocationLatLng();
      if (latLng == null) return;
      currentLocation = latLng;
      CameraPosition kLake = CameraPosition(
        // bearing: 192.8334901395799,
        target: currentLocation,
        zoom: 12,
      );

      final GoogleMapController controller = await mapController.future;
      await controller.animateCamera(CameraUpdate.newCameraPosition(kLake));

      Marker marker = Marker(
        markerId: MarkerId(currentLocation.latitude.toString()),
        position: currentLocation,
        // icon: icon,
        onTap: () async {},
        infoWindow: InfoWindow(
          title: '${currentLocation.latitude} , ${currentLocation.longitude}',
        ),
      );
      markers = {marker};
      setState(() {});
    } catch (e) {
      // Handle errors gracefully
      print('Error getting current location: $e');
    }
  }
}
