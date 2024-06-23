import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/app_bar.dart';
import 'package:tashil_agary/components/buttons/text_button.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/components/title_row_item.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class CustomerSupportScreen extends StatelessWidget {
  const CustomerSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'CustomerSupport'.tr()),
      body:  SizedBox(
        height: 1.0.sh,
        width: 1.0.sw,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const AppSizeBox(height: AppSize.s30),

              Container(
                // height: .28.sh,
                width: .9.sw,
                // padding: const EdgeInsets.symmetric( horizontal:PaddingManager.p16,
                //     vertical: PaddingManager.p16
                // ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(RadiusManager.r10),
                    color: ColorManager.textFormFieldFillColor
                ),

                child: Column(

                  children: [
                    const AppSizeBox(height: AppSize.s12),
                    Padding(
                      padding: const EdgeInsets.symmetric( horizontal:PaddingManager.p16,
                          // vertical: PaddingManager.p16
                      ),
                      child: Row(
                        children: [
                          AppText(
                              title: 'ForPartners'.tr(),
                              titleAlign: TextAlign.start,
                              titleColor: ColorManager.primary,
                              titleMaxLines: 1,
                              titleHeight: 1.1,
                              fontWeightType: FontWeightType.bold,
                              titleSize: FontSize.s18),
                        ],
                      ),
                    ),
                    const AppSizeBox(height: AppSize.s8),
                    TitleItem(title: 'ContactPartnerSupport'.tr(),onTap: (){}),
                    TitleItem(title: 'SetUpYourAccount'.tr(),showDivider: false,onTap: (){}),
                    const AppSizeBox(height: AppSize.s10),

                    MyTextButton(title: 'PartnerHelpCenter'.tr(),
                        size: Size( .66.sw,  48),
                        fontWeightType: FontWeightType.bold,
                        titleSize: FontSize.s20,
                        primaryColor: ColorManager.transparent,
                        borderColor:ColorManager.primary,
                        titleColor: ColorManager.primary,
                        onPressed: (){}),

                    const AppSizeBox(height: AppSize.s18),
                  ],
                ),
              ),


              const AppSizeBox(height: AppSize.s16),

              Container(
                // height: .47.sh,
                width: .9.sw,
                // padding: const EdgeInsets.symmetric( horizontal:PaddingManager.p16,
                //     vertical: PaddingManager.p16
                // ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(RadiusManager.r10),
                    color: ColorManager.textFormFieldFillColor
                ),

                child: Column(

                  children: [
                    const AppSizeBox(height: AppSize.s12),
                    Padding(
                      padding: const EdgeInsets.symmetric( horizontal:PaddingManager.p16,
                        // vertical: PaddingManager.p16
                      ),
                      child: Row(
                        children: [
                          AppText(
                              title: 'ForPartners'.tr(),
                              titleAlign: TextAlign.start,
                              titleColor: ColorManager.primary,
                              titleMaxLines: 1,
                              titleHeight: 1.1,
                              fontWeightType: FontWeightType.bold,
                              titleSize: FontSize.s18),
                        ],
                      ),
                    ),
                    const AppSizeBox(height: AppSize.s8),
                    TitleItem(title: 'AboutTashil'.tr(),onTap: (){}),
                    TitleItem(title: 'StylooAccountAndProfile'.tr(),onTap: (){}),
                    TitleItem(title: 'YourAppointments'.tr(),onTap: (){}),
                    TitleItem(title: 'VouchersAndMemberships'.tr(),onTap: (){}),
                    TitleItem(title: 'ProductArders'.tr(),showDivider: false,onTap: (){}),
                    const AppSizeBox(height: AppSize.s10),

                    MyTextButton(title: 'PartnerHelpCenter'.tr(),
                        size: Size( .66.sw,  48),
                        fontWeightType: FontWeightType.bold,
                        titleSize: FontSize.s20,
                        primaryColor: ColorManager.transparent,
                        borderColor:ColorManager.primary,
                        titleColor: ColorManager.primary,
                        onPressed: (){}),

                    const AppSizeBox(height: AppSize.s18),
                  ],
                ),
              ),

              const AppSizeBox(height: AppSize.s30),





            ],
          ),
        )
      )
    );
  }
}


