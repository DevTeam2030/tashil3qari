part of'personal_profile_imports.dart';


class PersonalProfileData{
  final formKey = GlobalKey<FormState>();
  final formPasswordKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController licenseNumberController = TextEditingController();
  TextEditingController desController = TextEditingController();

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  NationalityModel nationality=Constants.settingModel.nationalities.first;

  bool showAdsAsList = true;
  bool showFavoriteAsList = true;
  PersonalDataType showDataTab = PersonalDataType.ads;
  XFile? imagePicker;
  UserType userType=UserType.user;
  late BuildContext ctx;

  PersonalProfileData({required PersonalDataType showTab,required BuildContext context}){
    ctx=context;
    showDataTab=showTab;
    // loginAs=Constants.userDataModel!.isUser==false?"RealEstateConsultant".tr():"user".tr();
    userType=Constants.userDataModel!.isUser?UserType.user:UserType.consultant;
    firstNameController.text=Constants.userDataModel!.firstName;
    lastNameController.text=Constants.userDataModel!.lastName;
    emailController.text=Constants.userDataModel!.email;
    phoneController.text=Constants.userDataModel!.phone;
    idController.text=Constants.userDataModel!.idNumber;
    licenseNumberController.text=Constants.userDataModel!.licenseNumber;
    desController.text=Constants.userDataModel!.des;
    nationality=Constants.settingModel.nationalities.firstWhere((element) =>
    element.id.toString()==Constants.userDataModel!.nationalityId,
        orElse: ()=>Constants.settingModel.nationalities.first);

  }

  updateProfile({required BuildContext context})async{

    FocusScope.of(context).requestFocus( FocusNode());

    if(formKey.currentState!.validate()){
      UpdateProfileRequestModel model =UpdateProfileRequestModel(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        idNumber: idController.text.trim(),
          des:userType==UserType.consultant ?desController.text.trim():'',
        licenseNumber: licenseNumberController.text,
        nationality:  nationality.id.toString(),
        // image: imagePicker==null?null:File(imagePicker!.path),
      );
   await  context.read<ProfileProvider>().updateProfile(context: context, model: model);

    }
  }

  changeImageProfile({required BuildContext context,required XFile image})async{

    FocusScope.of(context).requestFocus( FocusNode());
   await  context.read<ProfileProvider>().changeImageProfile(context: context,photo: image,);

  }

  unPublishProperty({required BuildContext context,required UserAdsModel ad})
  async=> context.read<ProfileProvider>().unPublishProperty(context: context,property: ad);

  publishProperty({required UserAdsModel ad,})
  => MyRoute().navigate(context: ctx, route: AddAdRequirementsScreen(addAdtData: AddAdtData(),userAd: ad,));

  removeFromAuction({required BuildContext context,required UserAdsModel ad})
  async=> context.read<ProfileProvider>().removeFromAuction(context: context,property: ad);

  addToAuction({required BuildContext context,required UserAdsModel ad})
  => MyRoute().navigate(context: ctx, route: AddAdBidScreen(propertyId: ad.id,isPropertyFeatured: ad.featured,));

  deleteProperty({required UserAdsModel ad,required int reasonId})
  async=> ctx.read<ProfileProvider>().deleteProperty(context: ctx,property: ad,reasonId: reasonId);




changePassword({required BuildContext context}){
  FocusScope.of(context).requestFocus( FocusNode());
  if(formPasswordKey.currentState!.validate()){
    context.read<ProfileProvider>().changePassword(context: context,
        newPassword: newPasswordController.text.trim(),
        currentPassword: oldPasswordController.text.trim());
  }
}
  deleteMyAd({required BuildContext context, required UserAdsModel ad}){
    Utils.showModalBottomSheetApp(
        widget: DeleteReasonsAdBottomSheet(
          adId: ad.id,
          adType: ad.type,
          onDeleteAd:(adId,reasonId)=>deleteProperty(ad: ad, reasonId: reasonId),
        )
    );
  }

  hiringRealEstateConsultant({required BuildContext context, required UserAdsModel ad}){
    MyRoute().navigate(context: context, route: HiringRealEstateConsultantScreen(propertyId: ad.id,));
  }
}