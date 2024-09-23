import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/cache_helper.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/components/loading_manager.dart';
import 'package:tashil_agary/domain/model/models/user_data_model.dart';
import 'package:tashil_agary/providers/wishlist_provider.dart';
import '../app/utils.dart';
import '../domain/controller/agreements_controller.dart';
import '../domain/controller/home_controller.dart';
import '../domain/controller/profile_controller.dart';
import '../domain/model/agreement/agreement_details_model.dart';
import '../domain/model/following_user_model.dart';
import '../domain/model/models/ProfileModel.dart';
import '../domain/model/models/agreements_model.dart';
import '../domain/model/models/general_property_model.dart';
import '../domain/model/models/update_profile_request_body.dart';
import '../domain/model/models/user_ads_model.dart';



class ProfileProvider extends ChangeNotifier {
  final ProfileController _api = ProfileController();
  final HomeController _apiHome=HomeController();
  final AgreementsController _agreementsController=AgreementsController();
  bool isLoading = false;
  ProfileModel?  profileData;
  List<UserAdsModel>userAds=[];
  List<GeneralPropertyModel>userWishList=[];
  List<AgreementDetailsModel> agreements=[];
  List<GeneralPropertyModel>bids=[];
  List<FollowingUserModel>followingUsers=[];
  List<FollowingUserModel>followersUsers=[];



  Future<void>getAllProfileData({required BuildContext context,bool?notify,})async{
    isLoading=true;
    userWishList=[];
    userAds=[];
    if(notify!=false) notifyListeners();
    profileData = await _api.getProfileData(context: context);
    userAds=await _api.getUserAds(context: context,);
    userWishList=await _api.getUserWishList(context: context,);
    agreements=await _agreementsController.getEstateAgreements(context: context,);

    if (profileData != null){
      UserDataModel user=Constants.userDataModel!;
      user.firstName=profileData!.firstName;
      user.lastName=profileData!.lastName;
      user.type=profileData!.type=='normal'?UserType.user:UserType.consultant;
      user.email=profileData!.email;
      user.phone=profileData!.phone;
      user.image=profileData!.image;
      user.licenseNumber=profileData!.licenseNumber;
      user.documented=profileData!.documented;
      user.des=profileData!.des;
      user.idNumber=profileData!.idNumber;
      user.nationalityId=profileData!.nationalityId;
      user.nationality=profileData!.nationality;

      CacheHelper.saveDataToUserModel(userDataModel: user);


    }
    isLoading=false;
    notifyListeners();
  }


  Future<void>getBids({required BuildContext context,bool? isNotify})async{
    isLoading=true;
    bids.clear();
    if(isNotify!=false) notifyListeners();
    bids=await _apiHome.getBids(context: context,);
    isLoading=false;
    notifyListeners();
  }
  Future<void>getFollowingUsers({required BuildContext context,bool? isNotify})async{
    isLoading=true;
    followingUsers.clear();
    if(isNotify!=false) notifyListeners();
    followingUsers=await _apiHome.getFollowingUsers(context: context,);
    isLoading=false;
    notifyListeners();
  }

 Future<void>getFollowersUsers({required BuildContext context,bool? isNotify})async{
    isLoading=true;
    followersUsers.clear();
    if(isNotify!=false) notifyListeners();
    followersUsers=await _apiHome.getFollowersUsers(context: context,);
    isLoading=false;
    notifyListeners();
  }

  Future<void>getAgreements({required BuildContext context,required bool notify})async{
    isLoading=true;
    if(notify)notifyListeners();
    agreements=await _agreementsController.getEstateAgreements(context: context,);
    isLoading=false;
    notifyListeners();
  }


  Future<void>getAllProfileDataOnly({required BuildContext context,bool?notify,})async{
    isLoading=true;
    if(notify!=false) notifyListeners();
    profileData = await _api.getProfileData(context: context);
    if (profileData != null){
      UserDataModel user=Constants.userDataModel!;
      user.firstName=profileData!.firstName;
      user.lastName=profileData!.lastName;
      user.type=profileData!.type=='normal'?UserType.user:UserType.consultant;
      user.email=profileData!.email;
      user.phone=profileData!.phone;
      user.image=profileData!.image;
      user.phone=profileData!.phone;
      user.licenseNumber=profileData!.licenseNumber;
      user.licenseNumber=profileData!.licenseNumber;
      user.documented=profileData!.documented;
      user.des=profileData!.des;
      user.idNumber=profileData!.idNumber;
      user.nationality=profileData!.nationality;
      user.nationalityId=profileData!.nationalityId;

      CacheHelper.saveDataToUserModel(userDataModel: user);

    }
    isLoading=false;
    notifyListeners();
  }

  Future<void>getUserAds({required BuildContext context,bool?notify,})async{
    isLoading=true;
    if(notify!=false) notifyListeners();
    userAds=await _api.getUserAds(context: context,);
    isLoading=false;
    notifyListeners();
  }
  Future<void>getUserWishList({required BuildContext context,bool?notify,})async{
    isLoading=true;
    userWishList=[];
    if(notify!=false) notifyListeners();
    userWishList=await _api.getUserWishList(context: context,);


    isLoading=false;
    notifyListeners();
  }
  Future<void>getAds({required BuildContext context,bool?notify,})async{
    isLoading=true;
    userWishList=[];
    if(notify!=false) notifyListeners();

    // ignore: use_build_context_synchronously
    userWishList=await _api.getUserWishList(context: context,);
    isLoading=false;
    notifyListeners();
  }

  Future<void>getWishList({required BuildContext context,bool?notify,})async{
    isLoading=true;
    userWishList=[];
    if(notify!=false) notifyListeners();

    // ignore: use_build_context_synchronously
    userWishList=await _api.getUserWishList(context: context,);
    isLoading=false;
    notifyListeners();
  }



  Future<void> getProfile({required BuildContext context,required bool notify }) async {
    isLoading = true;
    if(notify) notifyListeners();
    profileData = await _api.getProfileData(context: context);

    // if(isRegister) MyRoute().navigate(context: context, route: OtpScreen(email: registerRequestBodyModel.email,));
    isLoading = false;
    notifyListeners();
    if (profileData != null){
      UserDataModel user=Constants.userDataModel!;
      user.firstName=profileData!.firstName;
      user.lastName=profileData!.lastName;
      user.type=profileData!.type=='normal'?UserType.user:UserType.consultant;
      user.email=profileData!.email;
      user.phone=profileData!.phone;
      user.image=profileData!.image;
      user.phone=profileData!.phone;
      user.licenseNumber=profileData!.licenseNumber;
      user.idNumber=profileData!.idNumber;
      user.nationality=profileData!.nationality;
      user.nationalityId=profileData!.nationalityId;

      CacheHelper.saveDataToUserModel(userDataModel: user);

    }

  }


  Future<void> removeFromAuction({required BuildContext context,required UserAdsModel property}) async {
    isLoading = true;
    notifyListeners();
    bool data= await _api.removeFromAuction(context: context,propertyId: property.id,);
    if(data)userAds.firstWhere((element) => element.id==property.id).auction=false;
    isLoading = false;
    notifyListeners();
  }

  Future<void> unPublishProperty({required BuildContext context,required UserAdsModel property}) async {
    isLoading = true;
    notifyListeners();
    bool data= await _api.unPublishProperty(context: context,propertyId: property.id,);
    if(data)userAds.firstWhere((element) => element.id==property.id).published=false;
    isLoading = false;
    notifyListeners();
  }

  Future<void> deleteProperty({required BuildContext context,required UserAdsModel property,required int reasonId}) async {
    isLoading = true;
    notifyListeners();
    bool isDeleted= await _api.deleteProperty(context: context,propertyId: property.id,reasonId: reasonId);
    if(isDeleted)userAds.removeWhere((element) => element.id==property.id);
    isLoading = false;
    notifyListeners();
  }

  Future<void> changePassword(
      {required BuildContext context,
        required String currentPassword,
        required String newPassword}) async {
    isLoading = true;
    notifyListeners();
    bool isChanged = await _api.changePassword(context: context, currentPassword: currentPassword, newPassword: newPassword);
    isLoading = false;
    notifyListeners();
  }



  Future<void> updateProfile({required BuildContext context, required UpdateProfileRequestModel model}) async {
    isLoading = true;
    notifyListeners();
    UserDataModel? user = await _api.updateProfile(context: context, model: model);
    if(user!=null){
      LoadingDialog.showSimpleToast('YourDataHasBeenEditedSuccessfully'.tr());

      String token=Constants.userDataModel?.accessToken??'';
      user.accessToken=token;
      CacheHelper.saveDataToUserModel(userDataModel: user);
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> changeImageProfile({
    required BuildContext context,
    required XFile photo,

  }) async {
    isLoading = true;
    notifyListeners();
    String url = await _api.updateImageProfile(context: context, photo: photo,);
    // if (user != null) Utils.login(context: context, userDataModel: user);
    if(url.isNotEmpty){


      LoadingDialog.showToastNotification('YourDataHasBeenEditedSuccessfully'.tr());

      UserDataModel user=Constants.userDataModel!;
      // user.image=url;
      CacheHelper.saveDataToUserModel(userDataModel: user);
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void>removeFromWishlist({required BuildContext context,required GeneralPropertyModel  property})async{
    if(Utils.checkIsLogin()==false)return;
    isLoading=true;
      notifyListeners();
      bool unWished =await context.read<WishlistProvider>().unWishlist(context: context,adId: property.id);
    if(unWished)userWishList.remove(property);


    isLoading=false;
    notifyListeners();
  }
  Future<void>addToWishlist({required BuildContext context,required GeneralPropertyModel  property})async{
    if(Utils.checkIsLogin()==false)return;
    isLoading=true;
      notifyListeners();
      bool wishlist =await context.read<WishlistProvider>().wishlist(context: context,adId: property.id);
    if(wishlist)userWishList.add(property);

    isLoading=false;
    notifyListeners();
  }
}
