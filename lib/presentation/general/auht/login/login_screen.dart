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
import 'package:tashil_agary/presentation/general/auht/forget_passwword/enter_email_forget_password_screen.dart';
import 'package:tashil_agary/presentation/general/auht/login/login_data.dart';
import 'package:tashil_agary/presentation/general/auht/register/register_screen.dart';
import 'package:tashil_agary/presentation/general/auht/widgets/sign_up_with_widget.dart';
import 'package:tashil_agary/providers/auth_provider.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import 'package:tashil_agary/utilites/route_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';
import '../../../../components/text_field/text_field_imports.dart';
import '../widgets/bar_title_value.dart';
import '../widgets/loginImage.dart';
import '../widgets/visitor_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key,});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 late LoginData _loginData;
  @override
  void initState() {
    super.initState();
    _loginData=LoginData();
   // _loginData.idNumberController.text='654321';
   //  _loginData.passwordController.text='as140800as';
  }

  @override
  void dispose() {
    super.dispose();
    _loginData.passwordController.dispose();
    _loginData.idNumberController.dispose();
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
            child: Stack(
              children: [
                const LoginImage(),
                Container(
                  height: 1.0.sh,
                  width: 1.0.sw,
                  margin:returnPadding(),
                  child:  Form(
                    key: _loginData.formKey,
                    child:  SingleChildScrollView(
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
                          Image.asset(ImageManager.splash_logo,
                            height: AppSize.s70,width: AppSize.s100,fit: BoxFit.fill,),



                          const AppSizeBox(height: AppSize.s30),
                          BarTitleValue(
                            title: 'signIn'.tr(),
                              subtitle:'LoginAppBarMessage'.tr() ,
                          ),


                          const AppSizeBox(height: AppSize.s20),


                          DefaultTextFormField(
                            controller: _loginData.idNumberController,
                            hintTitle: 'idNumberCons'.tr(),
                            labelTitle: 'idNumberCons'.tr(),
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.text,
                            hintFontSize: FontSize.s12,
                            hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                            textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s16,underline: false),
                            textSize: FontSize.s12,
                            fillColor: ColorManager.textGrey,
                            borderColor: ColorManager.textGrey,
                            // borderRadius: RadiusManager.r10,
                            prefixIcon: const Icon(Icons.email_outlined,color: ColorManager.icons,size: AppSize.s20,),
                            validator: (v) => Validator().validateEmpty(value: v.toString(),),
                          ),


                          AppSizeBox(height: AppSize.s20.h),

                          DefaultTextFormField(
                            controller: _loginData.passwordController,
                            hintTitle: 'Password'.tr(),
                            labelTitle: 'Password'.tr(),
                            hintFontSize: FontSize.s12,
                           textSize: FontSize.s12,
                            hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                            textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s16,underline: false),
                            fillColor: ColorManager.textGrey,
                            borderColor: ColorManager.textGrey,
                            // borderRadius: RadiusManager.r10,
                            prefixIcon: const Icon(Icons.lock_open,color: ColorManager.icons,size: AppSize.s20,),
                            textInputAction: TextInputAction.next,
                            isPasswordTextFieldForm: true,
                            textInputType: TextInputType.visiblePassword,
                            validator: (v) => Validator().validateEmpty(value: v.toString(),),
                          ),






                          const AppSizeBox(height: AppSize.s14),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              InkWell(
                                onTap: ()=>MyRoute().navigate(context: context, route: const EnterEmailForgetPasswordScreen()),
                                child: AppText(title: 'Forget password'.tr(),
                                    titleSize: FontSize.s12,
                                titleColor: ColorManager.icons),
                              ),
                            ],
                          ),


                          const AppSizeBox(height: AppSize.s25),
                          MyTextButton(title: 'signIn'.tr(),
                            size: Size( .85.sw,  47),
                            radius: 8,
                            fontWeightType: FontWeightType.bold,
                            titleSize: FontSize.s18,
                            primaryColor: ColorManager.primary,
                            titleColor: ColorManager.white,
                            onPressed: ()=>_loginData.login(context: context),),

                          const AppSizeBox(height: AppSize.s20),

                          InkWell(
                            onTap: ()=>
                            MyRoute().navigate(context: context,withReplace: true,
                                route:  const RegisterScreen()),
                            child: RichText(

                              text:  TextSpan(
                                text:"don'tHaveAnAccount?".tr(),
                                style:getAppTextStyle(titleColor: ColorManager.text,
                                    fontWeightType: FontWeightType.medium,
                                    titleSize:FontSize.s12,underline: false),

                                children: [
                                  TextSpan(
                                    text:' ${'Create Account'.tr()}',
                                    style: getAppTextStyle(
                                        titleColor: ColorManager.primary,
                                        fontWeightType: FontWeightType.medium,
                                        titleSize:FontSize.s12,underline: false),

                                  ),

                                ],
                              ),
                            ),
                          ),
                          // const AppSizeBox(height: AppSize.s16),
                          // const SignUpWithWidget(authType: AuthType.login),

                           AppSizeBox(height: .11.sh),
                          const VisitorButton(),

                          const AppSizeBox(height: AppSize.s20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
