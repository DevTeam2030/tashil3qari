import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/domain/model/model/home_main_category.dart';
import 'package:tashil_agary/presentation/cart/cart_screen.dart';
import 'package:tashil_agary/presentation/category/sub_categories_screen.dart';
import 'package:tashil_agary/presentation/dashboard/dash_board_screen.dart';
import 'package:tashil_agary/presentation/favorite/favorite_screen.dart';
import 'package:tashil_agary/presentation/filter/search_filter_screen.dart';
import 'package:tashil_agary/presentation/general/app_screens/customer_support_screen.dart';
import 'package:tashil_agary/presentation/general/app_screens/language_screen.dart';
import 'package:tashil_agary/presentation/general/app_screens/notification_setting_screen.dart';
import 'package:tashil_agary/presentation/general/app_screens/privacy_policy.dart';
import 'package:tashil_agary/presentation/general/app_screens/setting_screen.dart';
import 'package:tashil_agary/presentation/general/app_screens/social_login_screen.dart';
import 'package:tashil_agary/presentation/general/app_screens/splash_screen.dart';
import 'package:tashil_agary/presentation/general/app_screens/terms_of_service_screen.dart';
import 'package:tashil_agary/presentation/general/app_screens/terms_of_use_screen.dart';
import 'package:tashil_agary/presentation/general/auht/auth_dashboard_screen.dart';
import 'package:tashil_agary/presentation/general/auht/forget_passwword/enter_email_forget_password_screen.dart';
import 'package:tashil_agary/presentation/general/auht/login/login_screen.dart';
import 'package:tashil_agary/presentation/general/auht/otp/otp_imports.dart';
import 'package:tashil_agary/presentation/general/auht/register/add_location/add_location_register_screen.dart';
import 'package:tashil_agary/presentation/general/auht/register/fill_personal_data/fill_personal_data_register_screen.dart';
import 'package:tashil_agary/presentation/general/auht/register/register_screen.dart';
import 'package:tashil_agary/presentation/notifications/notifications_screen.dart';
import 'package:tashil_agary/presentation/orders/orders_screen.dart';
import 'package:tashil_agary/presentation/orders_details/orders_details_screen.dart';
import 'package:tashil_agary/presentation/search/search_screen.dart';

import '../domain/model/models/auth/register_model.dart';
import '../domain/model/models/property_info_model.dart';
import '../domain/model/models/user_ads_model.dart';
import '../presentation/general/ad/ad_imports.dart';
import '../presentation/general/ad/owner_ads.dart';
import '../presentation/general/add_ad/add_ad_imports.dart';
import '../presentation/general/add_bid/bid_imports.dart';
import '../presentation/general/add_complaint/add_complaint_imports.dart';
import '../presentation/general/auctions/auctions_imports.dart';
import '../presentation/general/chats/all_chat/all_chat.dart';
import '../presentation/general/council/council_imports.dart';
import '../presentation/general/edit_ad/edit_ad_imports.dart';
import '../presentation/general/favorites/favorites_screen.dart';
import '../presentation/general/home_Screen/home_imports.dart';
import '../presentation/general/personal_profile/personal_profile_imports.dart';
import '../presentation/general/search_list/search_list_screen.dart';
import '../presentation/general/services/services_imports.dart';
import '../presentation/general/upgrade_user_to_consultant/upgrade_user_to_consultant_imports.dart';
import '../presentation/general/your_consultant/your_consultant_imports.dart';





class Routes{
  static const String main ='/';
  static const String splashScreen ='/SplashScreen';
  static const String loginScreen ='/LoginScreen';
  static const String otpScreen ='/OtpScreen';
  static const String registerScreen ='/RegisterScreen';
  static const String fillPersonalDataRegisterScreen ='/FillPersonalDataRegisterScreen';
  static const String addLocationRegisterScreen ='/AddLocationRegisterScreen';
  static const String dashBoardScreen ='/DashBoardScreen';
  static const String homeScreen ='/HomeScreen';
  static const String searchLocationScreen ='/SearchLocationScreen';
  static const String searchListScreen ='/SearchListScreen';
  static const String addAdScreen ='/AddAdScreen';
  static const String addAdImagesScreen ='/AddAdImagesScreen';
  static const String addAdLocationScreen ='/AddAdLocationScreen';
  static const String addAdRequirementsScreen ='/AddAdRequirementsScreen';
  static const String ifAddAdBidScreen ='/IfAddAdBidScreen';
  static const String addAdFeaturedScreen ='/AddAdFeaturedScreen';
  static const String favoritesScreen ='/FavoritesScreen';
  static const String addAdBidScreen ='/AddAdBidScreen';
  static const String selectRealEstateConsultantScreen ='/SelectRealEstateConsultantScreen';
  static const String yourConsultantScreen ='/YourConsultantScreen';
  static const String yourConsultantProfileScreen ='/YourConsultantProfileScreen';
  static const String servicesScreen ='/ServicesScreen';
  static const String personalProfileScreen ='/PersonalProfileScreen';
  static const String upgradeUserToConsultantScreen ='/UpgradeUserToConsultantScreen';
  static const String adScreen ='/AdScreen';
  static const String allOwnerAds ='/AllOwnerAds';
  static const String editAdScreen ='/EditAdScreen';
  static const String adPhotoViewScreen ='/AdPhotoViewScreen';
  static const String auctionsScreen ='/AuctionsScreen';
  static const String bidScreen ='/BidScreen';
  static const String homeAddLocationScreen ='/HomeAddLocationScreen';
  static const String addComplaintScreen ='/AddComplaintScreen';
  static const String councilScreen ='/CouncilScreen';
  static const String chatScreen ='/ChatScreen';
  static const String allChatScreen ='/AllChatScreen';





  static const String privacyPolicyScreen ='/PrivacyPolicyScreen';
  static const String termsOfServiceScreen ='/TermsOfServiceScreen';
  static const String termsOfUseScreen ='/TermsOfUseScreen';
  static const String authDashBoardScreen ='/AuthDashBoardScreen';

  static const String changePasswordScreen ='/ChangePasswordScreen';
  static const String enterEmailForgetPasswordScreen ='/EnterEmailForgetPasswordScreen';
  static const String forgetPasswordScreen ='/ForgetPasswordScreen';
  static const String ordersDetailsScreen ='/OrdersDetailsScreen';
  static const String ordersScreen ='/OrdersScreen';





  static const String searchScreen ='/SearchScreen';
  static const String subCategoriesScreen ='SubCategoriesScreen';
  static const String oneCategoryScreen ='OneCategoryScreen';
  static const String searchFilterScreen ='/SearchFilterScreen';
  static const String productScreen ='/ProductScreen';
  static const String cartScreen ='/CartScreen';
  static const String profileScreen ='/ProfileScreen';
  static const String favoriteScreen ='/FavoriteScreen';


  static const String searchByMapScreen ='/SearchByMapScreen';


  static const String venueScreen ='/VenueScreen';
  static const String allServicesScreen ='/AllServicesScreen';


  static const String selectServicesScreen ='/SelectServicesScreen';
  static const String selectStaffScreen ='/SelectStaffScreen';
  static const String selectTimeAndDateScreen ='/SelectTimeAndDateScreen';
  static const String confirmAppointmentScreen ='/ConfirmAppointmentScreen';
  static const String confirmedAppointmentScreen ='/ConfirmedAppointmentScreen';
  static const String cancelAppointmentScreen ='/CancelAppointmentScreen';
  static const String viewProfileScreen ='/ViewProfileScreen';
  static const String editProfileScreen ='/EditProfileScreen';



  static const String customerSupportScreen ='/CustomerSupportScreen';
  static const String socialLoginScreen ='/SocialLoginScreen';
  static const String settingsScreen ='/SettingsScreen';
  static const String languageScreen ='/LanguageScreen';
  static const String notificationsSettingsScreen ='/NotificationsSettingsScreen';
  static const String notificationsScreen ='/NotificationsScreen';
  static const String appointmentsScreen ='/AppointmentsScreen';
  static const String rebookAppointmentScreen ='/RebookAppointmentScreen';
  static const String rescheduleAppointmentScreen ='/RescheduleAppointmentScreen';


  // static const String addressesScreen ='/AddressesScreen';
  static const String addAddressScreen ='/AddAddressScreen';





}

class RouteGenerator{
  static Route<dynamic>getRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.splashScreen :return MaterialPageRoute(builder: (context) =>  const SplashScreen(),);
      case Routes.privacyPolicyScreen :return MaterialPageRoute(builder: (context) =>  const PrivacyPolicyScreen(),);
      case Routes.termsOfUseScreen :return MaterialPageRoute(builder: (context) =>  const TermsOfUseScreen(),);
      case Routes.termsOfServiceScreen :return MaterialPageRoute(builder: (context) =>  const TermsOfServiceScreen(),);
      case Routes.authDashBoardScreen :return MaterialPageRoute(builder: (context) =>  const AuthDashBoardScreen(),);

      case Routes.loginScreen :return MaterialPageRoute(builder: (context) =>  const LoginScreen(),);
      case Routes.registerScreen :return MaterialPageRoute(builder: (context) =>
          FillPersonalDataRegisterScreen( registerModel: RegisterModel(email: '',phone: '',type: UserType.consultant,id: 0)),);
      case Routes.fillPersonalDataRegisterScreen :return MaterialPageRoute(builder: (context) =>  const RegisterScreen(),);
      case Routes.addLocationRegisterScreen :return MaterialPageRoute(builder: (context) =>
          AddLocationRegisterScreen( registerModel: RegisterModel(email: '',phone: '',type: UserType.consultant,id: 0)),);
      case Routes.enterEmailForgetPasswordScreen :return MaterialPageRoute(builder: (context) =>  const EnterEmailForgetPasswordScreen(),);
      case Routes.otpScreen :return MaterialPageRoute(builder: (context) => OtpScreen(emailToVerify: '',registerModel: RegisterModel(email: '',phone: '',type: UserType.consultant,id: 0)),);
      case Routes.ordersScreen :return MaterialPageRoute(builder: (context) =>  const OrdersScreen(),);
      case Routes.ordersDetailsScreen :return MaterialPageRoute(builder: (context) =>  const OrdersDetailsScreen(),);

      case Routes.homeScreen :return MaterialPageRoute(builder: (context) =>  const HomeScreen(),);
      case Routes.searchLocationScreen :return MaterialPageRoute(builder: (context) =>    SearchLocationScreen(onTap: (v,x,y){}),);
      case Routes.searchListScreen :return MaterialPageRoute(builder: (context) =>  const SearchListScreen(),);
      case Routes.dashBoardScreen :return MaterialPageRoute(builder: (context) =>  const DashBoardScreen(),);
      case Routes.addAdScreen :return MaterialPageRoute(builder: (context) =>  const AddAdScreen(),);
      case Routes.editAdScreen :return MaterialPageRoute(builder: (context) =>   EditAdScreen(
        userAd: UserAdsModel(
            apartmentsNo: '',buildingAge:'' ,direction: [],receptionsNo: '',storesNo: '',streetWidth: '',feminine: false,
          id: 0,type: '',image: '',roomsNo: '',propertyTitle: '',currency: '',category: '',gallery: [],published: false,show: false,
          wishlist: false,lastUpadte: '',propertySize: '',price: '',cityId: 0,countryId: 0,rate: 0,bathroomsNo: '',city:'',
           country: '',featured: false,floor: '',kitchensNo: '',latitude: 0,longitude: 0,currencyId: '',floorsNo: '',
            propertyDescription: '',haveConsultant: false,video:'',adCreatedAt: '',auction: false,width: '',length: '',
            license: '',finishingTypeId: '',finishingType: '',catId: 0,
          airConditioners: false,amusementPark: false,annex: false,carEntrance: false,electricityAvailability: false,
          elevator: false,familySection: false,
          footballField: false,
          swimmingPool: false,volleyballCourt: false,waterAvailability: false,
          monthly: true
        ),
      ),);
      case Routes.addAdImagesScreen :return MaterialPageRoute(builder: (context) =>   AddAdImagesScreen(addAdtData: AddAdtData()),);
      case Routes.addAdLocationScreen :return MaterialPageRoute(builder: (context) =>   AddAdLocationScreen(addAdtData: AddAdtData()),);
      case Routes.addAdRequirementsScreen :return MaterialPageRoute(builder: (context) =>   AddAdRequirementsScreen(addAdtData: AddAdtData()),);
      case Routes.addAdBidScreen :return MaterialPageRoute(builder: (context) =>   AddAdBidScreen(propertyId: 0,isPropertyFeatured: false),);
      case Routes.ifAddAdBidScreen :return MaterialPageRoute(builder: (context) =>   IfAddAdBidScreen(propertyId: 0,),);
      case Routes.addAdFeaturedScreen :return MaterialPageRoute(builder: (context) =>   AddAdFeaturedScreen(propertyId: 0,),);
      case Routes.selectRealEstateConsultantScreen :return MaterialPageRoute(builder: (context) =>   SelectRealEstateConsultantScreen(addAdtData: AddAdtData()),);
      case Routes.yourConsultantScreen :return MaterialPageRoute(builder: (context) =>   const YourConsultantScreen(),);
      case Routes.yourConsultantProfileScreen :return MaterialPageRoute(builder: (context) => const  YourConsultantProfileScreen(consultantId: 0),);
      case Routes.servicesScreen :return MaterialPageRoute(builder: (context) =>   const ServicesScreen(),);
      case Routes.personalProfileScreen :return MaterialPageRoute(builder: (context) => const  PersonalProfileScreen(),);
      case Routes.upgradeUserToConsultantScreen :return MaterialPageRoute(builder: (context) => const  UpgradeUserToConsultantScreen(),);
      case Routes.adScreen :return MaterialPageRoute(builder: (context) =>    AdScreen(propertyId: 0,),);
      case Routes.allOwnerAds :return MaterialPageRoute(builder: (context) =>    AllOwnerAds(ownerId: 0,ownerName: '',),);
      case Routes.adPhotoViewScreen :return MaterialPageRoute(builder: (context) =>    AdPhotoViewScreen(propertyInfo: PropertyInfoModel(
        id: 0,cityId: 0,image: '',countryId: 0,rate: 0,bathroomsNo: '',city: '',feminine: false,country: '',featured: false,finishingType: '',
        floorsNo: '',
        apartmentsNo: '',buildingAge:'' ,direction: [],receptionsNo: '',storesNo: '',streetWidth: '',
        type: '',price: 0,currency: '',userImage: '',catId: 0,auctionsUsers: [],minimumAuction: '0',video: '',
        monthly: true,
          airConditioners: false,amusementPark: false,annex: false,carEntrance: false,electricityAvailability: false,
          elevator: false,familySection: false,
          footballField: false,
          swimmingPool: false,volleyballCourt: false,waterAvailability: false,
        endDurationDays: '',endDurationHours: '',endDurationMintues: '',countAuctions: 0,isLive: false,isAuction: false,
        width: '',userType: UserType.user,address:'' ,adCreatedAt: '',license:'' ,
        finishingTypeId: '',floor: '',gallery: [],kitchensNo: '',latitude: 0,longitude: 0,propertyTitle: '',
        roomsNo: '',wishlist: false,userRate: 0,
        propertyDescription: '',propertySize:'',
      adNo: '',lastUpadte: '',length: '',timeAgo: '',userEmail: '', userId: 0,userLicenseNumber: '',userName: '',
        userPhone: '',viewNo: 0
      )));
      case Routes.auctionsScreen :return MaterialPageRoute(builder: (context) =>    AuctionsScreen(),);
      case Routes.bidScreen :return MaterialPageRoute(builder: (context) =>    BidScreen(adId: 0),);
      case Routes.homeAddLocationScreen :return MaterialPageRoute(builder: (context) =>    HomeAddLocationScreen(),);
      case Routes.addComplaintScreen :return MaterialPageRoute(builder: (context) =>    AddComplaintScreen(propertyId: 0),);
      case Routes.councilScreen :return MaterialPageRoute(builder: (context) =>    const CouncilScreen(),);
      // case Routes.chatScreen :return MaterialPageRoute(builder: (context) =>    const ChatScreen(receiverId: 0,propertyId: null,receiverImage: '',receiverName: '',receiverType: UserType.consultant),);
      case Routes.allChatScreen :return MaterialPageRoute(builder: (context) =>    const AllChatScreen(),);





      // case Routes.searchScreen :return MaterialPageRoute(builder: (context) =>  const SearchScreen(cat: null, subCat: null,),);
      // case Routes.subCategoriesScreen :return MaterialPageRoute(builder: (context) =>   SubCategoriesScreen(
      //     cat: HomeMainCategoryModel(id: 0, name: '', image: '', background: '',countSubCats: 0,
      //     subCategories: [])),);
      // case Routes.oneCategoryScreen :return MaterialPageRoute(builder: (context) =>   OneCategoryScreen(
      //   cat: HomeMainCategoryModel(id: 0, name: '', image: '', background: '',countSubCats: 0,subCategories: [])),);
      case Routes.searchFilterScreen :return MaterialPageRoute(builder: (context) =>  SearchFilterScreen(onSearch: (){},));
      case Routes.cartScreen :return MaterialPageRoute(builder: (context) =>  const CartScreen());
      case Routes.favoriteScreen :return MaterialPageRoute(builder: (context) =>  const FavoriteScreen());
      case Routes.favoritesScreen :return MaterialPageRoute(builder: (context) =>  const FavoritesScreen());







      case Routes.customerSupportScreen :return MaterialPageRoute(builder: (context) => const CustomerSupportScreen(),);
      case Routes.settingsScreen :return MaterialPageRoute(builder: (context) => const SettingsScreen(),);
      case Routes.socialLoginScreen :return MaterialPageRoute(builder: (context) => const SocialLoginScreen(),);
      case Routes.languageScreen :return MaterialPageRoute(builder: (context) => const LanguageScreen(),);
      case Routes.notificationsSettingsScreen :return MaterialPageRoute(builder: (context) => const NotificationsSettingsScreen(),);
      case Routes.notificationsScreen :return MaterialPageRoute(builder: (context) => const NotificationsScreen(),);


      default:
       return  unDefinedRoute();

    }


  }
  static Route<dynamic>unDefinedRoute(){
    return MaterialPageRoute(builder: (context) => Scaffold(
      appBar: AppBar(title:  Text('noRoutFounded'.tr())),
      body:  Center(child: Text('noRoutFounded'.tr())),
    ));
  }
}





class MyRoute {
  void navigate({required BuildContext context, required Widget route, bool withReplace = false,
    PageTransitionType pageTransitionType=PageTransitionType.leftToRightWithFade,int reverseDuration=100,int duration=100}) {
    if (withReplace) {
      Navigator.pushReplacement(context, PageTransition(type: pageTransitionType, child: route,
          ctx: context,

          // inheritTheme: true,
          duration: Duration(milliseconds:duration ),
          reverseDuration:  Duration(milliseconds:reverseDuration)));
    } else {
      Navigator.push(context, PageTransition(type: pageTransitionType, child: route,
          // inheritTheme: true,
          duration: Duration(milliseconds:duration),reverseDuration:  Duration(milliseconds:reverseDuration)));

    }

  }

  void navigateAndRemove({
    required BuildContext context,
    required Widget route,
    PageTransitionType pageTransitionType=PageTransitionType.leftToRightWithFade,int reverseDuration=100,int duration=100
  }) {
    Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
            type:pageTransitionType, child: route,
            duration: Duration(milliseconds:duration ),reverseDuration:  Duration(milliseconds:reverseDuration)),
            (route) => false);
  }

}
gotoSplash(BuildContext context){
  FocusScope.of(context).unfocus();
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
  const SplashScreen()), (Route<dynamic> route) => false);
}
gotoIntro({required BuildContext context, int? currentIndexScreen}){
  PageTransitionType pageTransitionType=PageTransitionType.leftToRightWithFade;
  // int reverseDuration=100, duration=100;
  FocusScope.of(context).unfocus();
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
   DashBoardScreen(currentIndexScreen: currentIndexScreen,)), (Route<dynamic> route) => false);


  // Navigator.pushAndRemoveUntil(
  //     Constants.navigatorAppKey.currentState!.context,
  //     PageTransition(type:pageTransitionType, child: const DashBoardScreen(),), (route) => false);
}
gotoIntroLogin({required BuildContext context, int? currentIndexScreen}){
  PageTransitionType pageTransitionType=PageTransitionType.leftToRightWithFade;
  // int reverseDuration=100, duration=100;
  FocusScope.of(context).unfocus();
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
      LoginScreen()), (Route<dynamic> route) => false);


  // Navigator.pushAndRemoveUntil(
  //     Constants.navigatorAppKey.currentState!.context,
  //     PageTransition(type:pageTransitionType, child: const DashBoardScreen(),), (route) => false);
}

gotoLogin(BuildContext context){

  FocusScope.of(context).unfocus();
  // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
  // const LoginScreen()), (Route<dynamic> route) => false);
  Navigator.push(context, PageTransition(type: PageTransitionType.leftToRightWithFade,
    child: const LoginScreen(),));

}


