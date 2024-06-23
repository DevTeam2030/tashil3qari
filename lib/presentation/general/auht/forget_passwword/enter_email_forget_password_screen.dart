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
import 'package:tashil_agary/providers/auth_provider.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';
import '../../../../components/text_field/text_field_imports.dart';
import '../widgets/bar_title_value.dart';


class EnterEmailForgetPasswordScreen extends StatefulWidget {
  const EnterEmailForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<EnterEmailForgetPasswordScreen> createState() => _EnterEmailForgetPasswordScreenState();
}

class _EnterEmailForgetPasswordScreenState extends State<EnterEmailForgetPasswordScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(title: 'ChangePassword'.tr(),showLogo: false,
      //   showBackICon: true,  titleColor: ColorManager.primary,showNotificationIcon: false),
      body: ScreenLoading(
        isLoading: context.watch<AuthProvider>().isLoading,
        child: Container(
          width: 1.0.sw,
          height: 1.0.sh,
          margin: returnPadding(),
          child: Form(
            key: formKey,
            child:  SingleChildScrollView(
              child:  Column(
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
                    title: 'Forget password1'.tr(),
                    subtitle:'Enter your email to continue'.tr(),
                  ),



                  const AppSizeBox(height: AppSize.s20),


                  DefaultTextFormField(
                    controller: emailController,
                    hintTitle: 'Email'.tr(),
                    labelTitle: 'Email'.tr(),
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                    hintFontSize: FontSize.s12,
                    hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                    textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s16,underline: false),
                    textSize: FontSize.s12,
                    fillColor: ColorManager.textGrey,
                    borderColor: ColorManager.textGrey,
                    // borderRadius: RadiusManager.r10,
                    prefixIcon: const Icon(Icons.email_outlined,color: ColorManager.icons,size: AppSize.s20,),
                    validator: (v) => Validator().validateEmail(value: v.toString(),),
                  ),


                  const AppSizeBox(height: AppSize.s40),




                  const AppSizeBox(height: AppSize.s25),
                  MyTextButton(title: 'Continue'.tr(),
                      size: Size( .85.sw,  47),
                      radius: 8,
                      fontWeightType: FontWeightType.bold,
                      titleSize: FontSize.s18,
                      primaryColor: ColorManager.primary,
                      titleColor: ColorManager.white,
                    onPressed: (){
                      FocusScope.of(context).requestFocus( FocusNode());
                      if(formKey.currentState!.validate()){
                        context.read<AuthProvider>().forgetPassword(context: context,
                          email: emailController.text.trim(),);
                      }
                    }),

                  // MyTextButton(title: 'Send Code'.tr(),
                  //   size: Size( .5.sw,  47),
                  //   fontWeightType: FontWeightType.bold,
                  //   titleSize: FontSize.s18,
                  //   primaryColor: ColorManager.primary,
                  //   titleColor: ColorManager.white,
                  //   onPressed: (){
                  //   // MyRoute().navigate(context: context, route: const ForgetPasswordScreen());
                  //   MyRoute().navigate(context: context, route: const OtpScreen(email: 'test@gmail.com',));
                  //   }),




                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
