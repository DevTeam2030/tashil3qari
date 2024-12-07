part of'home_imports.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeData homeData = HomeData();
  bool showLocationPermiosion=false;
  LatLngBounds saudiBounds1 = LatLngBounds(
    southwest: const LatLng(15.0, 34.0), // الزاوية الجنوبية الغربية للسعودية
    northeast: const LatLng(32.0, 56.0), // الزاوية الشمالية الشرقية للسعودية
  );

  @override
  void initState() {

    super.initState();


    // // homeData.initDataChat(context: context);
    // context.read<NotificationsProvider>().getCountUnreadNotification(context: context,);
    // // context.read<GeneralProvider>().setUserCountry(context: context);
    // homeData.initDataCitiesMarkers(context: context,afterBuildCitiesMarkers: ()=>setState(() {},));
    // homeData.getDocumented(context: context);
    // // homeData.initMarkers(context: context);

    if(mounted) {
      try {
      context.read<NotificationsProvider>().getCountUnreadNotification(context: context);
      // if(!showLocationPermiosion) getCurrentLocation(context: context);
      // if(context.read<HomeProvider>().allCitiesMarkers.isEmpty)
      context.read<HomeProvider>().initDataCitiesMarkers(context: context,notify: false);
      homeData.getDocumented(context: context);
    } catch (e) {
      // Handle errors gracefully
      print('Error during initialization: $e');
    }
    }
  }

  @override
  void dispose() {
    // homeData.mapController.future.then((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //  homeData.initDataCitiesMarkers(context: context);
    return Consumer<HomeProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: HomeBuildAppBar(),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ScreenLoading(
            isLoading: provider.isLoading,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                // if(false)
                // if(Constants.buildAllCitiesMarkersBefore)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      // margin: const EdgeInsets.only(top: AppSize.s20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s20),
                        color: ColorManager.textGrey,
                      ),
                      child: GoogleMap(
                        mapType: provider.mapType,
                        myLocationButtonEnabled:false,
                        myLocationEnabled: false,
                        // scrollGesturesEnabled:true,
                        // zoomGesturesEnabled: true,
                        // zoomControlsEnabled: true,
                        scrollGesturesEnabled: !provider.showCitiesMarkers||showLocationPermiosion,
                        zoomGesturesEnabled: !provider.showCitiesMarkers||showLocationPermiosion,
                        zoomControlsEnabled: !provider.showCitiesMarkers||showLocationPermiosion,
                        rotateGesturesEnabled: !provider.showCitiesMarkers,
                        compassEnabled: false,
                        // cameraTargetBounds: CameraTargetBounds(saudiBounds2),
                        cameraTargetBounds: CameraTargetBounds(
                          LatLngBounds(
                            southwest:const LatLng(18.35, 34.5), // Southern-western coordinate of Saudi Arabia
                            northeast:const LatLng(32.15, 55.67), // Northern-eastern coordinate of Saudi Arabia
                          ),
                        ),
                        initialCameraPosition:  CameraPosition(
                          zoom: provider.cameraZoom,
                          target: provider.currentLocation, // الموقع الافتراضي للسعودية
                        ),
                        minMaxZoomPreference:  MinMaxZoomPreference(provider.cameraZoom, 28),
                        onCameraMove: (CameraPosition position) async{
                          if(position.zoom<=provider.cameraZoom&&!provider.showAllMap)provider.gotToCountries(context: context);
                          // if(position.zoom<=8&&!provider.showAllMap)provider.gotToCountries(context: context);
                          },
                        // polygons: polygons,
                        // polygons: {
                        //   Polygon(
                        //     polygonId: PolygonId('saudi_polygon'),
                        //     points: pointsPolygon,
                        //     // points: provider.pointsPolygon,
                        //     strokeWidth: 2,
                        //     fillColor: Colors.transparent,
                        //     strokeColor: Colors.red,
                        //   ),
                        // },
                        markers: provider.showCitiesMarkers
                            // ? Constants.buildAllCitiesMarkersBefore
                                ? provider.allCitiesMarkers
                                // : {}
                            : provider.markers,
                        onMapCreated: (GoogleMapController controller) {
                         try{
                           provider.mapController.complete(controller);
                         }catch(e){
                           print('Error during map creation: $e');
                         }
                          // setState(() {});
                        },
                      )),
                ),

                HomeFavoriteIcon(
                  onSatelliteSelected: (){
                    provider.mapType= provider.mapType == MapType.normal
                      ? MapType.satellite
                      : MapType.normal;
                  setState(() {});
                  },
                ),
                if(
                // provider.properties.isNotEmpty &&
                    provider.selectedCity.value != null)
                HomeShowAll(properties: provider.properties,cityId: provider.selectedCity.value!.id),
                if (
                // provider.properties.isNotEmpty &&
                    provider.selectedCity.value != null)
                  AuctionButton(
                      onTap: (value) async {
                        provider.showAuctionOnMap.value = value;
                        await context.read<HomeProvider>().getProperties(
                            context: context, forSale: provider.selectedAdType == AdType.forSale, forRent:
                                    provider.selectedAdType == AdType.forRent,
                                cityId: provider.selectedCity.value?.id,
                                isAuction: value)
                            .then((value) => provider.initPropertiesMarkers(
                                context: context));
                      }),
                const SelectedCityMap(),
                GetCurrentLocationWidget(
                  onTap: ()=>getCurrentLocation(context: context),
                ),
                const HomeOpenSearch(),
              ],
            ),
          ),
        ),
      );
    });
  }

  Future<void> getCurrentLocation({required BuildContext context}) async {
    try {
      LatLng? latLng = await Utils.getCurrentLocationLatLng();
      showLocationPermiosion=true;
      setState(() {});
      if (latLng == null) return;

      context.read<HomeProvider>().currentLocation = latLng;
      CameraPosition kLake = CameraPosition(
        target: latLng,
        zoom: 14,
      );


      final GoogleMapController controller = await  context.read<HomeProvider>().mapController.future;
      await controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
    } catch (e) {
      // Handle errors gracefully
      print('Error getting current location: $e');
    }
  }
}









