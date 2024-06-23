import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/components/loading_manager.dart';
import 'package:tashil_agary/domain/controller/social_login_controller.dart';
import 'package:tashil_agary/domain/model/social_login_model.dart';
import 'package:tashil_agary/domain/model/social_login_request_body.dart';


class SocialLoginProvider extends ChangeNotifier {
  final SocialLoginController _api = SocialLoginController();
  bool isLoading = false;


  Future<void> activeSocialAccounts({required BuildContext context,
    required SocialLoginRequestBodyModel socialLoginRequestBodyModel}) async {
    isLoading = true;
    notifyListeners();
    bool isChanged = await _api.activeSocialAccounts(context: context,socialLoginRequestBodyModel: socialLoginRequestBodyModel);
  if(isChanged){
    getSocialLoginList(context: context, notify: true);
  }else{
    isLoading = false;
    notifyListeners();
  }

  }

  Future<void> unActiveSocialAccounts({required BuildContext context,required RegisterType registerType}) async {
    isLoading = true;
    notifyListeners();
    bool isChanged = await _api.unActiveSocialAccounts(context: context,
        registrationType: Utils.getRegistrationTypeString(registerType: registerType));
    if(isChanged){
      getSocialLoginList(context: context, notify: true);
    }else{
      isLoading = false;
      notifyListeners();
    }

  }

   Future<void> loginSocialByGoogle({required BuildContext context,}) async {
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
            Utils.printData(currentUser.phoneNumber);
            // Utils.printData(currentUser.phoneNumber);

            if(currentUser.email==null)return;

            SocialLoginRequestBodyModel socialLoginRequestBodyModel=SocialLoginRequestBodyModel(
                firstName: currentUser.displayName??'',
                lastName:currentUser.displayName??'',
                email: currentUser.email??'',
                phone: currentUser.phoneNumber??'',
                lang:Constants.langCode ,
                registrationType: 'google',
                gender: '',
              brithDate: ''
            );
            activeSocialAccounts(context: context, socialLoginRequestBodyModel: socialLoginRequestBodyModel);



          }
        } catch (e) {
          Utils.printData(e.toString());
          LoadingDialog.showToastNotification('errorTryAgainLater'.tr());
        }
      }
    } catch (e) {
      Utils.printData(e.toString());
    }
  }

 Future<void> loginSocialByFacebook({required BuildContext context,})async{
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

          SocialLoginRequestBodyModel socialLoginRequestBodyModel=SocialLoginRequestBodyModel(
              firstName: profile.firstName??'',
              lastName:profile.lastName??'',
              email: email??'',
              phone: '',
              lang:Constants.langCode ,
              registrationType: 'facebook',
              gender: '',
              brithDate: ''
          );
          activeSocialAccounts(context: context, socialLoginRequestBodyModel: socialLoginRequestBodyModel);

        }
        else {
          LoadingDialog.showToastNotification('errorTryAgainLater'.tr());
        }
        break;
      case FacebookLoginStatus.cancel:
         Utils.printData('---------------------------------------- cancelledByUser');
        LoadingDialog.showToastNotification('errorTryAgainLater'.tr());

        break;
      case FacebookLoginStatus.error:
         Utils.printData('-------------error--------------------------- ${result.error}');
        // Alert.showAlert(alertType: AlertType.error.tr, message: '${result.error.toString()}');
        LoadingDialog.showToastNotification('errorTryAgainLater'.tr());

        break;
    }
  }catch(e){
     Utils.printData(e.toString());
    LoadingDialog.showToastNotification('errorTryAgainLater'.tr());
  }


}

 Future<bool> loginSocialByApple({required BuildContext context,}) async {
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
        SocialLoginRequestBodyModel socialLoginRequestBodyModel=SocialLoginRequestBodyModel(
            firstName:displayName,
            lastName:displayName,
            email: email,
            phone: phoneNumber,
            lang:Constants.langCode ,
            registrationType: 'apple',
            gender: '',
            brithDate: ''
        );
        activeSocialAccounts(context: context, socialLoginRequestBodyModel: socialLoginRequestBodyModel);
      }
    });
  } catch (e) {
    LoadingDialog.showToastNotification('errorTryAgainLater'.tr());
    return false;
  }
  // return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  return false;
}



  SocialLoginModel socialLoginModel=SocialLoginModel(apple: false,email: false,facebook: false,google: false);
  Future<void>getSocialLoginList({required BuildContext context,required bool notify})async{
    isLoading=true;
    if(notify)notifyListeners();
    socialLoginModel=await _api.getSocialLoginList(context: context,);
    isLoading=false;
    notifyListeners();
  }
}
