import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/app/validator.dart';
import 'package:tashil_agary/components/buttons/back_button.dart';
import 'package:tashil_agary/components/buttons/text_button.dart';
import 'package:tashil_agary/components/screen_loading.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/components/text_field/text_field_imports.dart';
import 'package:tashil_agary/presentation/general/auht/login/login_screen.dart';
import 'package:tashil_agary/presentation/general/auht/register/register_data.dart';
import 'package:tashil_agary/providers/auth_provider.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import 'package:tashil_agary/utilites/route_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

import '../../../../app/contants.dart';
import '../widgets/agree_terms.dart';
import '../widgets/bar_title_value.dart';
import '../widgets/loginImage.dart';
import '../widgets/nationality_widget.dart';
import '../widgets/register_as_widget.dart';
import '../widgets/serial_numbers_down.dart';
import '../widgets/visitor_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key,});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

   final RegisterData _registerData=RegisterData();

  @override
  void initState() {
    super.initState();
    // _registerData=RegisterData();
  }

  @override
  void dispose() {
    _registerData.idNumberController.dispose();
    // _registerData.nationalityController.dispose();
    _registerData.emailController.dispose();
    _registerData.passwordController.dispose();
    _registerData.licenseNumberController.dispose();
    _registerData.confirmPasswordController.dispose();
    _registerData.phoneController.dispose();
    _registerData.firstNameController.dispose();
    _registerData.lastNameController.dispose();
    _registerData.desController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        body:InkWell(
            splashColor:ColorManager.white,
            focusColor: ColorManager.white,
            onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
          child: ScreenLoading(
            isLoading: context.watch<AuthProvider>().isLoading,
            child:  SizedBox(
              height: 1.0.sh,
              width: 1.0.sw,
              child: Stack(
                children: [
                  const LoginImage(),

                  Container(
                    height: 1.0.sh,
                    width: 1.0.sw,
                    margin:returnPadding(),
                    child: Form(
                      key: _registerData.formKey,
                      child:  SizedBox(
                        child:SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const AppSizeBox(height: AppSize.s60),
                              if(Navigator.canPop(context))
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    BackAppBarButton(),

                                  ],
                                ),
                              // const AppSizeBox(height: AppSize.s20),
                              // Image.asset(ImageManager.splash_logo,
                              //   height: AppSize.s70,width: AppSize.s100,fit: BoxFit.fill,),

                              // const AppSizeBox(height: AppSize.s20),

                              SizedBox(
                                height: AppSize.s90,
                                width: AppSize.s90,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: AppSize.s90,
                                      width: AppSize.s90,
                                      decoration:   BoxDecoration(
                                        shape: BoxShape.circle,
                                        image:  _registerData.imagePicker!=null?DecorationImage(
                                          image: FileImage(File( _registerData.imagePicker!.path)),
                                          fit: BoxFit.cover,
                                        ):DecorationImage(
                                          image: AssetImage(ImageManager.placeHolder),
                                          fit: BoxFit.cover,
                                        ),
                                      ),

                                    ),
                                    Align(
                                      alignment: Constants.isArabic?Alignment.bottomRight:Alignment.bottomLeft,
                                      child: InkWell(
                                        onTap: ()=>Utils().uploadModalBottomSheet(context: context,
                                          onGalleryTap: (photo){
                                            // context.read<AuthProvider>().changeImageProfile(context: context, photo: photo);
                                            setState(()=> _registerData.imagePicker=photo);
                                          },
                                          onCameraTap: (photo){
                                            // context.read<AuthProvider>().changeImageProfile(context: context, photo: photo);
                                            setState(()=> _registerData.imagePicker=photo);
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

                            
                              const AppSizeBox(height: AppSize.s25),
                              BarTitleValue(
                                title: 'Create Account'.tr(),
                                subtitle:'RegisterAppBarMessage'.tr() ,
                              ),



                              const AppSizeBox(height: AppSize.s20),

                              RegisterAsDropdownButton(
                                userType: _registerData.userType,
                                onChanged: (type) {
                                  setState(() {
                                    _registerData.userType=type;
                                  });
                                },
                              ),


                              const AppSizeBox(height: AppSize.s8),
                              DefaultTextFormField(
                                controller: _registerData.idNumberController,
                                hintTitle:_registerData.userType==UserType.consultant?"idNumberCons".tr(): "idNumberUser".tr(),
                                labelTitle:_registerData.userType==UserType.consultant?"idNumberCons".tr(): "idNumberUser".tr(),
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.text,
                                hintFontSize: FontSize.s12,
                                hintStyle: getAppTextStyle(titleColor: ColorManager.icons, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s16,underline: false),
                                textSize: FontSize.s12,
                                fillColor: ColorManager.textGrey,
                                borderColor: ColorManager.textGrey,
                                // borderRadius: RadiusManager.r10,
                                // prefixIcon: const Icon(Icons.email_outlined,color: ColorManager.icons,size: AppSize.s20,),
                                validator: (v) => Validator().validateIdNumber(value: v.toString(),),
                              ),


                              const AppSizeBox(height: AppSize.s8),

                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: DefaultTextFormField(
                                      controller: _registerData.firstNameController,
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
                                      // borderRadius: RadiusManager.r10,
                                      // prefixIcon: const Icon(Icons.email_outlined,color: ColorManager.icons,size: AppSize.s20,),
                                      validator: (v) => Validator().validateEmpty(value: v.toString(),),
                                    ),
                                  ),
                                  const AppSizeBox(width: AppSize.s10),
                                  Expanded(
                                    flex: 1,
                                    child: DefaultTextFormField(
                                      controller: _registerData.lastNameController,
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
                                      // borderRadius: RadiusManager.r10,
                                      // prefixIcon: const Icon(Icons.email_outlined,color: ColorManager.icons,size: AppSize.s20,),
                                      validator: (v) => Validator().validateEmpty(value: v.toString(),),
                                    ),
                                  ),



                                ],
                              ),


                              const AppSizeBox(height: AppSize.s8),

                              DefaultTextFormField(
                                controller: _registerData.phoneController,
                                // hintTitle: 'MobileNumber'.tr(),
                                hintTitle: '05xxxxxxxx',
                                labelTitle: 'MobileNumber'.tr(),
                                textInputAction: TextInputAction.done,
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




                              const AppSizeBox(height: AppSize.s8),
                              if(_registerData.userType==UserType.consultant)
                              Column(
                                children: [
                                  DefaultTextFormField(
                                    controller: _registerData.licenseNumberController,
                                    hintTitle: 'licenseNumber'.tr(),
                                    labelTitle: 'licenseNumber'.tr(),
                                    textInputAction: TextInputAction.next,
                                    textInputType: TextInputType.text,
                                    hintFontSize: FontSize.s12,
                                    hintStyle: getAppTextStyle(titleColor: ColorManager.icons, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                    textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s16,underline: false),
                                    textSize: FontSize.s12,
                                    fillColor: ColorManager.textGrey,
                                    borderColor: ColorManager.textGrey,
                                    // borderRadius: RadiusManager.r10,
                                    // prefixIcon: const Icon(Icons.email_outlined,color: ColorManager.icons,size: AppSize.s20,),
                                    validator: (v) => Validator().validateEmpty(value: v.toString(),),
                                  ),

                                  const AppSizeBox(height: AppSize.s8),
                                  ValueListenableBuilder(valueListenable: _registerData.selectedSerialNumber,
                                    builder: (context, value, child) =>   SerialNumbersDropdownButton(

                                      selectedSerialNumber: _registerData.selectedSerialNumber.value,
                                      onChanged: (selectedSerialNumber)=>_registerData.selectedSerialNumber.value=selectedSerialNumber,
                                    ),),

                                ],
                              ),


                              const AppSizeBox(height: AppSize.s8),

                              NationalityDropdownButton(
                                nationality: _registerData.nationality,
                                onChanged: (nationality) {
                                  setState(() {
                                    _registerData.nationality=nationality;
                                  });
                                },
                              ),



                              const AppSizeBox(height: AppSize.s8),

                              DefaultTextFormField(
                                controller: _registerData.emailController,
                                hintTitle: 'Email'.tr(),
                                labelTitle: 'Email'.tr(),
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.emailAddress,
                                hintFontSize: FontSize.s12,
                                hintStyle: getAppTextStyle(titleColor: ColorManager.icons, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s16,underline: false),
                                textSize: FontSize.s12,
                                fillColor: ColorManager.textGrey,
                                borderColor: ColorManager.textGrey,
                                // borderRadius: RadiusManager.r10,
                                prefixIcon: const Icon(Icons.email_outlined,color: ColorManager.icons,size: AppSize.s20,),
                                validator: (v) => Validator().validateEmail(value: v.toString(),),
                              ),


                              if(_registerData.userType==UserType.consultant)
                                Column(
                                  children: [
                                    const AppSizeBox(height: AppSize.s8),
                                    MoreLineTextFormField(
                                      controller: _registerData.desController,
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
                              const AppSizeBox(height: AppSize.s8),

                              DefaultTextFormField(
                                controller: _registerData.passwordController,
                                hintTitle: 'Password'.tr(),
                                labelTitle: 'Password'.tr(),
                                hintFontSize: FontSize.s12,
                                textSize: FontSize.s12,
                                hintStyle: getAppTextStyle(titleColor: ColorManager.icons, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s16,underline: false),
                                fillColor: ColorManager.textGrey,
                                borderColor: ColorManager.textGrey,
                                borderRadius: RadiusManager.r10,
                                prefixIcon: const Icon(Icons.lock_open,color: ColorManager.icons,size: AppSize.s20,),
                                textInputAction: TextInputAction.next,
                                isPasswordTextFieldForm: true,
                                textInputType: TextInputType.visiblePassword,
                                validator: (v) => Validator().validatePassword(value: v.toString(),),
                              ),

                              const AppSizeBox(height: AppSize.s8),

                              DefaultTextFormField(
                                controller: _registerData.confirmPasswordController,
                                hintTitle: 'Reenter password'.tr(),
                                labelTitle: 'Reenter password'.tr(),
                                hintFontSize: FontSize.s12,
                                textSize: FontSize.s12,
                                hintStyle: getAppTextStyle(titleColor: ColorManager.icons, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s16,underline: false),
                                fillColor: ColorManager.textGrey,
                                borderColor: ColorManager.textGrey,
                                // borderRadius: RadiusManager.r10,
                                prefixIcon: const Icon(Icons.lock_open,color: ColorManager.icons,size: AppSize.s20,),
                                textInputAction: TextInputAction.next,
                                isPasswordTextFieldForm: true,
                                textInputType: TextInputType.visiblePassword,
                                validator: (v) => Validator().validatePasswordConfirm(confirm: v.toString(),pass: _registerData.passwordController.text),

                              ),


                              const AppSizeBox(height: AppSize.s25),
                              AgreeTerms(registerData: _registerData),
                              const AppSizeBox(height: AppSize.s25),
                              MyTextButton(title: 'Create Account'.tr(),
                                size: Size( .8.sw,  47),
                                radius: 8,
                                fontWeightType: FontWeightType.bold,
                                titleSize: FontSize.s18,
                                primaryColor: ColorManager.primary,
                                titleColor: ColorManager.white,
                                onPressed: ()=>_registerData.register(context: context),),

                              const AppSizeBox(height: AppSize.s16),

                              InkWell(
                                onTap: ()=>
                                    MyRoute().navigate(context: context,withReplace: true,
                                        route:  const LoginScreen()),
                                child: RichText(

                                  text:  TextSpan(
                                    text:"Already have an account".tr(),
                                    style:getAppTextStyle(titleColor: ColorManager.text,
                                        fontWeightType: FontWeightType.medium,
                                        titleSize:FontSize.s12,underline: false),

                                    children: [
                                      TextSpan(
                                        text:' ${'signIn'.tr()}',
                                        style: getAppTextStyle(
                                            titleColor: ColorManager.primary,
                                            fontWeightType: FontWeightType.medium,
                                            titleSize:FontSize.s12,underline: false),

                                      ),

                                    ],
                                  ),
                                ),
                              ),
                              AppSizeBox(height: .09.sh),
                              VisitorButton(),

                              const AppSizeBox(height: AppSize.s20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
