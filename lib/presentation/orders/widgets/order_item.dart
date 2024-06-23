import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/my_separator.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

import '../../../utilites/font_manager.dart';

class OrderItem extends StatelessWidget {
  final Function? onTap;
  const OrderItem({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    double height=AppSize.s90;
    double borderRadius=RadiusManager.r10;
    return   Padding(
      padding: const EdgeInsets.symmetric(vertical: PaddingManager.p12,
          // horizontal: PaddingManager.p6
      ),
      child: InkWell(
        onTap: ()=>onTap!=null?onTap!():null,
        child: Row(

          children: [
            Container(
              height: height,
              width: AppSize.s4,
              decoration: BoxDecoration(
                color:ColorManager.primary,
                // color:onTap!=null? ColorManager.drawerInActive:ColorManager.primary,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
            Container(
              width: 0.88.sw,
              height: height,
              padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p14,
                  vertical: PaddingManager.p16),

              decoration: BoxDecoration(
                color: ColorManager.white,
                // shadowColor: ColorManager.black.withOpacity(.7),
                // elevation: .4,
                boxShadow: Constants.kBoxShadow,
                borderRadius: Constants.isArabic?
                 BorderRadius.only(
                    topLeft: Radius.circular(borderRadius),
                    bottomLeft: Radius.circular(borderRadius)
                )
                    : BorderRadius.only(
                    topRight: Radius.circular(borderRadius),
                    bottomRight: Radius.circular(borderRadius)
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(title:'Order'.tr()+' #12347552', titleSize: FontSize.s12,
                        titleMaxLines: 2,
                        titleHeight: 1.2,
                        titleAlign: TextAlign.start,
                        titleColor: ColorManager.notificationTitle,
                        fontWeightType: FontWeightType.bold,),

                      AppText(title:'25/7/2023',
                        titleSize: FontSize.s12,
                        titleMaxLines: 2,
                        titleHeight: 1.2,
                        titleAlign: TextAlign.start,
                        titleColor: ColorManager.drawerInActive,
                        fontWeightType: FontWeightType.medium,),
                    ],
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: PaddingManager.p12),
                    child: MySeparator(color: ColorManager.mySeparator),
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          AppText(title:'Total Items'.tr()+':',
                            titleSize: FontSize.s12,
                            titleAlign: TextAlign.start,
                            titleMaxLines: 1,
                            titleColor: ColorManager.text,
                            fontWeightType: FontWeightType.regular,),
                          const AppSizeBox(width: AppSize.s10,),
                          AppText(
                            title: '20',
                            titleAlign: TextAlign.start,
                            titleSize: FontSize.s12,
                            titleMaxLines: 1,
                            titleColor: ColorManager.primary,
                            fontWeightType: FontWeightType.bold,),
                        ],
                      ),

                      Row(
                        children: [
                          AppText(title:'Total'.tr()+':',
                            titleSize: FontSize.s12,
                            titleAlign: TextAlign.start,
                            titleMaxLines: 1,
                            titleColor: ColorManager.text,
                            fontWeightType: FontWeightType.regular,),
                          const AppSizeBox(width: AppSize.s10,),
                          AppText(
                            title: '400${'qar'.tr()}',
                            titleAlign: TextAlign.start,
                            titleSize: FontSize.s12,
                            titleMaxLines: 1,
                            titleColor: ColorManager.primary,
                            fontWeightType: FontWeightType.bold,),
                        ],
                      ),
                    ],
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
