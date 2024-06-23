part of'add_ad_imports.dart';

class AddAdRequirementsScreen extends StatefulWidget {
  final AddAdtData addAdtData;
  final UserAdsModel? userAd;
  const AddAdRequirementsScreen({Key? key,required this.addAdtData,this.userAd}) : super(key: key);

  @override
  State<AddAdRequirementsScreen> createState() => _AddAdRequirementsScreenState();
}

class _AddAdRequirementsScreenState extends State<AddAdRequirementsScreen> {

 late AddAdtData addAdtData;
 late UserAdsModel? userAd;
 final formKeyLicense = GlobalKey<FormState>();
 TextEditingController licenseNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    addAdtData=widget.addAdtData;
    userAd=widget.userAd;

  }


  @override
  void dispose() {
    licenseNumberController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(title: userAd!=null?'PostAd'.tr():'AddAd'.tr(),showChatNotify: false,showDivider: false),
      // bottomNavigationBar:: Padding(
      //   padding: const EdgeInsets.symmetric(vertical: 20),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       MyTextButton(title: 'Save the ad without publishing'.tr(),
      //           size: Size( .8.sw,  47),
      //           radius: 6,
      //           fontWeightType: FontWeightType.medium,
      //           titleSize: FontSize.s16,
      //           primaryColor: ColorManager.white,
      //           borderColor: ColorManager.primary,
      //           titleColor: ColorManager.primary,
      //           onPressed: (){
      //             // MyRoute().navigate(context: context, route: AddAdBidScreen(addAdtData: addAdtData,));
      //           }),
      //     ],
      //   ),
      // ),
      body: Consumer<AddPropertyProvider>(
        builder: (context, provider, child) => ScreenLoading(
          isLoading: provider.isLoading,
          height: 1.0.sh,
          width: 1.0.sw,
          child:    Stack(
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(ImageManager.saveAdImage,fit: BoxFit.fill,)),
              Container(
                  height: 1.0.sh,
                  width: 1.0.sw,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child:SingleChildScrollView(
                    child: Column(
                      children: [
                        const AppSizeBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                                title: 'ToPublishYourAd'.tr(),
                                titleAlign: TextAlign.start,
                                titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                                titleSize: FontSize.s20,titleColor: ColorManager.black),



                          ],
                        ),


                        RequirementWidget(
                          firstIcon: FontAwesomeIcons.listCheck,
                          secondIcon: Icons.arrow_drop_down_sharp,
                          isOpenIcon: Icons.arrow_drop_up_sharp,
                          title: 'I have a license for this property'.tr(),
                          child: Form(
                            key: formKeyLicense,
                            child: Column(
                              children: [
                                const AppSizeBox(height: AppSize.s16),
                                DefaultTextFormField(
                                  controller: licenseNumberController,
                                  hintTitle: 'license number'.tr(),
                                  labelTitle: 'license number'.tr(),
                                  textInputAction: TextInputAction.next,
                                  textInputType: TextInputType.text,
                                  hintFontSize: FontSize.s12,
                                  hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                  textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                  textSize: FontSize.s12,
                                  fillColor: ColorManager.white,
                                  borderColor: ColorManager.white,
                                  borderRadius: RadiusManager.r10,
                                  // prefixIcon: const Icon(Icons.email_outlined,color: ColorManager.icons,size: AppSize.s20,),
                                  validator: (v) => Validator().validateEmpty(value: v.toString(),),
                                ),
                                const AppSizeBox(height: AppSize.s16),

                                MyTextButton(title: 'next'.tr(),
                                    size: Size( .8.sw,  47),
                                    radius: 8,
                                    fontWeightType: FontWeightType.bold,
                                    titleSize: FontSize.s18,
                                    primaryColor: ColorManager.primary,
                                    titleColor: ColorManager.white,
                                    onPressed: (){
                                      FocusScope.of(context).requestFocus( FocusNode());
                                      if(formKeyLicense.currentState!.validate()){
                                        if(userAd==null) {
                                          addAdtData.addPropertyWithLicense(license: licenseNumberController.text,context: context);
                                        }else{
                                          addUnPublishedPropertyWithLicense(license: licenseNumberController.text,
                                              propertyId: userAd!.id,
                                              context: context);
                                        }

                                      }


                                      // LoadingDialog().widgetAlertDialog(context:context,
                                      //     widget:  AdSuccesWidget(title: 'requirementsMessage'.tr(),
                                      //       message: 'requirementsMessage1'.tr(),));

                                    }),

                              ],
                            ),
                          ),),

                        RequirementWidget(

                            firstIcon: Icons.add,
                            secondIcon: Icons.arrow_forward_ios,
                            secondIconSize: 16,
                            title: 'Pay 99 riyals to issue the license and publish the advertisement'.tr()
                            .replaceFirst('99', Constants.settingModel.licenseFess.toString()),
                            onTap: (){
                              FocusScope.of(context).requestFocus( FocusNode());


                              if(userAd==null) {
                                addAdtData.addPropertyAndExtractLicense(context: context);
                              }else{
                                addUnPublishedPropertyAndExtractLicense(
                                    propertyId: userAd!.id,
                                    context: context);
                              }
                              // LoadingDialog().widgetAlertDialog(context:context,
                              //     widget:  AdSuccesWidget(title: 'requirementsMessage'.tr(),
                              //       message: 'requirementsMessage2'.tr(),));

                            },
                            child: Text('dddddddddd')),


                        if(Constants.userDataModel!.isUser==true)
                          RequirementWidget(
                              firstIcon: FontAwesomeIcons.addressCard,
                              secondIcon: Icons.arrow_forward_ios_rounded,
                              secondIconSize: 16,
                              title: 'HiringRealEstateConsultant'.tr(),
                              onTap: (){
                                MyRoute().navigate(context: context, route: SelectRealEstateConsultantScreen(
                                  userAd: userAd,
                                  addAdtData: addAdtData,));
                              },
                              child: Text('dddddddddd')),







                      ],
                    ),
                  )


              ),




              if(userAd==null)
              Align(
                alignment: Alignment.bottomCenter,
                child:   Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyTextButton(title: 'Save the ad without publishing'.tr(),
                          size: Size( .8.sw,  47),
                          radius: 6,
                          fontWeightType: FontWeightType.medium,
                          titleSize: FontSize.s16,
                          primaryColor: ColorManager.white,
                          borderColor: ColorManager.primary,
                          titleColor: ColorManager.primary,
                          onPressed: (){
                            addAdtData.saveWithoutPublish(context: context);
                            // gotoIntro(context: context,currentIndexScreen: 0);
                            // MyRoute().navigate(context: context, route: AddAdBidScreen(addAdtData: addAdtData,));
                          }),
                    ],
                  ),
                ),),
            ],
          ),
        ),
      ),


    );
  }

 addUnPublishedPropertyWithLicense({required String license,required BuildContext context,required int propertyId}){
   Map<String, dynamic> body={
     "property_id": propertyId,
     "license_option_id": 1,
     "license": license,
   };
   context.read<AddPropertyProvider>().addUnPublishedPropertyToPublish(context: context, body: body,);

 }

 addUnPublishedPropertyAndExtractLicense({required BuildContext context,required int propertyId}){
   Map<String, dynamic> body={
     "property_id": propertyId,
     "license_option_id": 2,
   };
   context.read<AddPropertyProvider>().addUnPublishedPropertyToPublish(context: context, body: body,);

 }


}
