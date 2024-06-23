part of'home_imports.dart';


class SearchLocationScreen extends StatefulWidget {
  final Function(CountryModel,CityModel,LatLng?) onTap;
  const SearchLocationScreen({super.key, required this.onTap});

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  // final ValueNotifier<bool> openMap = ValueNotifier<bool>(false);

  Set<Marker> markers = {};
  Completer<GoogleMapController> mapController = Completer();
  LatLng p1= const LatLng(40.153474463955796, 35.33852195739747);
  LatLng currentLocation=  LatLng(23.8859, 45.0792);

  String googleApikey = Constants.mapKey;
  //GoogleMapController? mapController; //contrller for Google map
  CameraPosition? cameraPosition;
  //LatLng startLocation = LatLng(27.6602292, 85.308027);
  String location = "Search Location";

 late CountryModel selectedCountry;
 late CityModel selectedCity;
 bool selectFromMapLocation=false;
@override
  void initState() {
    super.initState();
  setData();
  }

  @override
  void dispose() {
    mapController.future.then((controller) => controller.dispose());
    super.dispose();

  }

  setData()async{
    selectedCountry= context.read<GeneralProvider>().userCountry;
    selectedCity= context.read<GeneralProvider>().userCity;
    currentLocation= LatLng(selectedCity.latitude,selectedCity.longitude);
    CameraPosition kLake = CameraPosition(
      // bearing: 192.8334901395799,
      target: currentLocation,
      //tilt: 59.440717697143555,
      zoom: 8,
    );
    Marker marker = Marker(
      markerId: MarkerId(currentLocation.latitude.toString()),
      position: currentLocation,
      // icon: icon,
      onTap: () async {},
      infoWindow: InfoWindow(
        title: '${currentLocation.latitude} , ${currentLocation.longitude}',
      ),
    );
    markers={marker};
    final GoogleMapController controller = await mapController.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
    // setState(() {});
    // getCurrentLocation();
  }
  selectFromMap()async{

    // selectFromMapLocation=true;
    // setState(() {});
    onSelectedData(country: selectedCountry,
        city: selectedCity,
        latLng: currentLocation);
    // getCurrentLocation();
  }
  getCurrentLocationn() async {


    LatLng? latLng =await Utils.getCurrentLocationLatLng();
    if(latLng==null)return;
    currentLocation=latLng;
    CameraPosition kLake = CameraPosition(
      // bearing: 192.8334901395799,
      target: currentLocation,
      //tilt: 59.440717697143555,
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
    markers={marker};
    setState(() {});
  }

  onSelectedData({required CountryModel country,required CityModel city,LatLng? latLng}){
    widget.onTap(country,city,latLng);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        // appBar: GeneralAppBar(title: '',showChatNotify: false),
        body:ScreenLoading(
          isLoading: context.watch<AuthProvider>().isLoading,
          child: Container(
            height: 1.0.sh,
            width: 1.0.sw,
            margin:returnPadding(),
            child:   SingleChildScrollView(
              child: Column(
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
                          subtitle:'' ,
                          width: .75.sw,
                        ),


                      const AppSizeBox(width: 10,),

                      ],
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p8),
                  //       child: AppText(
                  //         title: 'Region'.tr(),
                  //         titleSize: FontSize.s14,
                  //         titleAlign: TextAlign.start,
                  //         titleColor: ColorManager.black,
                  //         fontWeightType: FontWeightType.medium,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const AppSizeBox(
                  //     height: 8
                  // ),
                  //
                  // CountryHomeDropdownButton(
                  //   selectedCountry: selectedCountry,
                  //   selectedCity: selectedCity,
                  //   countries: Constants.settingModel.countries.where((element) => element.cities.isNotEmpty).toList(),
                  //   onAddCounty: (value) {
                  //     selectedCountry = value!;
                  //     selectedCity=selectedCountry.cities.first;
                  //     setState(() {});
                  //   },
                  // ),

                    Container(
                      height: .4.sh,
                      width: 1.0.sw,
                      // margin: const EdgeInsets.only(top: AppSize.s20),
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
                                target: currentLocation,
                                zoom: 12,
                              ),
                              markers:markers,
                              // polygons: polygon(),
                              onTap: (LatLng latLng){
                                Marker marker = Marker(
                                  markerId: MarkerId(latLng.latitude.toString()),
                                  position: latLng,
                                  onTap: () async {},
                                  infoWindow: InfoWindow(
                                    title: '${latLng.latitude} , ${latLng.longitude}',
                                  ),
                                );
                                currentLocation=latLng;
                                markers={marker};
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
                              padding: const EdgeInsets.only(bottom:15),
                              child: MyTextButton(title: 'Choose your location from map'.tr(),
                                  size: Size( .8.sw,  47),
                                  radius: 8,
                                  fontWeightType: FontWeightType.medium,
                                  titleSize: FontSize.s12,
                                  primaryColor: ColorManager.fff.withOpacity(.9),
                                  titleColor: ColorManager.text,
                                  onPressed: ()=>selectFromMap()),
                            ),
                          ),
                        ],
                      ),

                    ),


                    const AppSizeBox(height: 10,),
                  for(var city in selectedCountry.cities.where((element) => element.id!=selectedCity.id))
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.symmetric(vertical: PaddingManager.p10, horizontal: PaddingManager.p16),
                        width: 1.0.sw,
                        // height: value ? 280 : 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(RadiusManager.r12),
                          border: Border.all(color: ColorManager.grey, width: 1),
                          color: ColorManager.textGrey,
                          // boxShadow: Constants.kBoxShadow
                        ),
                        child: InkWell(
                          onTap: () {
                            onSelectedData(country: selectedCountry,
                                city: city,
                                latLng: null);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: ColorManager.icons,
                                size: 16,
                              ),
                              AppSizeBox(
                                width: 4,
                              ),
                              AppText(
                                title:city.name,
                                // title: selectedCountry.name+' , '+city.name,
                                titleSize: FontSize.s14,
                                titleAlign: TextAlign.start,
                                titleHeight: 1.4,
                                titleMaxLines: 4,
                                titleColor: ColorManager.black,
                                fontWeightType: FontWeightType.medium,
                              ),

                            ],
                          ),
                        ),
                      ),


                    const AppSizeBox(height: 10,),
                    MyTextButton(title: 'Save'.tr(),
                        size: Size( .8.sw,  47),
                        radius: 6,
                        fontWeightType: FontWeightType.bold,
                        titleSize: FontSize.s18,
                        primaryColor: ColorManager.primary,
                        titleColor: ColorManager.white,
                        onPressed: (){
                          onSelectedData(country: selectedCountry,
                              city: selectedCity,
                              latLng: selectFromMapLocation?currentLocation:null);
                        })
                ],
              ),
            )
          ),
        )
    );
  }

}
