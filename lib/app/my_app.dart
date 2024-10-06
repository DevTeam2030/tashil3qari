import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/presentation/general/app_screens/splash_screen.dart';
import 'package:tashil_agary/providers/auth_provider.dart';
import 'package:tashil_agary/providers/home_provider.dart';
import 'package:tashil_agary/providers/chat_agreement_provider.dart';
import 'package:tashil_agary/providers/notifications_provider.dart';
import 'package:tashil_agary/providers/one_category_provider.dart';
import 'package:tashil_agary/providers/product_provider.dart';
import 'package:tashil_agary/providers/search_provider.dart';
import 'package:tashil_agary/providers/social_login_provider.dart';
import 'package:tashil_agary/providers/user_provider.dart';
import 'package:tashil_agary/providers/wishlist_provider.dart';
import 'package:tashil_agary/utilites/route_manager.dart';
import 'package:tashil_agary/utilites/theme_manager.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../presentation/general/ad/ad_imports.dart';
import '../providers/add_property_provider.dart';
import '../providers/agreements_provider.dart';
import '../providers/auction_provider.dart';
import '../providers/chat_provider.dart';
import '../providers/consultant_provider.dart';
import '../providers/council_provider.dart';
import '../providers/general_provider.dart';
import '../providers/profile_provider.dart';
import '../providers/services_provider.dart';

class MyApp extends StatefulWidget {
  // const MyApp({Key? key}) : super(key: key);
   const MyApp._interneal(); // private contractor
 static const MyApp instanse=MyApp._interneal(); // single instanse // singlton

  factory MyApp()=>instanse;  // factory for the class instanse

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
     initDynamicLinks();

  }


  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();


    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => CouncilProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => AddPropertyProvider()),
        ChangeNotifierProvider(create: (context) => ConsultantProvider()),
        ChangeNotifierProvider(create: (context) => GeneralProvider()),
        ChangeNotifierProvider(create: (context) => AuctionProvider()),
        ChangeNotifierProvider(create: (context) => SearchProvider()),
        ChangeNotifierProvider(create: (context) => WishlistProvider()),
        ChangeNotifierProvider(create: (context) => AgreementsProvider()),

        ChangeNotifierProvider(create: (context) => SocialLoginProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => OneCategoryProvider()),

        ChangeNotifierProvider(create: (context) => NotificationsProvider()),
        // ChangeNotifierProvider(create: (context) => ChatProvider()),

        ChangeNotifierProvider(create: (context) => ChatAgreementDataProvider()),
        ChangeNotifierProvider(create: (context) => ServicesProvider()),

      ],
      child: MaterialApp(
        // title: 'title'.tr(),
        navigatorKey: Constants.navigatorAppKey,
        themeMode: ThemeMode.light,
        theme: getApplicationThemeData(brightness: Brightness.light),
        darkTheme: getApplicationThemeData(brightness: Brightness.dark),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        onGenerateRoute: RouteGenerator.getRoute,
        navigatorObservers: [BotToastNavigatorObserver()],
        // initialRoute: Routes.logoScreen,
        home: const SplashScreen(),
        // home:const SplashScreen(),
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          // child = FlutterEasyLoading(child: child);

          child = botToastBuilder(context, child);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child,
          );
        },

      )
    );
  }

  // FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  // Future<void> initDynamicLinks() async {
  //   dynamicLinks.onLink.listen((dynamicLinkData) {
  //     MyRoute().navigate(context: context, route: VenueScreen(venueId: 1,));
  //   }).onError((error) {
  //     print('onLink error');
  //     print(error.message);
  //   });
  // }



}
// bool isLinkDynamic = false;
// int adId=6;
final ValueNotifier<bool> isLinkDynamic = ValueNotifier<bool>(false);
final ValueNotifier<int> addDynamicLinkId = ValueNotifier<int>(0);
// GenericCubit<int>dynamicLinkId=GenericCubit<int>(0);
Future<void> initDynamicLinks() async {

  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance.getInitialLink();
  if(data!=null){
    final Uri? link=  data.link;
    print(link.toString());
    if (link != null && link.queryParameters['title'] != null
        && int.tryParse(link.queryParameters['title'].toString()) != 0){
      isLinkDynamic.value=true;
      List<String> data = link.queryParameters['title'].toString().split(',id=');
      addDynamicLinkId.value=int.parse(data[1]);

    }

  }
  if(data==null) {
    isLinkDynamic.value=false;
  } else {
    isLinkDynamic.value=true;
  }
  // PendingDynamicLinkData? data = await dynamicLinks.getInitialLink();
  //
  // if(data!=null){
  //   final Uri link=  data.link;
  //   Utils.printData(link.toString());
  //   if ( link.queryParameters['title'] != null && int.tryParse(link.queryParameters['title'].toString()) != 0){
  //     isLinkDynamic=true;
  //     List<String> data = link.queryParameters['title'].toString().split(',');
  //     id=int.parse(data[1]);
  //     // ignore: use_build_context_synchronously
  //     Navigator.push(Constants.navigatorAppKey.currentContext!, MaterialPageRoute(builder: (context) => VenueScreen(venueId: id),));
  //     setState(() {
  //
  //     });
  //   }
  //   // return;
  // }
  //
  //
  // if(data==null) {
  //   isLinkDynamic=false;
  // } else {
  //   isLinkDynamic=true;
  // }
  dynamicLinks.onLink.listen((dynamicLinkData) {
    final Uri link=  dynamicLinkData.link;
    Utils.printData(link.toString());
    if ( link.queryParameters['title'] != null && int.tryParse(link.queryParameters['title'].toString()) != 0){
      isLinkDynamic.value=true;
      List<String> data = link.queryParameters['title'].toString().split(',id=');
      addDynamicLinkId.value=int.parse(data[1]);
      try{
        // print('-----------------------------------');
        // ignore: use_build_context_synchronously
        Navigator.push(Constants.navigatorAppKey.currentContext!,
            MaterialPageRoute(builder: (context) => AdScreen(propertyId: addDynamicLinkId.value),));
      }catch(e){}

    }
    return;
  }).onError((error) {
    Utils.printData('onLink error');
    Utils.printData(error.message);
    isLinkDynamic.value = false;
  });



}