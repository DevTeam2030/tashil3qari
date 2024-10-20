import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tashil_agary/domain/model/models/setting_model.dart';
import 'package:tashil_agary/domain/model/models/user_data_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../domain/model/models/general_property_model.dart';

GeneralPropertyModel constantProperty=GeneralPropertyModel(
 endDuration: '',userId: 0,
  isAuctionBefore: false,
  propertyDescription: '',longitude: 0,latitude: 0,kitchensNo: '',
 isAuction: false,
 gallery: [],floor: '',featured: false,country: '',city: '',bathroomsNo: '',rate: 0,countryId: 0,image: '',
 cityId: 0,id: 1,type: '',category: '',currency: '',price: '',propertySize: '',propertyTitle: '',roomsNo: '',show: false,wishlist: false

);
class Constants{
 // static bool buildAllCitiesMarkersBefore=false;
 // static    ValueNotifier<bool>   isRealLocationSelected= ValueNotifier<bool>(false);
 static  bool isProductionMode=false;

 static SettingModel settingModel=SettingModel(consultantFess: 0,countAllAds: 0,licenseFess: 0,categories: [],countries: [],
     appValueAfterSelling: 0,servicesAboutAr: '',servicesAboutEn: '',
     pledgeMessage: '',policyPrivacy: '',terms: '',
     finishingTypes: [],auctionDurations: [],reasons: [],currencies: [],featuredPlans:[],serialNumbers: [],nationalities: []);

 static const String getLocationUrl = 'http://www.geoplugin.net/json.gp?jsoncallback=?';
 static  LatLng currentLocationLatLngByUrl=const LatLng(0,0);
 static String locationText =Constants.currentLocationLatLngByUrl.latitude<=0||Constants.currentLocationLatLngByUrl.longitude<=0
     ?'':'lat=${Constants.currentLocationLatLngByUrl.latitude}&lon=${Constants.currentLocationLatLngByUrl.longitude}';


 static String mapKey='AIzaSyAVdd4L9gZO1sGjXrRR_iMXJRfHxR3qUOU';
 static String uriPrefix='https://tashilakariapp.page.link';

 static String package='com.tashil.akari';
 static double maxWidthImage=1000;
 static double maxHeightImage=1000;
 // static int imageQuality=100;


 static const Duration splashDuration = Duration(seconds: 3);
 static const Duration routeDuration = Duration(milliseconds: 400);
 static const Duration containerDuration = Duration(milliseconds: 750);
 static const Duration maxAgeDuration = Duration(days: 3);
 static const Duration maxStaleDuration = Duration(days: 7);



 // ignore: prefer_typing_uninitialized_variables
 static   UserDataModel? userDataModel;
 static bool isLogin=false;
 static ValueNotifier<int> notificationsCounter = ValueNotifier<int>(0);
 static String firebaseToken='';
 static String socialMediaPassword='QWEXCFG123';

 static bool isArabic=false;
 static String langCode='en';

 static List<String>directions=[ "east", "south", "west", "north",
  // "southeast", "southwest", "northeast", "northwest"
 ];

static ValueNotifier unReadNotificationCubit =ValueNotifier<int>(0);
 static bool isDarkMode=false;

 static GlobalKey<NavigatorState> navigatorAppKey = GlobalKey<NavigatorState>();

 static const List<BoxShadow> kBoxShadow = [
  // BoxShadow(
  //     color: Colors.black12,
  //     spreadRadius: 4,
  //     blurRadius: 2,
  //     offset: Offset(0, 2)),

  BoxShadow(
      color: Colors.black12,

   spreadRadius: 1,
   blurRadius: 1,
   offset: Offset(0, 3),
  )

 ];
 static const List<BoxShadow> kCArtBoxShadow = [
  // BoxShadow(
  //     color: Colors.black12,
  //     spreadRadius: 4,
  //     blurRadius: 2,
  //     offset: Offset(0, 2)),

  BoxShadow(
      color: Colors.black12,
      // spreadRadius: .6,
      // blurRadius: .6,
      // offset: Offset(2, 2)
   spreadRadius: 2,
   blurRadius: 2,
   offset: Offset(0, 2),
  )

 ];

 static const List<BoxShadow> kBoxShadowProfile = [
  BoxShadow(
      color: Colors.black12,
      spreadRadius: .6,
      blurRadius: .6,
      // offset: Offset(-1, 2)
  ),

  // BoxShadow(
  //     color: Colors.black12,
  //     spreadRadius: 2,
  //     blurRadius: 4,
  //     offset: Offset(0, 6))

 ];
}



class ConstantsKeys{
 //------------------ Keys
 static const langCodeKey='localePrefsLangCode';
 static const showAuthDashBoardBeforeKey='showAuthDashBoardBeforeKey';
 static const showLanguageScreenInFirstKey='showLanguageScreenInFirstKey';
 static  String  selectedCityIdnMapKey='selectedCityIdnMapKey';
 static const userDataModelKey='userDataModelKey';
 static  String  notificationKey='unSeenNotification' ;
 static  String  rememberPasswordPhoneKey='rememberPasswordPhoneKey' ;
 static  String  rememberPasswordKey='rememberPasswordKey' ;
 static  String  themeModeIsDarkKey='themeModeIsDarkKey' ;

}
