import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

import '../../../../app/enums.dart';
import '../../../../utilites/font_manager.dart';
import '../../../../utilites/styles_manager.dart';

class OrderProductItem extends StatefulWidget {
  const OrderProductItem({super.key});

  @override
  State<OrderProductItem> createState() => _OrderProductItemState();
}

class _OrderProductItemState extends State<OrderProductItem> {
  int count=1;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: PaddingManager.p8,horizontal: PaddingManager.p16),
      padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p8,
          vertical: PaddingManager.p16),

     decoration: BoxDecoration(
       color: ColorManager.white,
       // shadowColor: ColorManager.black.withOpacity(.7),
       // elevation: .4,
       boxShadow: Constants.kBoxShadow,
       borderRadius: BorderRadius.circular(RadiusManager.r10),
     ),
      child: SizedBox(
        height: AppSize.s80,
          width: 1.0.sw,
        child: Row(
          children: [
        Expanded(
          flex: 3,
          child: Container(
              height: 100,
              width: 1.0.sw,
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(RadiusManager.r10),
            image: DecorationImage(image: AssetImage(ImageManager.ballons),fit: BoxFit.fill))
              ),
        ),

            const AppSizeBox(width: AppSize.s10,),
         Expanded(
          flex: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(title:'Summer Hibiscus Foil Balloon Bouquet, 5pc', titleSize: FontSize.s12,
                titleMaxLines: 2,
                titleHeight: 1.2,
                titleAlign: TextAlign.start,
                titleColor: ColorManager.text,
                fontWeightType: FontWeightType.medium,),
              const AppSizeBox(height: AppSize.s14,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    title: '400${'qar'.tr()}',
                    titleSize: FontSize.s16,
                    titleMaxLines: 2,
                    titleHeight: 1.2,
                    titleAlign: TextAlign.start,
                    titleColor: ColorManager.primary,
                    fontWeightType: FontWeightType.bold,),

                  Row(
                    children: [
                      InkWell(
                        onTap: () => setState(() => count++),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: ColorManager.primaryWithOpacity
                                  .withOpacity(.5),
                              borderRadius: BorderRadius.circular(AppSize.s10)),
                          child: const Icon(Icons.add,
                              color: ColorManager.primary, size: AppSize.s20),
                        ),
                      ),
                      const AppSizeBox(width: AppSize.s10,),
                      AppText(
                        title: '${count}',
                        titleSize: FontSize.s16,
                        titleMaxLines: 2,
                        titleAlign: TextAlign.center,
                        titleColor: ColorManager.text,
                        fontWeightType: FontWeightType.bold,
                      ),
                      const AppSizeBox(width: AppSize.s10,),
                      InkWell(
                        onTap: () =>count<=1?null:
                        setState(() => count++),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: ColorManager.primaryWithOpacity
                                  .withOpacity(.5),
                              borderRadius: BorderRadius.circular(AppSize.s10)),
                          child: const Icon(Icons.remove,
                              color: ColorManager.primary, size: AppSize.s20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
          ],
        )
      ),
    );
  }
}
