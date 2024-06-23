import 'package:tashil_agary/app/cache_helper.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/components/buttons/text_button.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/presentation/general/auht/login/login_screen.dart';
import 'package:tashil_agary/presentation/general/auht/register/register_screen.dart';
import 'package:tashil_agary/presentation/dashboard/dash_board_screen.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import 'package:tashil_agary/utilites/responsive_manager.dart';
import 'package:tashil_agary/utilites/route_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AuthDashBoardScreen extends StatefulWidget {
  const AuthDashBoardScreen({super.key,});

  @override
  State<AuthDashBoardScreen> createState() => _AuthDashBoardScreenState();
}

class _AuthDashBoardScreenState extends State<AuthDashBoardScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Container(
          height: 1.0.sh,
          width: 1.0.sw,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(ImageManager.onBoarding),fit: BoxFit.fill)
          ),
          child:Padding(
            padding: returnPadding(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppSizeBox(height: AppSize.s60,),
                  Center(child: Image.asset(ImageManager.onBoardingCircle,width: .8.sw,)),
                  AppSizeBox(height: AppSize.s20.h),
                  AppText(title: 'welcomeToStyloo'.tr(), titleSize: FontSize.s40,
                    titleMaxLines: 2,
                    titleColor: ColorManager.white,
                    fontWeightType: FontWeightType.bold,titleAlign: TextAlign.start,),
                  AppSizeBox(height: AppSize.s10.h),
                  AppText(title: 'onboardMessage'.tr(),
                    titleSize: FontSize.s14,
                    titleMaxLines: 100,
                    titleColor: ColorManager.text,
                    fontWeightType: FontWeightType.regular,titleAlign: TextAlign.start,),





                  AppSizeBox(height: AppSize.s10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MyTextButton(title: 'signIn'.tr(),
                        size: Size( .39.sw,  47),
                        fontWeightType: FontWeightType.bold,
                        titleSize: FontSize.s18,
                        primaryColor: ColorManager.primary,
                        titleColor: ColorManager.white,
                        onPressed: (){
                          CacheHelper.saveData(key: ConstantsKeys.showAuthDashBoardBeforeKey,
                              value: true);
                        MyRoute().navigate(context: context, route: const LoginScreen(),withReplace: true);}),

                      MyTextButton(title: 'signup'.tr(),
                        size: Size( .39.sw,  47),
                          fontWeightType: FontWeightType.bold,
                        titleSize: FontSize.s18,
                        titleColor: ColorManager.primary,
                        onPressed: (){
                        CacheHelper.saveData(key: ConstantsKeys.showAuthDashBoardBeforeKey,
                            value: true);
                          MyRoute().navigate(context: context,
                              route: const RegisterScreen(),withReplace: true);
                        },),

                    ],
                  ),

                  AppSizeBox(height: AppSize.s20.h),

                  Center(
                    child: InkWell(
                      onTap: (){
                        CacheHelper.saveData(key: ConstantsKeys.showAuthDashBoardBeforeKey, value: true);
                        MyRoute().navigate(context: context, route: const DashBoardScreen(),withReplace: true);
                      },
                      child: AppText(title: 'viewAsVisitor'.tr(),
                        titleSize: FontSize.s16,
                        titleMaxLines: 1,
                        titleColor: ColorManager.text,
                        fontWeightType: FontWeightType.regular,titleAlign: TextAlign.center,),
                    ),
                  ),
                  ],
              ),
            ),
          )
      ),

    );
  }
}
