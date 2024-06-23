part of'add_complaint_imports.dart';

class AddComplaintScreen extends StatefulWidget {
  final int propertyId;
  const AddComplaintScreen({Key? key,required this.propertyId}) : super(key: key);

  @override
  State<AddComplaintScreen> createState() => _AddComplaintScreenState();
}

class _AddComplaintScreenState extends State<AddComplaintScreen> {

late AddComplaintData addComplaintData;



  @override
  void initState() {
    super.initState();
   addComplaintData=AddComplaintData(adId: widget.propertyId,context: context);
  }


  @override
  void dispose() {
    addComplaintData.nameController.dispose();
    addComplaintData.phoneController.dispose();
    addComplaintData.emailController.dispose();
    addComplaintData.complaintTitleController.dispose();
    addComplaintData.complaintDesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: GeneralAppBar(title: 'Report ad'.tr(),showChatNotify: false,showDivider: false),

      body: Consumer<GeneralProvider>(
        builder: (context, provider, child) => ScreenLoading(
          isLoading: provider.isLoading,
          height: 1.0.sh,
          width: 1.0.sw,
          child:   Container(
              height: 1.0.sh,
              width: 1.0.sw,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child:SingleChildScrollView(
                child: Form(
                  key: addComplaintData.formKey,
                  child: Column(
                    children: [
                      const AppSizeBox(height: 30,),
                      DefaultTextFormField(
                        controller: addComplaintData.nameController,
                        hintTitle: 'Name'.tr(),
                        labelTitle: 'Name'.tr(),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text,
                        hintFontSize: FontSize.s12,
                        hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                        textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                        textSize: FontSize.s12,
                        fillColor: ColorManager.textGrey,
                        borderColor: ColorManager.textGrey,
                        // borderRadius: RadiusManager.r10,
                        // prefixIcon: const Icon(Icons.email_outlined,color: ColorManager.icons,size: AppSize.s20,),
                        validator: (v) => Validator().validateEmpty(value: v.toString(),),
                      ),


                      const AppSizeBox(height: AppSize.s12),

                      DefaultTextFormField(
                        controller: addComplaintData.phoneController,
                        hintTitle: 'MobileNumber'.tr(),
                        labelTitle: 'MobileNumber'.tr(),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.phone,
                        hintFontSize: FontSize.s12,
                        hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                        textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                        textSize: FontSize.s12,
                        fillColor: ColorManager.textGrey,
                        borderColor: ColorManager.textGrey,
                        // borderRadius: RadiusManager.r10,
                        prefixIcon: const Icon(Icons.phone,color: ColorManager.icons,size: AppSize.s20,),
                        validator: (v) => Validator().validatePhone(value: v.toString(),),
                      ),

                      const AppSizeBox(height: AppSize.s12),

                      DefaultTextFormField(
                        controller: addComplaintData.emailController,
                        hintTitle: 'email'.tr(),
                        labelTitle: 'email'.tr(),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.emailAddress,
                        hintFontSize: FontSize.s12,
                        hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                        textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                        textSize: FontSize.s12,
                        fillColor: ColorManager.textGrey,
                        borderColor: ColorManager.textGrey,
                        // borderRadius: RadiusManager.r10,
                        prefixIcon: const Icon(Icons.email,color: ColorManager.icons,size: AppSize.s20,),
                        validator: (v) => Validator().validateEmail(value: v.toString(),),
                      ),


                      const AppSizeBox(height: AppSize.s12),

                      DefaultTextFormField(
                        controller: addComplaintData.complaintTitleController,
                        hintTitle: 'problemTitle'.tr(),
                        labelTitle: 'problemTitle'.tr(),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text,
                        hintFontSize: FontSize.s12,
                        hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                        textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                        textSize: FontSize.s12,
                        fillColor: ColorManager.textGrey,
                        borderColor: ColorManager.textGrey,
                        // borderRadius: RadiusManager.r10,
                        // prefixIcon: const Icon(Icons.email,color: ColorManager.icons,size: AppSize.s20,),
                        validator: (v) => Validator().validateEmpty(value: v.toString(),),
                      ),


                      const AppSizeBox(height: AppSize.s12),

                      MoreLineTextFormField(
                        controller: addComplaintData.complaintDesController,
                        hintTitle: 'Theproblem'.tr(),
                        labelTitle: 'Theproblem'.tr(),
                        textInputType: TextInputType.multiline,
                        textInputAction: TextInputAction.next,
                        hintFontSize: FontSize.s12,
                        hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                        textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                        textSize: FontSize.s12,
                        fillColor: ColorManager.textGrey,
                        borderColor: ColorManager.textGrey,
                        borderRadius: RadiusManager.r10,
                        maxLines: 3,
                        validator: (v) => Validator().validateEmpty(value: v.toString(),),
                      ),




                      const AppSizeBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyTextButton(title: 'Confirm'.tr(),
                              size: Size( .8.sw,  47),
                              radius: 8,
                              fontWeightType: FontWeightType.bold,
                              titleSize: FontSize.s18,
                              primaryColor: ColorManager.primary,
                              titleColor: ColorManager.white,
                              onPressed: ()=>addComplaintData.sentData(context: context)),
                        ],
                      ),
                      const AppSizeBox(height: 20,),








                    ],
                  ),
                ),
              )


          ),
        ),
      ),

    );
  }
}
