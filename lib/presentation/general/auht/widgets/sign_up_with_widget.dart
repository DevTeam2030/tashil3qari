import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/providers/auth_provider.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';
import '../../../../components/buttons/text_button.dart';

class SignUpWithWidget extends StatelessWidget {
  final AuthType authType;
  const SignUpWithWidget({Key? key,required this.authType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: .4.sw,
              child: const Divider(
                color: ColorManager.divider,
                // height: 2,
                thickness: 1,
                // indent: 0,endIndent: .4.sw,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: AppText(title: 'or'.tr(),
                  titleSize: FontSize.s12,
                  fontWeightType: FontWeightType.medium,
                  titleColor: ColorManager.icons),
            ),
            SizedBox(
              width: .4.sw,
              child: const Divider(
                color: ColorManager.divider,
                // height: 2,
                thickness: 1,
                // indent: 0,endIndent: .4.sw,
              ),
            ),
          ],
        ),

        const AppSizeBox(height: AppSize.s14),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // if(Platform.isIOS)
            MyTextButton(title: 'visitor'.tr(),
                size: Size( .4.sw,  52),
                radius: 12,
                fontWeightType: FontWeightType.extraBold,
                titleSize: FontSize.s14,
                primaryColor: ColorManager.textGrey,
                titleColor: ColorManager.primary,
                borderColor: ColorManager.textGrey,
                content:     Image.asset( ImageManager.apple,width: AppSize.s30,height: AppSize.s30,) ,
                onPressed: ()=>context.read<AuthProvider>().signInWithGoogle(context: context,authType: authType)),

            const AppSizeBox(width: 10,),
            MyTextButton(title: 'visitor'.tr(),
              size: Size( .4.sw,  52),
              radius: 12,
              fontWeightType: FontWeightType.extraBold,
              titleSize: FontSize.s14,
              primaryColor: ColorManager.textGrey,
              titleColor: ColorManager.primary,
              borderColor: ColorManager.textGrey,
                content:     Image.asset( ImageManager.google,width: AppSize.s35,height: AppSize.s35,) ,
                onPressed: ()=>context.read<AuthProvider>().signInWithGoogle(context: context,authType: authType)),




          ],
        ),
      ],
    );
    return   Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: .4.sw,
              child: const Divider(
                color: ColorManager.divider,
                // height: 2,
                thickness: 1,
                // indent: 0,endIndent: .4.sw,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: AppText(title: 'or'.tr(),
                  titleSize: FontSize.s12,
                  fontWeightType: FontWeightType.medium,
                  titleColor: ColorManager.icons),
            ),
            SizedBox(
              width: .4.sw,
              child: const Divider(
                color: ColorManager.divider,
                // height: 2,
                thickness: 1,
                // indent: 0,endIndent: .4.sw,
              ),
            ),
          ],
        ),

        const AppSizeBox(height: AppSize.s14),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // if(Platform.isIOS)
            MyTextButton(title: 'visitor'.tr(),
                size: Size( .4.sw,  52),
                radius: 12,
                fontWeightType: FontWeightType.extraBold,
                titleSize: FontSize.s14,
                primaryColor: ColorManager.textGrey,
                titleColor: ColorManager.primary,
                borderColor: ColorManager.textGrey,
                content:     Image.asset( ImageManager.apple,width: AppSize.s30,height: AppSize.s30,) ,
                onPressed: ()=>context.read<AuthProvider>().signInWithGoogle(context: context,authType: authType)),

            const AppSizeBox(width: 10,),
            MyTextButton(title: 'visitor'.tr(),
              size: Size( .4.sw,  52),
              radius: 12,
              fontWeightType: FontWeightType.extraBold,
              titleSize: FontSize.s14,
              primaryColor: ColorManager.textGrey,
              titleColor: ColorManager.primary,
              borderColor: ColorManager.textGrey,
                content:     Image.asset( ImageManager.google,width: AppSize.s35,height: AppSize.s35,) ,
                onPressed: ()=>context.read<AuthProvider>().signInWithGoogle(context: context,authType: authType)),




          ],
        ),
      ],
    );
  }
}
