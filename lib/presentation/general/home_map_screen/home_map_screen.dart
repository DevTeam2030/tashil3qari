part of'home_map_imports.dart';


class HomeMapScreen extends StatefulWidget {
  const HomeMapScreen({super.key});
  @override
  State<HomeMapScreen> createState() => _HomeMapScreenState();
}

class _HomeMapScreenState extends State<HomeMapScreen> {
  CameraPosition? lastValidCameraPosition; // آخر موقع صحيح داخل السعودية
  @override
  void initState() {
    super.initState();
    if(mounted) {
      context.read<HomeMapProvider>().mapController = Completer();
      // context.read<HomeMapProvider>().showLocationPermiosion=false;
        context.read<NotificationsProvider>().getCountUnreadNotification(context: context);
        context.read<HomeMapProvider>().initDataCitiesMarkers(context: context,notify: false);
      context.read<HomeMapProvider>().getDocumented(context: context);
     
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeMapProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: HomeBuildAppBar(),
        body: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: ScreenLoading(
            isLoading: provider.isLoading,
            height: 1.sh,
            width: 1.sw,

            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 1.sh,
                      width: 1.sw,
                      // margin: const EdgeInsets.only(top: AppSize.s20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s20),
                        color: ColorManager.textGrey,
                      ),
                      child: GoogleMap(
                        mapType: provider.mapType,
                        myLocationButtonEnabled:false,
                        myLocationEnabled: false,
                        scrollGesturesEnabled: !provider.showCitiesMarkers,
                        zoomGesturesEnabled: !provider.showCitiesMarkers,
                        zoomControlsEnabled: !provider.showCitiesMarkers,
                        rotateGesturesEnabled: !provider.showCitiesMarkers,
                        compassEnabled: false,
                        cameraTargetBounds: CameraTargetBounds(provider.saudiBounds),
                        initialCameraPosition:  CameraPosition(
                          zoom: provider.cameraZoom,
                          target: provider.currentLocation,
                        ),
                        minMaxZoomPreference:  MinMaxZoomPreference(provider.cameraZoom, 28),
                        onCameraMove: (CameraPosition position) async{
                          if(position.zoom<=provider.cameraZoom&&!provider.showAllMap)provider.onRemoveSelectedCity(context: context);
                          // if(position.zoom<provider.cameraZoom&&provider.selectedCity!=null)provider.gotToCountries(context: context);
                          // if(position.zoom<=provider.cameraZoom&&!provider.showAllMap)provider.gotToCountries(context: context);
                        },
                        onCameraIdle: () async {
                          LatLng center = lastValidCameraPosition!.target;
                          if (!provider.saudiBounds.contains(center)) {
                            final GoogleMapController controller = await provider.mapController.future;
                            await controller.animateCamera(
                              CameraUpdate.newLatLngBounds(provider.saudiBounds, 50), // 50 = padd
                            );


                          }
                        },
                        markers: provider.showCitiesMarkers
                            ? provider.citiesMarkers
                            : provider.propertiesMarkers,
                        onMapCreated: (GoogleMapController controller) {
                          try{
                            provider.mapController.complete(controller);
                          }catch(e){
                            print('Error during map creation: $e');
                          }
                          lastValidCameraPosition =  CameraPosition(
                            target: provider.currentLocation,
                            zoom: provider.cameraZoom,
                          );
                          // setState(() {});
                        },
                      )),
                ),

                SelectedHomeCityMap(provider: provider),

                if(provider.selectedCity != null)
                  HomeShowAll(properties: provider.properties, city: provider.selectedCity!),

                if (
                provider.selectedCity != null)
                  HomeMapAuctionButton(
                    provider: provider,
                      onTap: (value) async {
                        provider.showAuctionOnMap = value;
                        await provider.getProperties(
                            context: context, forSale: provider.selectedAdType == AdType.forSale, forRent:
                        provider.selectedAdType == AdType.forRent,
                            cityId: provider.selectedCity?.id,
                            isAuction: value)
                            .then((value) => provider.initPropertiesMarkers(
                            context: context));
                      }),

                HomeMapFavoriteIcon(
                  provider: provider,
                ),

                GetCurrentLocationWidget(
                  onTap: ()=>provider.getCurrentLocation(context: context),
                ),
                 HomeOpenSearch(),
              ],
            ),
          ),
        ),
      );
    });
  }


}









