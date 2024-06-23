import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/app/url_luncher.dart';
import 'package:tashil_agary/components/buttons/text_button.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class AppStoreLinksBottomSheet extends StatelessWidget {
  const AppStoreLinksBottomSheet({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Material(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(RadiusManager.r20),
          topRight: Radius.circular(RadiusManager.r20),
        ),
        color: ColorManager.white,
        child: Container(
          padding: const EdgeInsets.all(PaddingManager.p20),
          // height:  .75.sh,
          width:  1.0.sw,
          constraints: BoxConstraints(maxHeight: .86.sh, minHeight: .3.sh,),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(RadiusManager.r20),
              topRight: Radius.circular(RadiusManager.r20),),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const AppSizeBox(height: AppSize.s10,),

                MyTextButton(
                    title: 'Ios',
                    primaryColor: ColorManager.textFormFieldFillColor,
                    radius: RadiusManager.r8,
                    size: Size( .8.sw,  40),
                    titleColor: ColorManager.text,
                    titleSize: FontSize.s14,
                    fontWeightType: FontWeightType.regular,
                    onPressed: () {

                      Navigator.pop(context);
                      // UrlLauncherMethods.launchURL(url: Constants.settingModel.appleAppLinkVendor);
                    }),
                MyTextButton(
                    title: 'Android',
                    primaryColor: ColorManager.textFormFieldFillColor,
                    radius: RadiusManager.r8,
                    size: Size( .8.sw,  40),
                    titleColor: ColorManager.text,
                    titleSize: FontSize.s14,
                    fontWeightType: FontWeightType.regular,
                    onPressed: () {
                      Navigator.pop(context);
                      // UrlLauncherMethods.launchURL(url: Constants.settingModel.androidAppLinkVendor);
                    }),


                const AppSizeBox(height: AppSize.s16,),

                InkWell(
                  onTap: ()=>Navigator.pop(context),
                  child: AppText(
                      title: 'Close'.tr(),
                      titleAlign: TextAlign.center,
                      titleSize: FontSize.s16,titleColor: ColorManager.black),
                ),

                const AppSizeBox(height: AppSize.s20,),

              ],
            ),
          ),
        )
    );
  }
}
