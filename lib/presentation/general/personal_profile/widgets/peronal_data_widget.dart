part of'widgets_imports.dart';

class PersonalProfileDataWidget extends StatefulWidget {
  final Function(PersonalDataType) onTabPressed;
  final PersonalDataType showAdsTab;
  final   PersonalProfileData personalProfileData;
  const PersonalProfileDataWidget({super.key,required this.onTabPressed,
    required this.showAdsTab,required this.personalProfileData});

  @override
  State<PersonalProfileDataWidget> createState() => _PersonalProfileDataWidgetState();
}

class _PersonalProfileDataWidgetState extends State<PersonalProfileDataWidget> {
  // List<String>text=['MyAds'.tr(),'Favorite'.tr(),'Agreements'.tr(),'Personal data'.tr()];
  // var types=[PersonalDataType.ads,PersonalDataType.favorite,PersonalDataType.agreements,PersonalDataType.personal];
@override
Widget build(BuildContext context) {
  return    Material(
    elevation: 6,
    color: ColorManager.white,
    shadowColor: ColorManager.textGrey,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
      width: 1.0.sw,
      // height: 140,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(RadiusManager.r14),
        // color: ColorManager.textGrey,
        // boxShadow: kElevationToShadow[4],
        // color: Theme.of(context).bottomAppBarColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
            child:    InkWell(
              onTap: ()=>Utils.logOut(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(ImageManager.logout,),
                      const AppSizeBox(width: 2,),
                      AppText(title:Constants.isLogin? "LogOut".tr():'signIn'.tr(),
                          titleAlign: TextAlign.center,
                          titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
                          titleSize: FontSize.s10,titleColor: ColorManager.black),
                    ],
                  ),


                  InkWell(
                    onTap: (){
                      Constants.isArabic?
                      LocalizationManager.changeLocaleLangeToEnglish(context: context):
                      LocalizationManager.changeLocaleLangeToArabic(context: context);
                    },
                    child: AppText(
                        title: Constants.isArabic?'English':'العربية',
                        titleAlign: TextAlign.center,
                        titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
                        titleSize: FontSize.s10,titleColor: ColorManager.primary),
                  ),
                ],
              ),
            ),
          ),

          const AppSizeBox(height: 5,),


          SizedBox(
            height: AppSize.s90,
            width: AppSize.s90,
            child: Stack(
              children: [
                Container(
                    height: AppSize.s90,
                    width: AppSize.s90,
                    decoration:  const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child:
                    widget.personalProfileData.imagePicker!=null?
                    CircleAvatar(
                        backgroundColor: ColorManager.white,
                        backgroundImage:
                        FileImage(File( widget.personalProfileData.imagePicker!.path))
                    ):
                    CachedImage(
                      url: Constants.userDataModel!.image,
                      // url: 'http://estate.smartbox.com.sa/public/images/users/1707982093.jpg',
                      width: AppSize.s95,height: AppSize.s95,
                      boxShape: BoxShape.circle,
                      fit: BoxFit.cover,
                    )
                ),
                Align(
                  alignment: Constants.isArabic?Alignment.bottomRight:Alignment.bottomLeft,
                  child: InkWell(
                    onTap: ()=>Utils().uploadModalBottomSheet(context: context,
                      onGalleryTap: (photo){
                        // context.read<AuthProvider>().changeImageProfile(context: context, photo: photo);
                        widget.personalProfileData.imagePicker=photo;
                        widget.personalProfileData.changeImageProfile(context: context,image: photo);
                      },
                      onCameraTap: (photo){
                        // context.read<AuthProvider>().changeImageProfile(context: context, photo: photo);
                        widget.personalProfileData.imagePicker=photo;
                        widget.personalProfileData.changeImageProfile(context: context,image: photo);
                      },),
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: ColorManager.primary,
                      child:  Icon(Icons.edit,
                          size: AppSize.s20,
                          color: ColorManager.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          const AppSizeBox(height: 10,),
          AppText(
              title: Constants.userDataModel!.firstName + ' ' + Constants.userDataModel!.lastName,
              titleAlign: TextAlign.center,
              titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
              titleSize: FontSize.s14,titleColor: ColorManager.black),

          AppText(
              title: Constants.userDataModel!.isUser? 'user'.tr() :"RealEstateConsultant".tr(),
              titleAlign: TextAlign.start,
              titleMaxLines: 1,fontWeightType: FontWeightType.medium,
              titleSize: FontSize.s10,titleColor: ColorManager.black),



          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // FollowWidget(title: 'advertisements'.tr(),value: '${ context.read<ProfileProvider>().profileData?.adsNo??0}',),
                FollowWidget(title: 'Following'.tr(),value: '${ context.read<ProfileProvider>().profileData?.follwingNo??0}',),
                const AppSizeBox(width: 10,),
                FollowWidget(title: 'Followers'.tr(),value: '${ context.read<ProfileProvider>().profileData?.followersNo??0}',),
              ],
            ),
          ),




          Padding(
            padding: const EdgeInsets.symmetric(horizontal:6.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // for(var item in ['advertisements'.tr(),'Personal data'.tr()])
                  InkWell(
                    onTap: () =>widget.onTabPressed(PersonalDataType.ads),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(RadiusManager.r16),
                          color: widget.showAdsTab==PersonalDataType.ads?ColorManager.primary:ColorManager.white
                        // boxShadow: Constants.kBoxShadow
                      ),
                      child: AppText(
                          title: 'MyAds'.tr(),
                          titleAlign: TextAlign.center,
                          titleMaxLines: 1,fontWeightType: FontWeightType.bold,
                          titleSize: FontSize.s12,
                          titleColor: widget.showAdsTab==PersonalDataType.ads?ColorManager.white:ColorManager.grey),
                    ),
                  ),
                  InkWell(
                    onTap: () =>widget.onTabPressed(PersonalDataType.favorite),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(RadiusManager.r16),
                          color: widget.showAdsTab==PersonalDataType.favorite?ColorManager.primary:ColorManager.white
                        // boxShadow: Constants.kBoxShadow
                      ),
                      child: AppText(
                          title: 'Favorite'.tr(),
                          titleAlign: TextAlign.center,
                          titleMaxLines: 1,fontWeightType: FontWeightType.bold,
                          titleSize: FontSize.s12,
                          titleColor: widget.showAdsTab==PersonalDataType.favorite?ColorManager.white:ColorManager.grey),
                    ),
                  ),
                  InkWell(
                    onTap: () =>widget.onTabPressed(PersonalDataType.agreements),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(RadiusManager.r16),
                          color: widget.showAdsTab==PersonalDataType.agreements?ColorManager.primary:ColorManager.white
                        // boxShadow: Constants.kBoxShadow
                      ),
                      child: AppText(
                          title: 'Agreements'.tr(),
                          titleAlign: TextAlign.center,
                          titleMaxLines: 1,fontWeightType: FontWeightType.bold,
                          titleSize: FontSize.s12,
                          titleColor: widget.showAdsTab==PersonalDataType.agreements?ColorManager.white:ColorManager.grey),
                    ),
                  ),
                  InkWell(
                    onTap: () =>widget.onTabPressed(PersonalDataType.personal),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(RadiusManager.r16),
                          color: widget.showAdsTab==PersonalDataType.personal?ColorManager.primary:ColorManager.white
                        // boxShadow: Constants.kBoxShadow
                      ),
                      child: AppText(
                          title: 'Personal data'.tr(),
                          titleAlign: TextAlign.end,
                          titleMaxLines: 1,fontWeightType: FontWeightType.bold,
                          titleSize: FontSize.s12,
                          titleColor: widget.showAdsTab==PersonalDataType.personal?ColorManager.white:ColorManager.grey),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );


}
}
