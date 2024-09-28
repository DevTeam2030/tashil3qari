part of'home_imports.dart';

class HomeData {
  // initDataChat({required BuildContext context}){
  //   if(Constants.isLogin&&Constants.userDataModel!=null){
  //     var user= Constants.userDataModel!;
  //     context.read<ChatProvider>().createUSer(userId: user.id, name: user.firstName, email: user.email,
  //         image: user.image,type: user.type==UserType.user?'normal':"consultant");
  //   }
  // }
  double cameraZoom=4.2;
  Set<Marker> markers = {};
  Set<Marker> allCitiesMarkers = {};
  Completer<GoogleMapController> mapController = Completer();

  // LatLng p1 = const LatLng(40.153474463955796, 35.33852195739747);
  LatLng currentLocation = const LatLng(23.8859, 45.0792);
  AdType? selectedAdType;
  ValueNotifier<bool> monthly = ValueNotifier<bool>(false);
  // AdType selectedAdType= AdType.forSale;
  String googleApikey = Constants.mapKey;
  MapType mapType = MapType.normal;

  //GoogleMapController? mapController; //contrller for Google map
  CameraPosition? cameraPosition;

  //LatLng startLocation = LatLng(27.6602292, 85.308027);
  String location = "Search Location";

  ValueNotifier<bool> openSearch = ValueNotifier<bool>(false);
  ValueNotifier<HomeCatogeryModel?> selectedCategory = ValueNotifier<HomeCatogeryModel?>(null);
  // ValueNotifier<HomeCatogeryModel> selectedCategory = ValueNotifier<HomeCatogeryModel>(Constants.settingModel.categories.first);
  ValueNotifier<CityModel?> selectedCity = ValueNotifier<CityModel?>(null);
  ValueNotifier<bool> showAuctionOnMap = ValueNotifier<bool>(false);

  bool userDocumented = false;

  getDocumented({required BuildContext context}) {
    // if(userDocumented)return;
    if (Constants.userDataModel != null && !Constants.userDataModel!.isUser) {
      context.read<ProfileProvider>().getAllProfileDataOnly(
          context: context, notify: false);
    }

    try {
      if (isLinkDynamic.value) {
        MyRoute().navigate(context: context,
          route: AdScreen(propertyId: addDynamicLinkId.value),);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  getByCategory(
      {required BuildContext context, required HomeCatogeryModel? category}) async {
    // if (selectedCategory.value == category) return;
    selectedCategory.value = category;
    showCitiesMarkers = false;

    await context.read<HomeProvider>().getProperties(context: context,
        isAuction: showAuctionOnMap.value,
        forSale: selectedAdType == AdType.forSale,
        forRent: selectedAdType == AdType.forRent,
        cityId: selectedCity.value?.id,
        categoryId: category?.id)
        .then((value) => initPropertiesMarkers(context: context));
  }


  optionalAlertDialog(
      {required BuildContext context, required GeneralPropertyModel property,}) {
    LoadingDialog().widgetAlertDialog(
        context: context,
        widget: AdAlertWidget(
            property: property,
            afterOnTap: () {
              if (property.show) return;
              property.show = true;
              initPropertiesMarkers(context: context);
            }

        ));
  }


  bool showCitiesMarkers = true;
  bool showAllMap = true;


  initDataCitiesMarkers(
      {required BuildContext context, bool? isNotify, required Function() afterBuildCitiesMarkers}) async {
    try {
      // context.read<HomeProvider>().changeLoading(true,isNotify??false);
      // allCitiesMarkers = {};
      var country = context
          .read<GeneralProvider>()
          .mapCountry;
      showAllMap = true;
      if (allCitiesMarkers.isEmpty) {
        for (var city in country.cities) {
          allCitiesMarkers.add(Marker(
              markerId: MarkerId("${city.id}"),
              position: LatLng(city.latitude, city.longitude),
              icon: await TextBoxWidget(
                text: city.name,
              ).toBitmapDescriptor(
                // logicalSize: const Size(150, 150),
                // imageSize: const Size(150, 150)
              ),
              onTap: () async {
                showCitiesMarkers = false;
                selectedCity.value = city;
                // showAllMap=false;
                // context.read<HomeProvider>().properties=[];
                await context.read<HomeProvider>().getProperties(
                  context: context,
                  forSale: selectedAdType == AdType.forSale,
                  forRent: selectedAdType == AdType.forRent,
                  cityId: city.id,
                  isAuction: showAuctionOnMap.value,).then((value) =>
                    initPropertiesMarkers(context: context));
              }));
        }
      }


      final GoogleMapController controller = await mapController.future;
      // await controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
      // context.read<HomeProvider>().changeLoading(false);
      // afterBuildCitiesMarkers();
      // Future.delayed(const Duration(seconds:3)).then((value)=> context.read<HomeProvider>().changeLoading(false));

      Constants.buildAllCitiesMarkersBefore = true;
      // var city = country.cities.isNotEmpty ? country.cities.first : context.read<GeneralProvider>().userCity;
      // currentLocation = LatLng(city.latitude, city.longitude);
      CameraPosition kLake = CameraPosition(
        // bearing: 192.8334901395799,
        // target: currentLocation,
        target: currentLocation,
        //tilt: 59.440717697143555,
        zoom: cameraZoom,
      );
      await controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
      context.read<HomeProvider>().changeLoading(false, true);
    } catch (e) {

    }
  }


  gotToCountries({required BuildContext context}) async {
    showCitiesMarkers = true;

    // selectedCity.value = null;
    // var country = context.read<GeneralProvider>().mapCountry;
    // var city = country.cities.isNotEmpty ? country.cities.first : context.read<GeneralProvider>().userCity;
    // var currentLocation = LatLng(city.latitude, city.longitude);
    CameraPosition kLake = CameraPosition(
      // bearing: 192.8334901395799,
      target: currentLocation,
      //tilt: 59.440717697143555,
      zoom: cameraZoom,
    );
    final GoogleMapController controller = await mapController.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
    Future.delayed(const Duration(seconds: 2)).then((value) =>
    showAllMap = true);
    context.read<HomeProvider>().notifyListeners();
  }

  getMarkerTap({required BuildContext context, required CityModel city}) async {
    showCitiesMarkers = false;
    selectedCity.value = city;
    await context.read<HomeProvider>().getProperties(context: context,
      forSale: selectedAdType == AdType.forSale,
      forRent: selectedAdType == AdType.forRent,
      cityId: city.id,
      isAuction: showAuctionOnMap.value,).then((value) =>
        initPropertiesMarkers(context: context));
  }

  bool showAllSamePosition=true;
  initPropertiesMarkers({required BuildContext context}) async {
    context.read<HomeProvider>().changeLoading(true, false);

    markers = {};
    var properties=context.read<HomeProvider>().properties;
    for (var prop in properties) {
        var marks=markers.where((element) => element.position.latitude==prop.latitude
            &&element.position.longitude==prop.longitude).toList();
        var numbers=properties.where((element) => element.latitude==prop.latitude
            &&element.longitude==prop.longitude).toList();
        if(marks.isNotEmpty&&showAllSamePosition){
          Marker  m=marks.first;
          markers.removeAll(marks);
          markers.add(Marker(
              markerId: MarkerId("${m.markerId.value}"),
              position: LatLng(m.position.latitude, m.position.longitude),
              icon: await MoreIcon(number:numbers.length ,).toBitmapDescriptor(),
              onTap: (){
                showAllSamePosition=false;
                initPropertiesMarkers(context: context);
              } ));
        }
        else{

          marks.isNotEmpty?
          markers.add(Marker(
              markerId: MarkerId("${prop.id}"),
              position: LatLng(prop.latitude, prop.longitude),
              icon: await TextPrice(price: '${prop.price}',
                currency: prop.currency,
                auction: prop.isAuction,
                type: prop.featured ? MapAdType.premium : (prop.show ? MapAdType
                    .other : MapAdType.primary),
              ).toBitmapDescriptor(),
              onTap: () => optionalAlertDialog(context: context, property: prop))):
          markers.add(Marker(
              markerId: MarkerId("${prop.id}"),
              position: LatLng(prop.latitude, prop.longitude),
              icon: await TextPrice(price: '${prop.price}',
                currency: prop.currency,
                auction: prop.isAuction,
                type: prop.featured ? MapAdType.premium : (prop.show ? MapAdType
                    .other : MapAdType.primary),
              ).toBitmapDescriptor(),
              onTap: () => optionalAlertDialog(context: context, property: prop)));
        }

        // if(marker.position.latitude==prop.latitude&&marker.position.longitude==prop.longitude&&showAllSamePosition){
        //   var m=marker;
        //   markers.remove(marker);
        //   markers.add(Marker(
        //       markerId: MarkerId("${m.markerId.value}"),
        //       position: LatLng(m.position.latitude, m.position.longitude),
        //       icon: await MoreIcon().toBitmapDescriptor(),
        //       onTap: (){
        //         showAllSamePosition=false;
        //         initPropertiesMarkers(context: context);
        //       } ));
        //   break;
        // }else {
        //   markers.add(Marker(
        //     markerId: MarkerId("${prop.id}"),
        //     position: LatLng(prop.latitude, prop.longitude),
        //     icon: await TextPrice(price: '${prop.price}',
        //       currency: prop.currency,
        //       auction: prop.isAuction,
        //       type: prop.featured ? MapAdType.premium : (prop.show ? MapAdType
        //           .other : MapAdType.primary),
        //     ).toBitmapDescriptor(),
        //     onTap: () => optionalAlertDialog(context: context, property: prop)));
        // }


    }
    var country = context.read<GeneralProvider>().mapCountry;
    var city = country.cities.isNotEmpty ? country.cities.first : context.read<GeneralProvider>().userCity;
    currentLocation =properties.isNotEmpty?LatLng(properties.first.latitude, properties.first.longitude): 
    LatLng(city.latitude, city.longitude);
    // currentLocation = LatLng(city.latitude, city.longitude);
    CameraPosition kLake = CameraPosition(
      // bearing: 192.8334901395799,
      target: currentLocation,
      //tilt: 59.440717697143555,
      zoom: 12,
    );

    final GoogleMapController controller = await mapController.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
    Future.delayed(const Duration(seconds: 2)).then((value) =>
    showAllMap = false);

    context.read<HomeProvider>().changeLoading(false);

    // Future.delayed(const Duration(seconds:2)).then((value)=> context.read<HomeProvider>().changeLoading(false));
    // markers.add(Marker(
    //     markerId: const MarkerId("2"),
    //     position: const LatLng(31.063183325007863, 31.400345005095005),
    //     icon: await TextPrice(
    //       price: '500.00',
    //       type: MapAdType.primary,
    //     ).toBitmapDescriptor(
    //         // logicalSize: const Size(150, 150),
    //         // imageSize: const Size(150, 150)
    //         ),
    //     onTap: () => optionalAlertDialog(context: context)));
    //
    // markers.add(Marker(
    //     markerId: const MarkerId("3"),
    //     position: const L30.063183325007863, 30.400345005095005),
    //     icon: await TextPrice(
    //       price: '5000.00',
    //       type: MapAdType.primary,
    //     ).toBitmapDescriptor(
    //         // logicalSize: const Size(150, 150), imageSize: const Size(150, 150)
    //         ),
    //     onTap: () => optionalAlertDialog(context: context)));
    //
    // markers.add(Marker(
    //     markerId: const MarkerId("4"),
    //     position: const LatLng(30.63183325007863, 31.400345005095005),
    //     icon: await TextPrice(
    //       price: '5000.00',
    //       type: MapAdType.other,
    //     ).toBitmapDescriptor(
    //         // logicalSize: const Size(150, 150), imageSize: const Size(150, 150)
    //         ),
    //     onTap: () => optionalAlertDialog(context: context)));
    // markers.add(Marker(
    //     markerId: const MarkerId("5"),
    //     position: const LatLng(30.83183325007863, 31.400345005095005),
    //     icon: await TextPrice(
    //       price: '5000.00',
    //       type: MapAdType.premium,
    //     ).toBitmapDescriptor(
    //         // logicalSize: const Size(150, 150), imageSize: const Size(150, 150)
    //         ),
    //     onTap: () => optionalAlertDialog(context: context)));
    // context.read<HomeProvider>().changeLoading();
  }

  List<LatLng> pointsPolygon =const [
     LatLng(26.497248, 50.134925),
    LatLng(26.500014, 50.123939),
    LatLng(26.497863, 50.121192),
    LatLng(26.487723, 50.120506),
    LatLng(26.45822, 50.109863),
    LatLng(26.456376, 50.10437),
    LatLng(26.461293, 50.097503),
    LatLng(26.478504, 50.096817),
    LatLng(26.479426, 50.08892),
    LatLng(26.482192, 50.087547),
    LatLng(26.478504, 50.084457),
    LatLng(26.470514, 50.085144),
    LatLng(26.468055, 50.081024),
    LatLng(26.468362, 50.075187),
    LatLng(26.469899, 50.071754),
    LatLng(26.469745, 50.069522),
    LatLng(26.471436, 50.069351),
    LatLng(26.47205, 50.071926),
    LatLng(26.474816, 50.070381),
    LatLng(26.46744, 50.047035),
    LatLng(26.454992, 50.052185),
    LatLng(26.455991, 50.047121),
    LatLng(26.455761, 50.043344),
    LatLng(26.453532, 50.036907),
    LatLng(26.450689, 50.038795),
    LatLng(26.433013, 50.011329),
    LatLng(26.445387, 50.011501),
    LatLng(26.436702, 49.97322),
    LatLng(26.40351, 49.980355),
    LatLng(26.401434, 49.989152),
    LatLng(26.403126, 49.997349),
    LatLng(26.404894, 50.002842),
    LatLng(26.410621, 50.013872),
    LatLng(26.38452, 50.022755),
    LatLng(26.372242, 49.995327),
    LatLng(26.371088, 49.988203),
    LatLng(26.371396, 49.977474),
    LatLng(26.395078, 49.972067),
    LatLng(26.392311, 49.957133),
    LatLng(26.373472, 49.962712),
    LatLng(26.376164, 49.954987),
    LatLng(26.332633, 49.937134),
    LatLng(26.333863, 49.945545),
    LatLng(26.339786, 49.966231),
    LatLng(26.341479, 49.972325),
    LatLng(26.343248, 49.982624),
    LatLng(26.343786, 49.989233),
    LatLng(26.343786, 49.994297),
    LatLng(26.345632, 50.011635),
    LatLng(26.333479, 50.024595),
    LatLng(26.338248, 50.03232),
    LatLng(26.339786, 50.03335),
    LatLng(26.321775, 50.037442),
    LatLng(26.305926, 50.044824),
    LatLng(26.313081, 50.05066),
    LatLng(26.319697, 50.058643),
    LatLng(26.324313, 50.06714),
    LatLng(26.336083, 50.105764),
    LatLng(26.337314, 50.108167),
    LatLng(26.359542, 50.099841),
    LatLng(26.368078, 50.106794),
    LatLng(26.372538, 50.113746),
    LatLng(26.374076, 50.111428),
    LatLng(26.373999, 50.11572),
    LatLng(26.364156, 50.121642),
    LatLng(26.360926, 50.1219),
    LatLng(26.360695, 50.124818),
    LatLng(26.365771, 50.125247),
    LatLng(26.366463, 50.12602),
    LatLng(26.360926, 50.12868),
    LatLng(26.359388, 50.127908),
    LatLng(26.348774, 50.127221),
    LatLng(26.351082, 50.133058),
    LatLng(26.358619, 50.142499),
    LatLng(26.366156, 50.146962),
    LatLng(26.372308, 50.148851),
    LatLng(26.388224, 50.150138),
    LatLng(26.394068, 50.152026),
    LatLng(26.3832, 50.165127),
    LatLng(26.391658, 50.167873),
    LatLng(26.394887, 50.16753),
    LatLng(26.403036, 50.171993),
    LatLng(26.411646, 50.175255),
    LatLng(26.416566, 50.169933),
    LatLng(26.425329, 50.141609),
    LatLng(26.433168, 50.131309),
  ];


}





List<LatLng> pointsPolygon = const [

LatLng(29.299673, 34.968993),
    LatLng(28.723209, 34.859130),
LatLng(28.279087, 34.749267),
LatLng(28.104793, 35.210693),
LatLng(27.482791, 35.716064),
LatLng(26.109923, 36.682861),
LatLng(25.793812, 36.814697),
LatLng(25.496690, 37.210204),
LatLng(24.705771, 37.320068),
  LatLng(24.345950, 37.561767),
  LatLng(24.405991, 37.561767),
  LatLng(24.345950, 37.737548),
  LatLng(24.425999, 37.605712),
LatLng(24.065379, 38.220947),
  LatLng(23.562833, 38.748290),
LatLng(22.486018, 39.110839),
LatLng(22.191326, 39.066894),
LatLng( 21.946973, 38.979003),
LatLng(21.855232, 39.022949),
LatLng(21.247249, 39.187743),
LatLng(20.569903, 39.649169),
LatLng(20.467010, 39.759033),
LatLng(20.384645, 39.890868),
LatLng(20.322843, 40.110595),
LatLng(19.992815, 40.572021),
LatLng(19.356606, 41.000488),
LatLng(19.086886, 41.198242),
LatLng( 18.941469, 41.176269),
LatLng( 18.889504, 41.275146),
LatLng(18.660666, 41.275146),
LatLng(18.431519, 41.472900),
LatLng(18.431519, 41.472900),
LatLng( 17.972310, 41.747558),
LatLng( 17.867777, 41.934326),
LatLng( 17.459512, 42.351806),
LatLng(17.417586, 42.351806),
LatLng( 17.176328, 42.450683),
LatLng( 16.892711, 42.626464),
LatLng(16.671825, 42.758300),
LatLng(16.461219, 42.824218),
LatLng(16.650775, 42.890136),
LatLng( 16.966283, 43.065917),
LatLng( 17.176328, 43.087890),
LatLng( 17.511905, 43.131835),
LatLng( 17.637587, 43.307617),
LatLng( 17.449031, 43.681152),
LatLng( 17.407103, 43.812988),
LatLng(17.532858, 44.054687),
LatLng(17.532858, 45.219238),
LatLng(17.469992, 45.285156),
LatLng(17.386136, 45.504882),
LatLng( 17.302241, 46.361816),
LatLng( 17.365166, 46.801269),
LatLng(17.029321, 47.042968),
LatLng(17.155334, 47.394531),
LatLng( 17.532858, 47.526367),
LatLng( 18.264674, 48.229492),
LatLng( 18.410672, 48.405273),
LatLng( 18.743916, 49.020507),
LatLng( 18.827125, 49.152343),
LatLng( 19.076503, 51.789062),
LatLng(19.118030, 52.052734),
LatLng(20.111499, 54.865234),
LatLng( 21.967352, 55.480468),
LatLng( 22.536764, 55.041015),
LatLng( 22.982522, 52.272460),
LatLng(24.630894, 50.690429),
LatLng( 24.630894, 50.690429),
LatLng( 25.640391, 50.086181),
LatLng( 26.724862, 49.888427),
LatLng( 27.896236, 48.723876),
LatLng( 28.457926, 48.394286),
LatLng(28.631642, 47.559326),
LatLng( 28.958987, 47.405517),
LatLng( 28.974606, 47.386291),
LatLng(29.089876, 46.023986),
LatLng(29.089876, 45.584533),
LatLng(29.128271, 44.749572),
LatLng( 29.281707, 44.398010),
LatLng( 29.855036, 43.694885),
LatLng( 29.969310, 43.563049),
LatLng( 31.067148, 42.024963),
LatLng( 31.292731, 41.453674),
LatLng( 31.779644, 40.442931),
LatLng( 31.891647, 40.223205),
LatLng( 32.105939, 39.212463),
LatLng( 32.105939, 39.234435),
LatLng( 31.980220, 39.025695),
LatLng( 31.914964, 38.773010),
LatLng( 31.756293, 38.014953),
LatLng( 31.494359, 37.048156),
LatLng( 31.447508, 37.092101),
LatLng( 31.015377, 37.520568),
LatLng( 30.524512, 38.003967),
LatLng( 30.496116, 38.014953),
LatLng(30.316086, 37.674377),
LatLng( 30.021642, 37.531554),
LatLng( 29.859800, 36.762512),
LatLng( 29.516210, 36.531799),
LatLng( 29.181041, 36.125304),
LatLng( 29.200223, 35.850646),
LatLng( 29.334398, 34.982726),
LatLng(  29.046665, 34.872863),
LatLng( 28.825525, 34.861877),
LatLng( 28.748497, 34.839904),
LatLng(  28.546026, 34.850890),
LatLng(  28.178660, 34.697082),
LatLng(28.198027, 34.697082),
LatLng( 28.158685, 34.644897),
  LatLng( 28.135678, 34.727294),

];
