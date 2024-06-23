part of'widgets_imports.dart';


class AdInformationsMap extends StatefulWidget {
  final PropertyInfoModel propertyInfo;
  final LatLng currentLocation;
  const AdInformationsMap({super.key,required this.propertyInfo,required this.currentLocation});

  @override
  State<AdInformationsMap> createState() => _AdInformationsMapState();
}

class _AdInformationsMapState extends State<AdInformationsMap> {
  Completer<GoogleMapController> mapController = Completer();
 late LatLng adLatLng=LatLng(widget.propertyInfo.latitude, widget.propertyInfo.latitude);
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = Constants.mapKey;
  @override
  void initState() {
    super.initState();
    adLatLng=LatLng(widget.propertyInfo.latitude, widget.propertyInfo.latitude);
    /// origin marker
    _addMarker(widget.currentLocation, "me",
        BitmapDescriptor.defaultMarker);

    /// destination marker
    _addMarker(adLatLng, "destination",
        BitmapDescriptor.defaultMarkerWithHue(30),);
    _getPolyline();
  }

  @override
  void dispose() {
    mapController.future.then((controller) => controller.dispose());
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Container(
      height: .35.sh,
      width: .9.sw,
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
              zoomControlsEnabled: true,
              initialCameraPosition: CameraPosition(
                target: widget.currentLocation,
                zoom: 4,

              ),
              onTap: (LatLng latLng){
              },
              onMapCreated: (GoogleMapController controller) {
                mapController.complete(controller);
                // setState(() {});
              },
              markers: Set<Marker>.of(markers.values),
              polylines: Set<Polyline>.of(polylines.values),

            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  MyTextButton(title: 'Show on map'.tr(),
                    size: Size( .72.sw,  40),
                    radius: 6,
                    fontWeightType: FontWeightType.medium,
                    titleSize: FontSize.s12,
                    primaryColor: ColorManager.textGrey,
                    titleColor: ColorManager.icons3,
                    onPressed: (){
                      // final url =
                      //     'https://www.google.com/maps/search/?api=1&query=${widget.propertyInfo.latitude},${widget.propertyInfo.longitude}';
                      Utils.openMapsSheet(latLng: LatLng(widget.propertyInfo.latitude,widget.propertyInfo.longitude),
                          context: context,title: widget.propertyInfo.propertyTitle,description: widget.propertyInfo.propertyDescription);
                    }),
                ],
              ),
            ),
          )

        ],
      ),

    )
      ],
    );
  }

  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
    Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.red, points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }

  _getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleAPiKey,
        PointLatLng(widget.currentLocation.latitude, widget.currentLocation.longitude),
        PointLatLng(adLatLng.latitude, adLatLng.longitude),
        travelMode: TravelMode.driving,
        wayPoints: [PolylineWayPoint(location: "")]);
    print(result.status.toString());
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }
}
