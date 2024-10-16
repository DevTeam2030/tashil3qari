import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:tashil_agary/app/cache_helper.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/components/loading_manager.dart';
import 'package:tashil_agary/domain/controller/authentication_controller.dart';
import 'package:tashil_agary/domain/model/models/register_request_body.dart';
import 'package:tashil_agary/domain/model/models/user_data_model.dart';
import '../domain/model/models/ProfileModel.dart';
import '../domain/model/models/auth/register_model.dart';
import '../domain/model/models/auth/upgrade_user_consultant_model.dart';
import '../domain/model/models/update_profile_request_body.dart';
import '../domain/model/notifications_setting_request_model.dart';
import '../presentation/general/auht/otp/otp_imports.dart';
import '../presentation/general/auht/register/add_location/add_location_register_screen.dart';
import '../presentation/general/auht/register/fill_personal_data/fill_personal_data_register_screen.dart';
import '../utilites/route_manager.dart';



class AuthProvider extends ChangeNotifier {
  final AuthController _api = AuthController();
  bool isLoading = false;
  ProfileModel?  profileData;

  Future<void> notify() async {
    isLoading = false;
    notifyListeners();


  }


  Future<void> updateNotificationsStatus({required BuildContext context,required NotificationsSettingRequestModel notificationsSettingRequestModel }) async {
    isLoading = true;

    UserDataModel?  profileDataModel = await _api.updateNotificationsStatus(context: context,notificationsSettingRequestModel: notificationsSettingRequestModel);

    isLoading = false;
    notifyListeners();
    if (profileDataModel != null){
      UserDataModel user=Constants.userDataModel!;

      // user.textMarketingNotifications=profileDataModel.textMarketingNotifications;
      // user.emailNotifications=profileDataModel.emailNotifications;
      // user.emailMarketingNotifications=profileDataModel.emailMarketingNotifications;

      CacheHelper.saveDataToUserModel(userDataModel: user);

    }

  }


  Future< RegisterModel? > register({required BuildContext context, required RegisterRequestModel model,}) async {
    isLoading = true;
    notifyListeners();
    RegisterModel? registerModel = await _api.register(context: context, model: model,);

    isLoading = false;
    notifyListeners();
    // if(isRegister){
    //
    //     Navigator.of(Constants.navigatorAppKey.currentState!.context).
    //     pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginScreen()), (Route<dynamic> route) => false);
    //
    // }
    return registerModel;

  }

  Future< RegisterModel? > updateRegisterPhone({required BuildContext context, required UpdatePhoneRequestModel model,}) async {
    isLoading = true;
    notifyListeners();
    RegisterModel? registerModel = await _api.updateRegisterPhone(context: context, model: model);
    isLoading = false;
    notifyListeners();
    return registerModel;

  }

  Future<RegisterModel?> activateAccount({required BuildContext context,required String email,required String code}) async {
    isLoading = true;
    notifyListeners();
    RegisterModel? registerModel = await _api.activateAccount(context: context, email: email,code: code);
    isLoading = false;
    notifyListeners();
    return registerModel;

  }
  Future<void> sendVerificationCode({required BuildContext context,required String email}) async {
    isLoading = true;
    notifyListeners();
     await _api.sendVerificationCode(context: context, email: email,);
    isLoading = false;
    notifyListeners();


  }


  Future<void> updateUserLocation({required BuildContext context,required UpdateUserLocationRequestModel model}) async {
    isLoading = true;
    notifyListeners();
    // RegisterModel? registerModel = await _api.updateUserLocation(context: context, model: model);
    // isLoading = false;
    // notifyListeners();
    UserDataModel? user = await _api.updateUserLocation(context: context, model: model);
    isLoading = false;
    notifyListeners();
    if(user!=null){
      // CacheHelper.saveDataToUserModel(userDataModel: user);
      // gotoIntro(context: context);
      // Utils.login(context: context, userDataModel: user);
      // // ignore: use_build_context_synchronously
      // Utils.showAlertSuccess(context: context, message: 'RegisterSuccess'.tr());
      gotoIntroLogin(context: context);
      Utils.showAlertSuccess(context: context, message: 'RegisterSuccess'.tr());
    }

    // if(registerModel!=null)gotoIntroLogin(context: context);

  }


  Future<void> updateConsultantLocation({required BuildContext context,required UpdateLocationRequestModel model}) async {
    isLoading = true;
    notifyListeners();
    // RegisterModel? registerModel = await _api.updateConsultantLocation(context: context, model: model);
    UserDataModel? user = await _api.updateConsultantLocation(context: context, model: model);
    isLoading = false;
    notifyListeners();
 if(user!=null){
   // ignore: use_build_context_synchronously
   // CacheHelper.saveDataToUserModel(userDataModel: user);
   // gotoIntro(context: context);

   // Utils.login(context: context, userDataModel: user);
   gotoIntroLogin(context: context);
   Utils.showAlertSuccess(context: context, message: 'RegisterSuccess'.tr());
 }
    // if(registerModel!=null)gotoIntroLogin(context: context);

  }


  Future<void> requestConsultant({required BuildContext context,required UpgradeUserConsultantModel model}) async {
    isLoading = true;
    notifyListeners();


    await _api.requestConsultant(context: context, model: model);
    isLoading = false;
    notifyListeners();
  }

  Future<void> deleteAccount({required BuildContext context,}) async {
    isLoading = true;
    notifyListeners();
    bool isDeleted = await _api.deleteAccount(context: context, );
    if(isDeleted){
      Utils.logOut(Constants.navigatorAppKey.currentState!.context);
      LoadingDialog().titleMessageAlert(
        context: Constants.navigatorAppKey.currentState!.context,
        title: 'DeleteMyAccount'.tr(),
        message: 'AccountDeletedSuccessfully'.tr(),
        okClick: ()=>Navigator.pop(Constants.navigatorAppKey.currentState!.context)
      );
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> login(
      {required BuildContext context,
      required String idNumber,
      required String password,
      }) async {
    isLoading = true;
    notifyListeners();
    UserDataModel? user = await _api.login(context: context, idNumber: idNumber, password: password, );
    isLoading = false;
    notifyListeners();
    if (user != null){
      if(!user.isCompletedProfile){
        MyRoute().navigate(context: context, route: FillPersonalDataRegisterScreen(registerModel: RegisterModel(
          id: user.id,
          email: user.email,
          type: user.type,
          phone: user.phone,
        ),));
          return;
      }
      if(!user.isActive){
        MyRoute().navigate(context: context, route: OtpScreen(
          emailToVerify: user.email,
          registerModel: RegisterModel(
          id: user.id,
          email: user.email,
          type: user.type,
          phone: user.phone,
        ),));
        return;
      }
      if(!user.isCompletedAddress){
        MyRoute().navigate(context: context, route: AddLocationRegisterScreen(
          registerModel: RegisterModel(
          id: user.id,
          email: user.email,
          type: user.type,
          phone: user.phone,
        ),));
        return;
      }
      // ignore: use_build_context_synchronously
      Utils.login(context: context, userDataModel: user);

    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> loginSocialMedia(
      {required BuildContext context,
      required  SocialLoginAndRegisterRequestBodyModel socialLoginRequestBodyModel
      }) async {
    isLoading = true;
    notifyListeners();
    UserDataModel? user = await _api.loginSocialMedia(context: context, socialLoginRequestBodyModel: socialLoginRequestBodyModel);
    if (user != null){
      // ignore: use_build_context_synchronously
      Utils.login(context: context, userDataModel: user);

      // context.read<AddressProvider>().getAddresses(context: context, notify: true);
    }
    isLoading = false;
    notifyListeners();
  }



  Future<void> forgetPassword({required BuildContext context, required String idNumber}) async {
    isLoading = true;
    notifyListeners();
    bool isSend = await _api.forgetPassword(context: context, idNumber: idNumber);
    isLoading = false;
    notifyListeners();
  }


   Future<void> signInWithGoogle({required BuildContext context,required AuthType authType}) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      User? currentUser;
      final GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential = await auth.signInWithCredential(credential);

          if (userCredential.user != null) {
            currentUser = userCredential.user;
            Utils.printData(currentUser!.email);
            Utils.printData(currentUser.displayName);
            Utils.printData(currentUser.phoneNumber);
            
            // Utils.printData(currentUser.phoneNumber);

            if(currentUser.email==null)return;
            // if(authType==AuthType.login){
            //   login(context: context, email: currentUser.email??'',
            //       password: Constants.socialMediaPassword ,registerType: RegisterType.google);
            // }
            // else{
            //   RegisterRequestBodyModel registerRequestBodyModel =RegisterRequestBodyModel(
            //     firstName: currentUser.displayName??'',
            //     lastName:currentUser.displayName??'',
            //     email: currentUser.email??'',
            //     phone: currentUser.phoneNumber??'',
            //     lang:Constants.langCode ,
            //     registrationType: 'google',
            //     password:Constants.socialMediaPassword ,
            //     passwordConfirmation:Constants.socialMediaPassword ,
            //     gender: 'not_defined'
            //   );
            //   register(context: context, registerRequestBodyModel: registerRequestBodyModel,authType: authType,
            //       registerType: RegisterType.google);
            // }

            // ignore: use_build_context_synchronously
            loginSocialMedia(context: context,
            socialLoginRequestBodyModel:  SocialLoginAndRegisterRequestBodyModel(
                  firstName: currentUser.displayName??'',
                  lastName:'',
                  // lastName:currentUser.displayName??'',
                  email: currentUser.email??'',
                  phone: currentUser.phoneNumber??'',
                  lang:Constants.langCode ,
                  registrationType: 'google',
                  password:Constants.socialMediaPassword ,
                  passwordConfirmation:Constants.socialMediaPassword ,
                fcmToken: Constants.firebaseToken,
                  gender: 'not_defined'
                )
            );

            // AuthSocialPost authSocialPost=AuthSocialPost(
            //   email: currentUser.email!,
            //   lang: Constants.langCode,
            //   mobile:currentUser.phoneNumber??'',
            //   name:currentUser.displayName??'' ,
            //   password: Constants.socialPassword,
            //   pushToken: Constants.firebaseToken,
            //   registrationType: 'gmail',
            //
            // );
            // UserDataModel? userDataModel=await  AuthController().loginSocial(context: context,authSocialPost: authSocialPost);
            // if(userDataModel!=null)Utils.login(context: context,userDataModel: userDataModel);

          }
        } catch (e) {
          Utils.printData(e.toString());
          LoadingDialog.showSimpleToast('errorTryAgainLater'.tr());
        }
      }
    } catch (e) {
      Utils.printData(e.toString());
    }
  }

 Future<void> signInWithFacebook({required BuildContext context,required AuthType authType})async{
  try{

    final facebookLogin = FacebookLogin();
    await facebookLogin.logOut();
    final result = await facebookLogin.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);
    switch (result.status) {
      case FacebookLoginStatus.success:
         Utils.printData('---------------------------------------- loggedIn');
        final profile = await facebookLogin.getUserProfile();
         Utils.printData('Hello, ${profile!.name}');
        final email = await facebookLogin.getUserEmail();
         Utils.printData(email);
         Utils.printData(profile.firstName);
         Utils.printData(profile.lastName);
         Utils.printData('---------------------------------------- ');
        if (email != null) {


          // if(authType==AuthType.login){
          //   login(context: context, email: email??'',
          //       password: Constants.socialMediaPassword,registerType: RegisterType.facebook );
          // }
          // else{
          //   RegisterRequestBodyModel registerRequestBodyModel =RegisterRequestBodyModel(
          //       firstName: profile.firstName??'',
          //       lastName:profile.lastName??'',
          //       email: email??'',
          //       phone: '',
          //       lang:Constants.langCode ,
          //       registrationType: 'facebook',
          //       password:Constants.socialMediaPassword ,
          //       passwordConfirmation:Constants.socialMediaPassword ,
          //       gender: 'not_defined'
          //   );
          //   register(context: context, registerRequestBodyModel: registerRequestBodyModel,authType: authType,
          //       registerType: RegisterType.facebook);
          // }

          // ignore: use_build_context_synchronously
          loginSocialMedia(context: context,
          socialLoginRequestBodyModel: SocialLoginAndRegisterRequestBodyModel(
          firstName: profile.firstName??'',
          lastName:profile.lastName??'',
          email: email??'',
          phone: '',
          lang:Constants.langCode ,
          registrationType: 'facebook',
          password:Constants.socialMediaPassword ,
          passwordConfirmation:Constants.socialMediaPassword ,
              fcmToken: Constants.firebaseToken,
          gender: 'not_defined'));

        }
        else {
          LoadingDialog.showSimpleToast('errorTryAgainLater'.tr());
        }
        break;
      case FacebookLoginStatus.cancel:
         Utils.printData('---------------------------------------- cancelledByUser');
        LoadingDialog.showSimpleToast('errorTryAgainLater'.tr());

        break;
      case FacebookLoginStatus.error:
         Utils.printData('-------------error--------------------------- ${result.error}');
        // Alert.showAlert(alertType: AlertType.error.tr, message: '${result.error.toString()}');
        LoadingDialog.showSimpleToast('errorTryAgainLater'.tr());

        break;
    }
  }catch(e){
     Utils.printData(e.toString());
    LoadingDialog.showSimpleToast('errorTryAgainLater'.tr());
  }


}

 Future<bool> signInWithApple({required BuildContext context,required AuthType authType}) async {
  try {
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      // nonce: nonce,
    );
    final OAuthCredential oauthCredential = OAuthProvider("apple.com")
        .credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode);
    await FirebaseAuth.instance
        .signInWithCredential(oauthCredential)
        .then((value)async {


      if (value.user!=null&&value.user!.email != null) {

        String email=value.user!.email!;
        String displayName=value.user!.displayName??'';
        String phoneNumber=value.user!.phoneNumber??'';

        Utils.printData(email);
        Utils.printData(displayName);
        Utils.printData(phoneNumber);


        // if(authType==AuthType.login){
        //   login(context: context, email: email??'',
        //       registerType: RegisterType.apple,
        //       password: Constants.socialMediaPassword );
        // }
        // else{
        //   RegisterRequestBodyModel registerRequestBodyModel =RegisterRequestBodyModel(
        //       firstName:displayName,
        //       lastName:displayName,
        //       email: email,
        //       phone: phoneNumber,
        //       lang:Constants.langCode ,
        //       registrationType: 'apple',
        //       password:Constants.socialMediaPassword ,
        //       passwordConfirmation:Constants.socialMediaPassword ,
        //       gender: 'not_defined'
        //
        //   );
        //   register(context: context, registerRequestBodyModel: registerRequestBodyModel,authType: authType,registerType: RegisterType.apple);
        // }
        loginSocialMedia(context: context,
        socialLoginRequestBodyModel: SocialLoginAndRegisterRequestBodyModel(
            firstName:displayName,
            lastName:displayName,
            email: email,
            phone: phoneNumber,
            lang:Constants.langCode ,
            registrationType: 'apple',
            password:Constants.socialMediaPassword ,
            passwordConfirmation:Constants.socialMediaPassword ,
            gender: 'not_defined',
          fcmToken: Constants.firebaseToken,
        )
        );
      }
    });
  } catch (e) {
    LoadingDialog.showSimpleToast('errorTryAgainLater'.tr());
    return false;
  }
  // return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  return false;
}




}
