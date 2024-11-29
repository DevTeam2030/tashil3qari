part of'widgets_imports.dart';

class PersonalProfileDetailsTab extends StatefulWidget {
  final PersonalProfileData personalProfileData;
  const PersonalProfileDetailsTab({super.key,required this.personalProfileData});

  @override
  State<PersonalProfileDetailsTab> createState() => _PersonalProfileDetailsTabState();
}

class _PersonalProfileDetailsTabState extends State<PersonalProfileDetailsTab> {
  bool showPassword=false;
@override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 10),
    child: Form(
      key: widget.personalProfileData.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [



          AppSizeBox(height: AppSize.s20.h),
          Row(
            children: [
              AppText(title:'firstName'.tr(),
                titleSize: FontSize.s12,
                titleMaxLines: 2,
                titleAlign: TextAlign.start,
                titleColor: ColorManager.icons,
                fontWeightType: FontWeightType.medium,),
            ],
          ),
          const AppSizeBox(height: AppSize.s10),

          DefaultTextFormField(
            controller: widget.personalProfileData.firstNameController,
            hintTitle: 'firstName'.tr(),
            labelTitle: 'firstName'.tr(),
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.text,
            hintFontSize: FontSize.s12,
            hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
            textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
            textSize: FontSize.s12,
            fillColor: ColorManager.textGrey,
            borderColor: ColorManager.textGrey,
            borderRadius: RadiusManager.r10,
            // prefixIcon: const Icon(Icons.email_outlined,color: ColorManager.icons,size: AppSize.s20,),
            validator: (v) => Validator().validateEmpty(value: v.toString(),),
          ),

          const AppSizeBox(height: AppSize.s10),
          Row(
            children: [
              AppText(title:'Nationality'.tr(),
                titleSize: FontSize.s12,
                titleMaxLines: 2,
                titleAlign: TextAlign.start,
                titleColor: ColorManager.icons,
                fontWeightType: FontWeightType.medium,),
            ],
          ),
          const AppSizeBox(height: AppSize.s10),

          NationalityDropdownButton(
            nationality: widget.personalProfileData.nationality,
            onChanged: (nationality) {
              setState(() {
                widget.personalProfileData..nationality=nationality;
              });
            },
          ),


          const AppSizeBox(height: AppSize.s10),
          Row(
            children: [
              AppText(title:'lastName'.tr(),
                titleSize: FontSize.s12,
                titleMaxLines: 2,
                titleAlign: TextAlign.start,
                titleColor: ColorManager.icons,
                fontWeightType: FontWeightType.medium,),
            ],
          ),
          const AppSizeBox(height: AppSize.s10),
          DefaultTextFormField(
            controller: widget.personalProfileData.lastNameController,
            hintTitle: 'lastName'.tr(),
            labelTitle: 'lastName'.tr(),
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.text,
            hintFontSize: FontSize.s12,
            hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
            textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
            textSize: FontSize.s12,
            fillColor: ColorManager.textGrey,
            borderColor: ColorManager.textGrey,
            borderRadius: RadiusManager.r10,
            // prefixIcon: const Icon(Icons.email_outlined,color: ColorManager.icons,size: AppSize.s20,),
            validator: (v) => Validator().validateEmpty(value: v.toString(),),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppSizeBox(height: AppSize.s10),
              Row(
                children: [
                  AppText(
                    title: widget.personalProfileData.userType==UserType.consultant?"idNumberCons".tr(): "idNumberUser".tr(),
                    // title:'National Identification Number'.tr(),
                    titleSize: FontSize.s12,
                    titleMaxLines: 2,
                    titleAlign: TextAlign.start,
                    titleColor: ColorManager.icons,
                    fontWeightType: FontWeightType.medium,),
                ],
              ),
              const AppSizeBox(height: AppSize.s10),

              DefaultTextFormField(
                enabled: false,
                controller: widget.personalProfileData.idController,
                hintTitle:  widget.personalProfileData.userType==UserType.consultant?"idNumberCons".tr(): "idNumberUser".tr(),
                labelTitle: widget.personalProfileData.userType==UserType.consultant?"idNumberCons".tr(): "idNumberUser".tr(),
                // hintTitle: 'Enter national ID number'.tr(),
                // labelTitle: 'Enter national ID number'.tr(),
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.phone,
                hintFontSize: FontSize.s12,
                hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                textSize: FontSize.s12,
                fillColor: ColorManager.textGrey,
                borderColor: ColorManager.textGrey,
                borderRadius: RadiusManager.r10,
                // prefixIcon: const Icon(Icons.phone,color: ColorManager.icons,size: AppSize.s20,),
                validator: (v) => Validator().validateIdNumber(value: v.toString(),),
              ),
            ],
          ),



          const AppSizeBox(height: AppSize.s10),
          Row(
            children: [
              AppText(title:'MobileNumber'.tr(),
                titleSize: FontSize.s12,
                titleMaxLines: 2,
                titleAlign: TextAlign.start,
                titleColor: ColorManager.icons,
                fontWeightType: FontWeightType.medium,),
            ],
          ),
          const AppSizeBox(height: AppSize.s10),

          DefaultTextFormField(
            controller: widget.personalProfileData.phoneController,
            hintTitle: '05xxxxxxxx',
            // hintTitle: 'MobileNumber'.tr(),
            labelTitle: 'MobileNumber'.tr(),
            enabled: false,
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.phone,
            hintFontSize: FontSize.s12,
            hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
            textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
            textSize: FontSize.s12,
            fillColor: ColorManager.textGrey,
            borderColor: ColorManager.textGrey,
            borderRadius: RadiusManager.r10,
            // prefixIcon: const Icon(Icons.phone,color: ColorManager.icons,size: AppSize.s20,),
            validator: (v) => Validator().validatePhone(value: v.toString(),),
          ),

          const AppSizeBox(height: AppSize.s10),
          Row(
            children: [
              AppText(title:'email'.tr(),
                titleSize: FontSize.s12,
                titleMaxLines: 2,
                titleAlign: TextAlign.start,
                titleColor: ColorManager.icons,
                fontWeightType: FontWeightType.medium,),
            ],
          ),
          const AppSizeBox(height: AppSize.s10),

          DefaultTextFormField(
            controller: widget.personalProfileData.emailController,
            hintTitle: 'email'.tr(),
            labelTitle: 'email'.tr(),
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.phone,
            hintFontSize: FontSize.s12,
            hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
            textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
            textSize: FontSize.s12,
            fillColor: ColorManager.textGrey,
            borderColor: ColorManager.textGrey,
            borderRadius: RadiusManager.r10,
            // prefixIcon: const Icon(Icons.phone,color: ColorManager.icons,size: AppSize.s20,),
            validator: (v) => Validator().validateEmail(value: v.toString(),),
          ),


          const AppSizeBox(height: AppSize.s10),
          Row(
            children: [
              AppText(title:'Membership type'.tr(),
                titleSize: FontSize.s12,
                titleMaxLines: 2,
                titleAlign: TextAlign.start,
                titleColor: ColorManager.icons,
                fontWeightType: FontWeightType.medium,),
            ],
          ),
          const AppSizeBox(height: AppSize.s10),
          // RegisterAsDropdownButton(
          //   userType:   widget.personalProfileData.userType,
          //   onChanged: (type) {
          //     setState(() {
          //       widget.personalProfileData.userType=type;
          //     });
          //   },
          // ),
          Container(
            width: 1.0.sw,
            height: AppSize.s50,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 14),
            decoration:Utils.returnDropdownButtonDecoration(
                ColorManager.textGrey,ColorManager.textGrey,RadiusManager.r8
            ),
            child: Row(
              children: [
                AppText(
                    title:   widget.personalProfileData.userType==UserType.user? "user".tr():"RealEstateConsultant".tr(),
                    titleAlign: TextAlign.start,
                    titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                    titleSize: FontSize.s16,titleColor: ColorManager.icons),
              ],
            ),
          ),
          const AppSizeBox(height: AppSize.s10),

          // if(Constants.userDataModel!.isUser==false)
            if(widget.personalProfileData.userType==UserType.consultant)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AppText(title:'licenseNumber'.tr(),
                      titleSize: FontSize.s12,
                      titleMaxLines: 2,
                      titleAlign: TextAlign.start,
                      titleColor: ColorManager.icons,
                      fontWeightType: FontWeightType.medium,),
                  ],
                ),
                const AppSizeBox(height: AppSize.s10),

                DefaultTextFormField(
                  controller: widget.personalProfileData.licenseNumberController,
                  hintTitle: 'licenseNumber'.tr(),
                  labelTitle: 'licenseNumber'.tr(),
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.phone,
                  hintFontSize: FontSize.s12,
                  hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                  textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                  textSize: FontSize.s12,
                  fillColor: ColorManager.textGrey,
                  borderColor: ColorManager.textGrey,
                  borderRadius: RadiusManager.r10,
                  // prefixIcon: const Icon(Icons.phone,color: ColorManager.icons,size: AppSize.s20,),
                  validator: (v) => Validator().validateEmpty(value: v.toString(),),
                ),

                      const AppSizeBox(height: AppSize.s10),
                      Row(
                        children: [
                          AppText(title:'aboutYou'.tr(),
                            titleSize: FontSize.s12,
                            titleMaxLines: 2,
                            titleAlign: TextAlign.start,
                            titleColor: ColorManager.icons,
                            fontWeightType: FontWeightType.medium,),
                        ],
                      ),
                      const AppSizeBox(height: AppSize.s10),


                      MoreLineTextFormField(
                        controller: widget.personalProfileData.desController,
                        hintTitle: 'aboutYou'.tr(),
                        labelTitle: 'aboutYou'.tr(),
                        textInputType: TextInputType.multiline,
                        textInputAction: TextInputAction.next,
                        hintFontSize: FontSize.s12,
                        hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                        textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                        textSize: FontSize.s12,
                        fillColor: ColorManager.textGrey,
                        borderColor: ColorManager.textGrey,
                        maxLines: 3,
                        // borderRadius: RadiusManager.r10,
                        // prefixIcon: const Icon(Icons.phone,color: ColorManager.icons,size: AppSize.s20,),
                        validator: (v) => Validator().validateEmpty(value: v.toString(),),
                      ),



              ],
            ),





          const AppSizeBox(height: AppSize.s10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: AppText(title:'VerifyAccountAbsher'.tr(),
                  titleSize: FontSize.s10,
                  titleMaxLines: 2,
                  titleAlign: TextAlign.start,
                  titleColor: ColorManager.icons,
                  fontWeightType: FontWeightType.extraBold,),
              ),

            ],
          ),
          const AppSizeBox(height: AppSize.s10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextButton(title: 'SaveChanges'.tr(),
                size: Size( .65.sw,  42),
                radius: 8,
                fontWeightType: FontWeightType.medium,
                titleSize: FontSize.s18,
                primaryColor: ColorManager.primary,
                titleColor: ColorManager.white,
                onPressed: ()=>widget.personalProfileData.updateProfile(context: context),),
            ],
          ),
          const AppSizeBox(height: AppSize.s10),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             MyTextButton(title: 'DeleteMyAccount'.tr(),
                 size: Size( .65.sw,  42),
                 radius: 8,
                 fontWeightType: FontWeightType.medium,
                 titleSize: FontSize.s18,
                 primaryColor: ColorManager.primary,
                 titleColor: ColorManager.white,
                 onPressed: (){
                   LoadingDialog().optionalAgreeAlertDialog(context: context,
                     title: 'delete account'.tr(),
                     message: 'DeleteAccountMessage'.tr(),
                     okClick: (){
                       Navigator.pop(context);
                       context.read<AuthProvider>().deleteAccount(context: context,);
                     },
                   );
                 }),

           ],
         ),
     if(widget.personalProfileData.userType==UserType.user)
     Padding(padding: const EdgeInsets.only(top: 10),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         MyTextButton(title: 'upgradeTpConsultant'.tr(),
             size: Size( .65.sw,  42),
             radius: 8,
             fontWeightType: FontWeightType.medium,
             titleSize: FontSize.s18,
             primaryColor: ColorManager.primary,
             titleColor: ColorManager.white,
             onPressed: (){
               MyRoute().navigate(context: context, route: const UpgradeUserToConsultantScreen());
             }),
       ],
     ),),

          const AppSizeBox(height: AppSize.s20),


          Container(
            width: 1.0.sw,
            height: AppSize.s50,
            padding: EdgeInsets.symmetric(horizontal: PaddingManager.p8),
            decoration:Utils.returnDropdownButtonDecoration(
                ColorManager.textGrey,ColorManager.textGrey,RadiusManager.r8
            ),
            child: InkWell(
              onTap: (){
                setState(() {
                  showPassword=!showPassword;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(title:'ChangePassword'.tr(),
                    titleSize: FontSize.s16,
                    titleMaxLines: 2,
                    titleAlign: TextAlign.start,
                    titleColor: ColorManager.icons,
                    fontWeightType: FontWeightType.extraBold,),

                  Icon(showPassword?Icons.arrow_drop_up_sharp:Icons.arrow_drop_down_sharp,
                    color: ColorManager.textField,size: AppSize.s30,),
                ],
              ),
            ),
          ),

          if(showPassword)Form(
            key: widget.personalProfileData.formPasswordKey,
            child: Column(
              children: [
                const AppSizeBox(height: AppSize.s10),
                Row(
                  children: [
                    AppText(title:'OldPassword'.tr(),
                      titleSize: FontSize.s14,
                      titleMaxLines: 2,
                      titleAlign: TextAlign.start,
                      titleColor: ColorManager.appBarTitle,
                      fontWeightType: FontWeightType.medium,),
                  ],
                ),
                const AppSizeBox(height: AppSize.s10),
                DefaultTextFormField(
                  controller: widget.personalProfileData.oldPasswordController,
                  hintTitle: 'OldPassword'.tr(),
                  labelTitle: 'OldPassword'.tr(),
                  hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                  textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                  textSize: FontSize.s12,
                  fillColor: ColorManager.textGrey,
                  borderColor: ColorManager.textGrey,
                  borderRadius: RadiusManager.r10,
                  textInputAction: TextInputAction.next,
                  isPasswordTextFieldForm: true,
                  textInputType: TextInputType.visiblePassword,
                  validator: (v) => Validator().validatePassword(value: v.toString(),),
                ),

                const AppSizeBox(height: AppSize.s10),
                Row(
                  children: [
                    AppText(title:'NewPassword'.tr(),
                      titleSize: FontSize.s14,
                      titleMaxLines: 2,
                      titleAlign: TextAlign.start,
                      titleColor: ColorManager.appBarTitle,
                      fontWeightType: FontWeightType.medium,),
                  ],
                ),
                const AppSizeBox(height: AppSize.s10),
                DefaultTextFormField(
                  controller: widget.personalProfileData.newPasswordController,
                  hintTitle: 'NewPassword'.tr(),
                  labelTitle: 'NewPassword'.tr(),
                  textInputAction: TextInputAction.next,
                  isPasswordTextFieldForm: true,
                  hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                  textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                  textSize: FontSize.s12,
                  fillColor: ColorManager.textGrey,
                  borderColor: ColorManager.textGrey,
                  borderRadius: RadiusManager.r10,
                  textInputType: TextInputType.visiblePassword,
                  validator: (v) => Validator().validatePassword(value: v.toString(),),
                ),


                const AppSizeBox(height: AppSize.s10),
                Row(
                  children: [
                    AppText(title:'ConfirmNewPassword'.tr(),
                      titleSize: FontSize.s14,
                      titleMaxLines: 2,
                      titleAlign: TextAlign.start,
                      titleColor: ColorManager.appBarTitle,
                      fontWeightType: FontWeightType.medium,),
                  ],
                ),
                const AppSizeBox(height: AppSize.s10),
                DefaultTextFormField(
                  controller: widget.personalProfileData.confirmNewPasswordController,
                  hintTitle: 'ConfirmNewPassword'.tr(),
                  labelTitle: 'ConfirmNewPassword'.tr(),
                  textInputAction: TextInputAction.next,
                  isPasswordTextFieldForm: true,
                  hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                  textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                  textSize: FontSize.s12,
                  fillColor: ColorManager.textGrey,
                  borderColor: ColorManager.textGrey,
                  borderRadius: RadiusManager.r10,
                  textInputType: TextInputType.visiblePassword,
                  validator: (v) => Validator().validatePasswordConfirm(confirm: v.toString(),pass:widget.personalProfileData.newPasswordController.text ),
                ),



                const AppSizeBox(height: AppSize.s10),


                MyTextButton(title: 'SaveChanges'.tr(),
                    size: Size( .65.sw,  42),
                    fontWeightType: FontWeightType.bold,
                    titleSize: FontSize.s16,
                    primaryColor: ColorManager.primary,
                    titleColor: ColorManager.white,
                    onPressed: ()=>widget.personalProfileData.changePassword(context: context)),
              ],
            ),
          ),
          const AppSizeBox(height: AppSize.s60),

        ],
      ),
    ),
  );
}
}
