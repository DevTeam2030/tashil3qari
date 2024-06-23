part of'home_imports.dart';



class HomeAddLocationScreen extends StatefulWidget {
  const HomeAddLocationScreen({super.key,});

  @override
  State<HomeAddLocationScreen> createState() => _HomeAddLocationScreenState();
}

class _HomeAddLocationScreenState extends State<HomeAddLocationScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();
  Completer<GoogleMapController> mapController = Completer();
  Set<Marker> markers = {};
  LatLng currentLocation = LatLng(23.8859, 45.0792);
   @override
   void initState() {
     super.initState();
     getCurrentLocation();
   }




 @override
  void dispose() {
    mapController.future.then((controller) => controller.dispose());
    searchController.dispose();
    super.dispose();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        body:ScreenLoading(
          isLoading: context.watch<AuthProvider>().isLoading,
          child: Container(
            height: 1.0.sh,
            width: 1.0.sw,
            margin:returnPadding(),
            child:  Form(
              key: formKey,
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
                      BarTitleValue(
                        title: 'AddYourSite'.tr(),
                        subtitle:'AddYourSiteMessage'.tr() ,
                      ),






                      const AppSizeBox(height: AppSize.s25),

                      DefaultTextFormField(
                        controller: searchController,
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
                        validator: (v) => Validator().validateEmpty(value: v.toString(),),
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
                               target: currentLocation,
                               zoom: 12,
                             ),
                             markers:markers,
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
                               onPressed: ()=>getCurrentLocation()),
                           ),
                         ),
                       ],
                     ),

                      ),



                       AppSizeBox(height: .13.sh),
                      MyTextButton(title: 'Continue'.tr(),
                        size: Size( .8.sw,  47),
                        radius: 8,
                        fontWeightType: FontWeightType.bold,
                        titleSize: FontSize.s18,
                        primaryColor: ColorManager.primary,
                        titleColor: ColorManager.white,
                        onPressed: (){},),

                      const AppSizeBox(height: AppSize.s20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }

  Future<void> getCurrentLocation() async {
    try {
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
      controller.animateCamera(CameraUpdate.newCameraPosition(kLake));


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
    } catch (e) {
      // Handle errors gracefully
      print('Error getting current location: $e');
    }
  }
}
