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

    try {
      context.read<NotificationsProvider>().getCountUnreadNotification(context: context);
      // if(!showLocationPermiosion) getCurrentLocation(context: context);
      homeData.initDataCitiesMarkers(
          context: context,
          afterBuildCitiesMarkers: () {
            if (mounted) {
              setState(() {});
            }
          });
      homeData.getDocumented(context: context);
    } catch (e) {
      // Handle errors gracefully
      print('Error during initialization: $e');
    }
  }

  @override
  void dispose() {
    homeData.mapController.future.then((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //  homeData.initDataCitiesMarkers(context: context);
    return Consumer<HomeProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: HomeBuildAppBar(
          homeData: homeData,
        ),
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
                        mapType: homeData.mapType,
                        myLocationButtonEnabled:false,
                        myLocationEnabled: false,
                        // scrollGesturesEnabled:true,
                        // zoomGesturesEnabled: true,
                        // zoomControlsEnabled: true,
                        scrollGesturesEnabled: !homeData.showCitiesMarkers||showLocationPermiosion,
                        zoomGesturesEnabled: !homeData.showCitiesMarkers||showLocationPermiosion,
                        zoomControlsEnabled: !homeData.showCitiesMarkers||showLocationPermiosion,
                        rotateGesturesEnabled: !homeData.showCitiesMarkers,
                        compassEnabled: false,
                        // cameraTargetBounds: CameraTargetBounds(saudiBounds2),
                        cameraTargetBounds: CameraTargetBounds(
                          LatLngBounds(
                            southwest:const LatLng(18.35, 34.5), // Southern-western coordinate of Saudi Arabia
                            northeast:const LatLng(32.15, 55.67), // Northern-eastern coordinate of Saudi Arabia
                          ),
                        ),
                        initialCameraPosition:  CameraPosition(
                          target: homeData.currentLocation, // الموقع الافتراضي للسعودية
                          // target: LatLng(23.8859, 45.0792), // الموقع الافتراضي للسعودية
                          zoom: homeData.cameraZoom,
                        ),
                        minMaxZoomPreference:  MinMaxZoomPreference(homeData.cameraZoom, 28),
                        onCameraMove: (CameraPosition position) async{
                          if(position.zoom<=homeData.cameraZoom&&!homeData.showAllMap)homeData.gotToCountries(context: context);
                          // if(position.zoom<=8&&!homeData.showAllMap)homeData.gotToCountries(context: context);
                          },
                        // polygons: polygons,
                        // polygons: {
                        //   Polygon(
                        //     polygonId: PolygonId('saudi_polygon'),
                        //     points: pointsPolygon,
                        //     // points: homeData.pointsPolygon,
                        //     strokeWidth: 2,
                        //     fillColor: Colors.transparent,
                        //     strokeColor: Colors.red,
                        //   ),
                        // },
                        markers: homeData.showCitiesMarkers
                            ? Constants.buildAllCitiesMarkersBefore
                                ? homeData.allCitiesMarkers
                                : {}
                            : homeData.markers,
                        onMapCreated: (GoogleMapController controller) {
                          homeData.mapController.complete(controller);
                          // setState(() {});
                        },
                      )),
                ),

                HomeFavoriteIcon(homeData: homeData,
                  onSatelliteSelected: (){
                    homeData.mapType= homeData.mapType == MapType.normal
                      ? MapType.satellite
                      : MapType.normal;
                  setState(() {});
                  },
                ),
                if(provider.properties.isNotEmpty && homeData.selectedCity.value != null)
                HomeShowAll(properties: provider.properties),
                if (provider.properties.isNotEmpty && homeData.selectedCity.value != null)
                  AuctionButton(
                      homeData: homeData,
                      onTap: (value) async {
                        homeData.showAuctionOnMap.value = value;
                        await context
                            .read<HomeProvider>()
                            .getProperties(
                                context: context,
                                forSale:
                                    homeData.selectedAdType == AdType.forSale,
                                forRent:
                                    homeData.selectedAdType == AdType.forRent,
                                cityId: homeData.selectedCity.value?.id,
                                isAuction: value)
                            .then((value) => homeData.initPropertiesMarkers(
                                context: context));
                      }),
                SelectedCityMap(homeData: homeData),
                GetCurrentLocationWidget(
                  onTap: ()=>getCurrentLocation(context: context),
                ),
                HomeOpenSearch(homeData: homeData,),
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

      homeData.currentLocation = latLng;
      CameraPosition kLake = CameraPosition(
        target: latLng,
        zoom: 10,
      );

      final GoogleMapController controller = await homeData.mapController.future;
      await controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
    } catch (e) {
      // Handle errors gracefully
      print('Error getting current location: $e');
    }
  }
}









