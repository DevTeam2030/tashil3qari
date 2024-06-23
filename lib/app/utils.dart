import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:map_launcher/map_launcher.dart' as mapLuncher;
import 'package:nepali_date_picker/nepali_date_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tashil_agary/app/cache_helper.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/loading_manager.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/domain/model/country_in_out_model.dart';
import 'package:tashil_agary/domain/model/models/user_data_model.dart';
import 'package:tashil_agary/presentation/general/auht/login/login_screen.dart';
import 'package:tashil_agary/presentation/dashboard/dash_board_screen.dart';
import 'package:tashil_agary/providers/home_provider.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/route_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart' as picker;

import '../providers/profile_provider.dart';
import '../utilites/image_manager.dart';
import 'package:permission_handler/permission_handler.dart'as permission_handler;


EdgeInsets returnPadding(){
  return  const EdgeInsets.symmetric(horizontal: PaddingManager.p14);
}

class Utils{
 static printData(String? message) {
    if(Constants.isProductionMode==false) {
      debugPrint('$message');
    }
  }

  static Future<double>distanceBetween({required LatLng location1,required LatLng location2 }) async{
    double? _distanceInMeters = await Geolocator.distanceBetween(
      location1.latitude,
      location1.longitude,
      location2.latitude,
      location2.longitude,
    );
    // print('distance in meters is $_distanceInMeters');
    return double.parse(_distanceInMeters.toStringAsFixed(2));
  }

  static bool checkIsLogin() {
    if(Constants.isLogin==false){
      BuildContext context=Constants.navigatorAppKey.currentState!.context;
      LoadingDialog().optionalAlertDialog(context:context,
          title: 'LogIn'.tr(), message:'UnauthenticatedMessage1'.tr(),
          okClick: ()=>Utils.logOut(context));
      return false;
    }
    return true;
  }
 static Future<void>precacheImageNetwork(List<String> images,)async{
   BuildContext context=Constants.navigatorAppKey.currentState!.context;
   for(var item in images){
     await   precacheImage(NetworkImage(item), context,size: Size(10, 10));
   }

 }
 static Future<File?> getAttachmentFile(FileType fileType) async {
   if (fileType == FileType.any) {
     return await getAPdfFile();
   }
   FilePickerResult? result = await FilePicker.platform.pickFiles(
     type: fileType,
     allowMultiple: false,
   );
   if (result != null) {
     File imageFile = File(result.files.single.path!);
     return imageFile;
   }
   return null;
 }

 static Future<File?> getAPdfFile() async {
   FilePickerResult? result = await FilePicker.platform.pickFiles(
       type: FileType.custom,
       allowMultiple: false,
       allowedExtensions: ['pdf']);
   if (result != null&&result.files.single.path!.contains('.pdf')) {
     File imageFile = File(result.files.single.path!);
     return imageFile;
   }
   return null;
 }




  static showAlertSuccess({required BuildContext context,required String message}) {
    LoadingDialog().widgetAlertDialog(context:context,
        widget:  Center(
            child: Material(
              borderRadius: BorderRadius.circular(RadiusManager.r18),
              child: SizedBox(
                height: .3.sh,
                width: .8.sw,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(ImageManager.alertSuccess,height: 140,fit: BoxFit.fill,),
                    const AppSizeBox(height: 16,),
                    Padding(
                      padding: returnPadding(),
                      child:AppText(title:message,
                        titleSize: FontSize.s18, titleAlign: TextAlign.center,
                        titleColor: ColorManager.text,
                        fontWeightType: FontWeightType.medium,
                        titleMaxLines: 3,),
                    )
                  ],
                ),
              ),
            )));
  }
 static Future<void> pickDateDialog2({required BuildContext context ,
   required DateTime? selectedDate, required Function(DateTime) onSuccess}) async {
   NepaliDateTime initialDate=NepaliDateTime.now();
   if(selectedDate!=null) {
     initialDate = NepaliDateTime.fromDateTime(selectedDate);
   }
   NepaliDateTime? selectedDateTime=await picker.showMaterialDatePicker(
     context: context,
     initialDate:initialDate,

     firstDate: NepaliDateTime(2000),
     lastDate: NepaliDateTime(2090),
     initialDatePickerMode: DatePickerMode.day,
     locale: context.locale.languageCode=='en'?Locale('en', 'US'):Locale('ar', 'EG'),
   );
    if(selectedDateTime!=null) {
      DateTime dateTime=selectedDateTime.toDateTime();
      onSuccess(dateTime);
    }
 }

 static Future<void> pickDateDialog({required BuildContext context ,
   required DateTime? selectedDate, required Function(DateTime) onSuccess}) async {
   DateTime  initialDate= DateTime.now();
    if(selectedDate!=null) {
      initialDate = selectedDate;
    }
   showDatePicker(
     context: context,
     // useRootNavigator: true,
     initialDate: initialDate,
     firstDate: DateTime.now(),
     keyboardType: TextInputType.datetime,
     confirmText: 'SelectDate'.tr(),
     helpText: 'SelectDate'.tr(),
     cancelText: 'Cancel'.tr(),
     initialEntryMode: DatePickerEntryMode.calendarOnly,
     locale: context.locale.languageCode=='en'?Locale('en', 'US'):Locale('ar', 'EG'),

     builder: (context, child) =>  Theme(
       data: ThemeData.light().copyWith(
         colorScheme: ColorScheme.light(
           onPrimaryContainer: ColorManager.green,
           primary: ColorManager.primary,
           onPrimary: ColorManager.primaryWithOpacity,
           onSurface: ColorManager.drawerInActive,
           onSecondary: ColorManager.primaryWithOpacity,
           onInverseSurface: ColorManager.primary,
         ),
         textButtonTheme: TextButtonThemeData(
           style: TextButton.styleFrom(
             padding: EdgeInsets.symmetric(horizontal: PaddingManager.p10,vertical: PaddingManager.p3),
             backgroundColor: ColorManager.primary,
             fixedSize: Size(.3.sw, AppSize.s40),
             minimumSize: Size(.2.sw, AppSize.s40),
             maximumSize: Size(.3.sw, AppSize.s40),
             // textStyle: getAppTextStyle(titleColor: ColorManager.white,
             //     titleSize: FontSize.s14,fontWeightType: FontWeightType.medium,underline: false),
             primary: ColorManager.white, // button text color
           ),
         ),
       ),
       child: child!,
     ),
     initialDatePickerMode: DatePickerMode.day,
     lastDate: DateTime(2100),)
       .then((pickedDate) {
     if (pickedDate != null) {
       onSuccess(pickedDate);
     }

   },

   );

 }


 static Future<void> pickTimeDialog({required BuildContext context ,
   required TimeOfDay? selectedTime, required Function(TimeOfDay) onSuccess}) async {
   TimeOfDay  initialTime= TimeOfDay.now();
    if(selectedTime!=null) {
      initialTime = selectedTime;
    }
    TimeOfDay? picked_s = await showTimePicker(
       context: context,
        confirmText: 'SelectTime'.tr(),
        helpText: 'SelectTime'.tr(),
        cancelText: 'Cancel'.tr(),
        initialTime: initialTime,
        builder: (BuildContext context, Widget? child) {
     return Theme(
       data: ThemeData.light().copyWith(
         colorScheme: ColorScheme.light(
           onPrimaryContainer: ColorManager.green,
           primary: ColorManager.primary,
           onPrimary: ColorManager.primaryWithOpacity,
           onSurface: ColorManager.drawerInActive,
           onSecondary: ColorManager.primaryWithOpacity,
           onInverseSurface: ColorManager.primary,
         ),
         textButtonTheme: TextButtonThemeData(
           style: TextButton.styleFrom(
             padding: EdgeInsets.symmetric(horizontal: PaddingManager.p10,vertical: PaddingManager.p3),
             backgroundColor: ColorManager.primary,
             fixedSize: Size(.3.sw, AppSize.s40),
             minimumSize: Size(.2.sw, AppSize.s40),
             maximumSize: Size(.3.sw, AppSize.s40),
             // textStyle: getAppTextStyle(titleColor: ColorManager.white,
             //     titleSize: FontSize.s14,fontWeightType: FontWeightType.medium,underline: false),
             primary: ColorManager.white, // button text color
           ),
         ),
       ),
       child: MediaQuery(
         data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
         child: child!,
       ),
     );});

   if (picked_s != null && picked_s != selectedTime )
     onSuccess(picked_s);

 }



 static Future<LatLng?> getCurrentLocationLatLng() async {
   bool serviceEnabled;
   PermissionStatus permissionGranted;
   Location location = Location();
   // Check if location service is enable
   serviceEnabled = await location.serviceEnabled();
   if (!serviceEnabled) {
     serviceEnabled = await location.requestService();
     if (!serviceEnabled) {
       return null;
     }
   }
   // Check if permission is granted
   permissionGranted = await location.hasPermission();
   permissionGranted = await location.hasPermission();
   if (permissionGranted == PermissionStatus.denied) {
     permissionGranted = await location.requestPermission();
     if (permissionGranted != PermissionStatus.granted) {
       return null;
     }
   }
   permissionGranted = await location.hasPermission();
   // if (permissionGranted == PermissionStatus.denied||permissionGranted != PermissionStatus.granted) {
   //   permissionGranted = await location.requestPermission();
   //   if (permissionGranted != PermissionStatus.granted) {
   //     return null;
   //   }
   // }
   //print('-----');
   LocationData locationData = await location.getLocation();
    LatLng latLng=LatLng(locationData.latitude!, locationData.longitude!);

   return latLng;

 }

static Future<void> setCurrentLocation()async{
   LatLng? latLng =await Utils.getCurrentLocationLatLng();

   if(latLng!=null){
     Constants.currentLocationLatLngByUrl=latLng;
   }else{
     LatLng? latLng1 =await Utils.getCurrentLocationLatLngByUrl();
     Constants.currentLocationLatLngByUrl=latLng1;
   }

 }
 static Future<LatLng> getCurrentLocationLatLngByUrl() async {
   LatLng latLng = const LatLng(0, 0);
   try {
     final response = await http.get(Uri.parse(Constants.getLocationUrl));

     if (response.statusCode == 200) {
       String value = response.body;
       CountryInOutModel country = CountryInOutModel.fromJson(
           json.decode((value).replaceAll('%3F(', '').replaceAll(')', '')));
       latLng = LatLng(double.parse(country.geopluginLatitude),
           double.parse(country.geopluginLongitude));
     } else {
       debugPrint('faill to getCurrentLocationLatLngByUrl data');
     }
   } catch (e) {
     debugPrint(e.toString());
   }
 Constants.currentLocationLatLngByUrl=latLng;
   return latLng;
 }

 // getCurrentCountry() async {
 //   try {
 //     var value = await Constants().getRequestExternalUrl(AppSetting.getLocationUrl);
 //     if (value == null) return null;
 //     CountryInOut country = CountryInOut.fromJson(json.decode(
 //         (value as String).replaceAll('%3F(', '').replaceAll(')', '')));
 //     return country;
 //   } catch (e) {
 //     return null ;
 //   }
 // }

 static bool checkIfUserLogin({required BuildContext context}) {
   if(Constants.isLogin&&Constants.userDataModel!=null)return true;
   // LoadingDialog.showToastNotification('youMustLogInFirst'.tr());

   LoadingDialog().optionalAlertDialog(
     context: context,
     title: 'signIn'.tr(),
     message: 'youMustSignInFirst'.tr(),
     okClick: (){
      // Navigator.pop(context);
       // gotoLogin(Constants.navigatorAppKey.currentState!.context);
       gotoIntroLogin(context: context);
     },
     cancelOnClick: ()=>Navigator.pop(context),
   );
   return false;
 }


 static void logOut(BuildContext context) {
   CacheHelper.clearUserModelData();
   context.read<ProfileProvider>().notifyListeners();
   gotoIntro(context:context,currentIndexScreen: 0);
   MyRoute().navigate(context: context, route: const LoginScreen());
   // Navigator.pushNamed(context, Routes.loginScreen);
 }

 static void login({required BuildContext context,required UserDataModel userDataModel}) {
   CacheHelper.saveDataToUserModel(userDataModel: userDataModel);

   gotoIntro(context: context,currentIndexScreen: 0);
   // ignore: use_build_context_synchronously
   // Navigator.canPop(context)?Navigator.pop(context):
   // MyRoute().navigate(context: context, route: const DashBoardScreen(currentIndexScreen: 0),);
 }

 static String getUserGenderStringTr({required String userGender}) {
   if(userGender=='female') {
     return 'Female'.tr();
   }
   if(userGender=='male') {
     return 'Male'.tr();
   } else {
     return 'not_defined'.tr();
   }
 }

 static GenderType getUserGenderType({required String userGender}) {
   if(userGender=='female') {
     return GenderType.female;
   } else {
     return GenderType.male;
   }
 }
 static AppointmentStatus appointmentStatus({required String status}) {
   if(status=='new') {
     return AppointmentStatus.newStatus;
   }
   else if(status=='cancelled') {
     return AppointmentStatus.cancelledStatus;
   }
   else {
     return AppointmentStatus.finishedStatus;
   }
 }
 static AddressType getAddressType({required String type}) {
   if(type.toLowerCase()=='home') {
     return AddressType.home;
   }
   else if(type.toLowerCase()=='work') {
     return AddressType.work;
   } else {
     return AddressType.other;
   }
 }

 static String getAddressTypeString({required AddressType addressType}) {
   if(addressType==AddressType.home) {
     return 'Home'.tr();
   }
   else if(addressType==AddressType.work) {
     return 'Work'.tr();
   } else {
     return 'Other'.tr();
   }
 }
 static String setAddAddressTypeString({required AddressType addressType}) {
   if(addressType==AddressType.home) {
     return 'home';
   }
   else if(addressType==AddressType.work) {
     return 'work';
   } else {
     return 'Other';
   }
 }

 static RegisterType getRegistrationType({required String registrationType}) {
   if(registrationType=='facebook') {
     return RegisterType.facebook;
   }
   else if(registrationType=='google') {
     return RegisterType.google;
   }
   else if(registrationType=='apple') {
     return RegisterType.apple;
   }
   else {
     return RegisterType.email;
   }
 }

 static String getRegistrationTypeString({required RegisterType registerType}) {
   if(registerType==RegisterType.facebook) {
     return 'facebook';
   }
   else if(registerType==RegisterType.google) {
     return 'google';
   }
   else if(registerType==RegisterType.apple) {
     return 'apple';
   }
   else {
     return 'email';
   }
 }



static String checkStartDigitsPhone({required String phone}) {
   if (phone.startsWith('05')) {
     phone = phone.replaceFirst(RegExp('05'), '5', 0);
   } else if (phone.startsWith('01')) {
     phone = phone.replaceFirst(RegExp('01'), '1', 0);
   } else {
     phone = phone;
   }
   printData('phone is ====>  $phone');
   return phone;
 }

 Future<void> uploadModalBottomSheet({ required BuildContext context,required Function(XFile) onGalleryTap,
   required Function(XFile) onCameraTap,}) async {
   Utils.showModalBottomSheetApp(widget: Material(
       child: Container(
         width: 1.0.sw,
         height: .2.sh,
         padding:const  EdgeInsets.symmetric(horizontal:PaddingManager.p12),
         child: Column(
           children: [
             AppSizeBox(height: AppSize.s30.h,),
             InkWell(
               onTap: ()async{
                 Navigator.pop(context);
                 XFile? photo=await byGallery();
                 if(photo!=null) onGalleryTap(photo);
               },
               child: Row(
                 children: [
                   const Icon(Icons.photo,size: AppSize.s30,color: ColorManager.primary,),
                   AppSizeBox(width: AppSize.s12.w),
                   AppText(
                       title: 'gallery'.tr(),
                       titleAlign: TextAlign.start,
                       titleColor: ColorManager.text,
                       titleMaxLines: 2,
                       titleHeight: 1.1,
                       fontWeightType: FontWeightType.regular,
                       titleSize: FontSize.s16)
                 ],
               ),
             ),
             AppSizeBox(height: AppSize.s30.h,),
             InkWell(
               onTap: ()async{
                 Navigator.pop(context);
                 XFile? photo=await byCamera();
                 if(photo!=null) onCameraTap(photo);
               },
               child: Row(
                 children: [
                   const Icon(Icons.camera_alt_outlined,size: AppSize.s30,color: ColorManager.primary,),
                   AppSizeBox(width: AppSize.s12.w),
                   AppText(
                       title: 'camera'.tr(),
                       titleAlign: TextAlign.start,
                       titleColor: ColorManager.text,
                       titleMaxLines: 2,
                       titleHeight: 1.1,
                       fontWeightType: FontWeightType.regular,
                       titleSize: FontSize.s16)
                 ],
               ),
             )
           ],
         ),
       ),
     ),
   );


 }

 static Future<XFile?> byCamera() async {
    XFile? photo;
   final ImagePicker picker = ImagePicker();
   try{
     photo = await picker.pickImage(source: ImageSource.camera);

     // ignore: empty_catches
   }catch(e){

   }
return photo;

 }

 static Future<XFile?> getVideo() async {
   final ImagePicker _picker = ImagePicker();
   final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
   // if (video != null) {
   //   File imageFile = File(video.path);
   //   return imageFile;
   // }
   return video;
 }

 static Future<XFile?> byGallery() async {
   XFile? photo;
   final ImagePicker picker = ImagePicker();
   try{
      photo = await picker.pickImage(source: ImageSource.gallery);
     // ignore: empty_catches
   }catch(e){

   }

return photo;
 }

 static Future<List<XFile> > pickMultiImage() async {
   List<XFile> photos=[];
   final ImagePicker picker = ImagePicker();
   try{
     photos = await picker.pickMultiImage();
     // ignore: empty_catches
   }catch(e){

   }

return photos;
 }

 static void showSnackBar(String msg, BuildContext context, [Color? color]) {
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
     // behavior: SnackBarBehavior.floating,
     content: Text(msg),
     backgroundColor: color ?? ColorManager.primary,
     duration: const Duration(milliseconds: 1500),
   ));
 }

 // Future<void> createDynamicLink(bool short) async {
 //   FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
 //   final DynamicLinkParameters parameters = DynamicLinkParameters(
 //     uriPrefix: Constants.uriPrefix,
 //     // longDynamicLink: Uri.parse(
 //     //   'https://flutterfiretests.page.link?efr=0&ibi=io.flutter.plugins.firebase.dynamiclinksexample&apn=io.flutter.plugins.firebase.dynamiclinksexample&imv=0&amv=0&link=https%3A%2F%2Fexample%2Fhelloworld&ofl=https://ofl-example.com',
 //     // ),
 //     link: Uri.parse(Constants.uriPrefix,),
 //     androidParameters: const AndroidParameters(
 //       packageName: 'com.tashil.akari',
 //       minimumVersion: 0,
 //     ),
 //     iosParameters: const IOSParameters(
 //       bundleId: 'com.tashil.akari',
 //       minimumVersion: '0',
 //     ),
 //   );
 //
 //   Uri url;
 //   if (short) {
 //     final ShortDynamicLink shortLink =
 //     await dynamicLinks.buildShortLink(parameters);
 //     url = shortLink.shortUrl;
 //   } else {
 //     url = await dynamicLinks.buildLink(parameters);
 //   }
 //
 //  String linkMessage = url.toString();
 // }
 static Future<bool> createDynamicLink({required String image,required int id,
   required String description,required String title}) async {
   try{

     final DynamicLinkParameters parameters = DynamicLinkParameters(
       uriPrefix: Constants.uriPrefix,
       link: Uri.parse('${Constants.uriPrefix}/?title=${title.replaceAll('&', '')},id=$id'),
       androidParameters:  AndroidParameters(
         packageName: Constants.package,
         minimumVersion: 0,
         // fallbackUrl: Uri.parse('https://styloo.net/${Constants.langCode}'),
       ),
       iosParameters:  IOSParameters(
         bundleId:  Constants.package,
         minimumVersion: '0',
         // fallbackUrl: Uri.parse('https://styloo.net/${Constants.langCode}'),
       ),


       navigationInfoParameters: const NavigationInfoParameters(forcedRedirectEnabled: true),
       socialMetaTagParameters: SocialMetaTagParameters(
         title: title,
         imageUrl: Uri.parse(image),
         description: description,
       ),
     );

     Uri url;
     print('00000000000000000000000000000');
     FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
     final ShortDynamicLink shortLink = await dynamicLinks.buildShortLink(parameters );
     url = shortLink.shortUrl;
     // url = dynamicLinks.;
     Share.share(url.toString(), subject: '');
     return true;


   }catch(e){
print(e.toString());
     return false;
   }
 }

 static openMapsSheet({required BuildContext context,required LatLng latLng,required String title,required String description}) async {
   try {
     mapLuncher.Coords coords  = mapLuncher.Coords(latLng.latitude, latLng.longitude);

     final availableMaps = await mapLuncher.MapLauncher.installedMaps;

     Utils.showModalBottomSheetApp(widget: Material(
       color: ColorManager.white,
       borderRadius: const BorderRadius.only(
         topLeft: Radius.circular(RadiusManager.r12),
         topRight: Radius.circular(RadiusManager.r12),
       ),
       child: SafeArea(
         child: SingleChildScrollView(
           child: Wrap(
             children: <Widget>[
               for (var map in availableMaps)
                 ListTile(
                   onTap: () {
                     Navigator.pop(context);
                     map.showMarker(
                       coords: coords,
                       description: description,
                       title: title,
                     );
                   },
                   title: Text(map.mapName),
                   leading: SvgPicture.asset(
                     map.icon,
                     height: 30.0,
                     width: 30.0,
                   ),
                 ),
             ],
           ),
         ),
       ),
     ));
   } catch (e) {
     printData(e.toString());
   }
 }

 // void saveDataToUserModel({required RegistrationData data,required BuildContext context}) {
 //
 //   CachHelper.saveData(key: Constants.tokenKey, value: data.token);
 //   CachHelper.saveData(key: Constants.mailKey, value: data.email);
 //   CachHelper.saveData(key: Constants.userIdKey, value: data.userId);
 //
 //   CachHelper.saveData(key: Constants.photoKey, value: data.photo);
 //
 //   CachHelper.saveData(key: Constants.fullNameKey, value: data.userFullName);
 //   CachHelper.saveData(key: Constants.balanceKey, value: data.balance);
 //   CachHelper.saveData(key: Constants.pointsKey, value: data.points);
 //   CachHelper.saveData(key: Constants.totalPaidKey, value: data.totalPaid);
 //   context.read<NotificationsProvider>().addUpdateNotificationToken(context);
 //   context.read<CartProvider>().deleteAllProductsFromDataBase();
 // }

 // static clearUserData() {
 //
 //    if (UserModel().token != "") {
 //      CachHelper.removeData(key:  Constants.fullNameKey);
 //      CachHelper.removeData(key:  Constants.mailKey);
 //      CachHelper.removeData(key:  Constants.userIdKey);
 //      CachHelper.removeData(key:  Constants.photoKey);
 //      CachHelper.removeData(key:  Constants.tokenKey);
 //      CachHelper.removeData(key:  Constants.balanceKey);
 //      CachHelper.removeData(key:  Constants.pointsKey);
 //    }
 //  }


 // Future<bool> showExitPopup(BuildContext context) async {
 //   return await showDialog(
 //         //show confirm dialogue
 //         //the return value will be from "Yes" or "No" options
 //         context: context,
 //         builder: (context) => AlertDialog(
 //           title: const Text('مغادرة التطبيق !'),
 //           content: Text('هل تريد مغادرة ATC ',
 //               style: Theme.of(context).textTheme.bodyLarge!),
 //           actions: [
 //             MyElevatedButton(
 //                 onPressed: () => Navigator.of(context).pop(false),
 //                 size: Size(.1.sw, .051.sh,
 //                 ),
 //                 title: StringManager.no.tr()),
 //             MyElevatedButton(
 //                 onPressed: () => Navigator.of(context).pop(true),
 //                 size: Size(.1.sw, .051.sh,
 //                 ),
 //                 title: StringManager.yes.tr()),
 //           ],
 //         ),
 //       ) ??
 //       false; //if showDialouge had returned null, then return false
 // }

 static String convertDigitsToLatin(String s) {
   var sb = StringBuffer();
   for (int i = 0; i < s.length; i++) {
     switch (s[i]) {
     //Arabic digits
       case '\u0660':
         sb.write('0');
         break;
       case '\u0661':
         sb.write('1');
         break;
       case '\u0662':
         sb.write('2');
         break;
       case '\u0663':
         sb.write('3');
         break;
       case '\u0664':
         sb.write('4');
         break;
       case '\u0665':
         sb.write('5');
         break;
       case '\u0666':
         sb.write('6');
         break;
       case '\u0667':
         sb.write('7');
         break;
       case '\u0668':
         sb.write('8');
         break;
       case '\u0669':
         sb.write('9');
         break;
       default:
         sb.write(s[i]);
         break;
     }
   }
   return sb.toString();
 }

 static String priceFormat(String price) {
   return NumberFormat("#,##0", "ar_EG").format(double.parse(price));
 }

 // static String dateFormat(String date) {
 //   return DateFormat('MMM d, y').format(DateTime.parse(date).toLocal());
 // }
 //  static String dateArabicFormat(String date) {
 //
 //    var formatter = DateFormat.yMMMd("ar_SA");
 //    String formatted = formatter.format(DateTime.parse(date).toLocal());
 //
 //   return formatted;
 // }
 static String dateFormat({required String date,required BuildContext context}) {

   var formatter =context.locale.languageCode=='en'? DateFormat.yMMMd("en_US"):DateFormat.yMMMd("ar_SA");
   String formatted = formatter.format(DateTime.parse(date).toLocal());

   return formatted;
 }


 static String capitalizeFirstChar(String? txt) {
   return txt != null ? txt.replaceFirst(txt[0], txt[0].toUpperCase()) : "";
 }



 static share({required String text,String? subject='Atc'}){
   Share.share(text, subject: subject);
 }
 static shareTextANdImage({required String text,required String image,String? subject='atc'})async{
   ByteData imageByte = await rootBundle.load(image);
   final temp = await getTemporaryDirectory();
   final path = '${temp.path}/image1.jpg';
   File(path).writeAsBytesSync(imageByte.buffer.asUint8List());
   await Share.shareFiles([path],

       text:text,subject: 'Atc');

 }
 static String  getDateTimeText({required DateTime? dateTime}){

   if(dateTime!=null) {
     var formatter =  DateFormat('yyyy-MM-dd');
     String formattedDate = formatter.format(dateTime);
     // return '${selectedDate!.year} / ${selectedDate!.year} / ${selectedDate!.year}';
     return formattedDate;
   } else {
     return '';
   }
 }


 static InputDecoration returnTextDropdownDecoration(){
   return InputDecoration(
     // enabled: enabled,
     filled: true,
     fillColor: ColorManager.white,

     hintStyle: getAppTextStyle(titleColor: ColorManager.grey, titleSize: FontSize.s16,underline: false),
     labelStyle:getAppTextStyle(titleColor: ColorManager.grey, titleSize: FontSize.s16,underline: false),
     contentPadding: const EdgeInsets.only(right: PaddingManager.p12, left: PaddingManager.p12,top: 0,bottom: 0),
     focusedBorder:  const OutlineInputBorder(
         borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s06),
         borderRadius: BorderRadius.all(Radius.circular(AppSize.s6))),
     enabledBorder:  const OutlineInputBorder(
         borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s06),
         borderRadius: BorderRadius.all(Radius.circular(AppSize.s6))),
     errorBorder:  OutlineInputBorder(
         borderSide: BorderSide(color: ColorManager.error, width: AppSize.s06),
         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6))),
     focusedErrorBorder:  OutlineInputBorder(
         borderSide: BorderSide(color: ColorManager.error, width: AppSize.s06),
         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6))),
     counterStyle: getAppTextStyle(titleColor: ColorManager.grey, titleSize: FontSize.s16,underline: false),
     floatingLabelStyle: getAppTextStyle(titleColor: ColorManager.grey, titleSize: FontSize.s16,underline: false),
     helperStyle: getAppTextStyle(titleColor: ColorManager.grey, titleSize: FontSize.s16,underline: false),
     prefixStyle: getAppTextStyle(titleColor: ColorManager.grey, titleSize: FontSize.s16,underline: false),
     suffixStyle: getAppTextStyle(titleColor: ColorManager.grey, titleSize: FontSize.s16,underline: false),
     prefixIcon: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         CircleAvatar(
           radius: 16,
           backgroundColor: ColorManager.primary,
           child: CircleAvatar(
               radius: 15,
               backgroundColor: ColorManager.white,
               child: const Icon(Icons.language_rounded,color: ColorManager.primary,size: AppSize.s16,) ),
         ),
       ],
     ),
     suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded,color: ColorManager.titleServiceNameColor,size: AppSize.s26,),
     labelText: 'country'.tr(),
     hintText: 'country'.tr(),

   );
 }

 static BoxDecoration returnDropdownButtonDecoration(
     [Color backGroundColor= ColorManager.searchGrey,
   Color borderColor=ColorManager.searchGrey,double borderRadius=RadiusManager.r10]){
   return BoxDecoration(
       color: backGroundColor,
       border: Border.all(color: borderColor,width: AppSize.s06),
       borderRadius: BorderRadius.circular(borderRadius));
 }
 static BoxDecoration returnIconsDecoration([Color? backGroundColor]){
   return  BoxDecoration(
   color:backGroundColor?? ColorManager.primaryWithOpacity.withOpacity(.5),
   borderRadius: BorderRadius.circular(AppSize.s12)
   );
 }
 static showModalBottomSheetApp({required Widget widget}){
 return  showModalBottomSheet(
   isScrollControlled: true,
       context: Constants.navigatorAppKey.currentState!.context,
       backgroundColor: ColorManager.transparent,
       // barrierColor: ColorManager.barrierColor.withOpacity(.3),
       builder: (context) {
     return widget;
 });
}




 static Future<Null> downloadNetworkImage({required BuildContext context}) async {
   Dio dio = Dio();
   String url='http://estate.smartbox.com.sa/public/images/cities/4643943454_5822a74001_z.jpg';
   try {
     var dir = await getTemporaryDirectory();
     print(dir);


     LoadingDialog.showSimpleToast('Downloading image. Please wait...');
     await dio.download(url, '${dir.path}/image.jpeg',
         onReceiveProgress: (rec, total) {
       if(total==100)  LoadingDialog.showSimpleToast('done');
           // setState(() {
           //   _downloading = true;
           //   _progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
           //   print(progressString);
           //   if (_progressString == "100%") {
           //     Scaffold.of(context)
           //         .showSnackBar(SnackBar(content: Text("Next Action...")));
           //     // NextAction();
           //   }
           // });
         });
   } catch (exp) {
     print('errrorrrr');
     print(exp);
   }
 }

static Future<void> downloadImage({required BuildContext context,required String imageUrl}) async {
   try {

     late Dio dio=Dio();
     late String imagePath;
     var response = await dio.get(imageUrl, options: Options(responseType: ResponseType.bytes));

     final Directory appDir = await getApplicationDocumentsDirectory();
     final String fileName = 'my_image.png';
     final String filePath = '${appDir.path}/$fileName';

     File file = File(filePath);
     await file.writeAsBytes(response.data, flush: true);

    print('done------------');
       imagePath = filePath;
     LoadingDialog.showSimpleToast('Successfully'.tr());

   } catch (e) {
     print('error------------');
     print('حدث خطأ: $e');
   }
 }

 static Future<void> saveFile({required String documentUrl,required BuildContext context,bool? isPdf}) async {
   // var file = File('');
   String dirPath = '';
   // Platform.isIOS comes from dart:io
   if (Platform.isIOS) {
     final dir = await getApplicationDocumentsDirectory();
     // file = File('${dir.path}/$fileName');
     dirPath = dir.path;
   }
   if (Platform.isAndroid) {
     var status = await permission_handler.Permission.storage.status;
     if (status != permission_handler.PermissionStatus.granted) {
       status = await permission_handler.Permission.storage.request();
     }
     if (status.isGranted) {
       const downloadsFolderPath = '/storage/emulated/0/Download/';
       Directory dir = Directory(downloadsFolderPath);
       // file = File('${dir.path}/$fileName');
       dirPath = dir.path;
     }
   }

   if (dirPath.isNotEmpty)await downloadFile(dirPath, documentUrl, context,isPdf??false);
 }

 static  Future downloadFile(String dirPath, String documentUrl,BuildContext context,bool isPdf) async {
   final filename = '${isPdf?'pdf':'image'}${
       '${DateTime.now().year}' +
           '${DateTime.now().month}' +
           '${DateTime.now().day}' +
           '${DateTime.now().hour}' +
           '${DateTime.now().minute}' +
           '${DateTime.now().second}' }';

   var savePath = '$dirPath/$filename';
   var dio = Dio();
   dio.interceptors.add(LogInterceptor());
   try {
     var response = await dio.get(
       documentUrl,
       // onReceiveProgress: showDownloadProgress,
       //Received data with List<int>
       options: Options(
         responseType: ResponseType.bytes,
         followRedirects: false,
         // receiveTimeout: Duration(minutes: 1),
       ),
     );
     var file = File(savePath);
     var raf = file.openSync(mode: FileMode.write);
     // response.data is List<int> type
     raf.writeFromSync(response.data);
     LoadingDialog.showToastNotification('fileDownloadedSuccessfully'.tr());



     await raf.close();
   } catch (e) {
     debugPrint(e.toString());
     LoadingDialog.showToastNotification('errorDownloadingFile'.tr());
   }
 }


}


