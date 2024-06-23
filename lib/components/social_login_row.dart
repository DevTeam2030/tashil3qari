import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/components/screen_loading.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class SocialLoginRow extends StatelessWidget {
 final String image;
  final String title;
 final bool isConnected;
 final bool isLastItem;
  final Function onTap;
  const SocialLoginRow(
      {Key? key,
      required this.image,
        required this.title ,
         this.isLastItem=false ,
        required this.isConnected ,
        required  this.onTap ,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: AppSize.s45,
                  height: AppSize.s45,
                  padding: const EdgeInsets.all(PaddingManager.p6),
                  margin: const EdgeInsets.symmetric(vertical: MarginManager.m8 ),
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                      border: Border.all(color: ColorManager.textFormFieldFillColor),
                      borderRadius:BorderRadius.circular(RadiusManager.r8),
                  ),
                  child:  Image.asset(image,width: AppSize.s25,),
                ),
                const AppSizeBox(width: AppSize.s6,),
                AppText(title:title,
                    titleColor:ColorManager.titleServiceNameColor,
                    titleMaxLines: 1,
                    titleSize:FontSize.s14),
              ],
            ),


            InkWell(
              onTap: ()=>onTap(),
              child: AppText(title:isConnected?'DisConnected'.tr():'Connected'.tr(),
                  titleColor:isConnected?ColorManager.red:ColorManager.primary,
                  titleMaxLines: 1,
                  fontWeightType: FontWeightType.medium,
                  titleSize:FontSize.s14),
            ),
          ],
        ),


        if(!isLastItem)
          const Divider(
            height: 2,
            thickness: 1.3,
            color: ColorManager.starGryColor,
          )
      ],
    );
  }
}
