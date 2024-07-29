import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/image_manager.dart';

import '../../../../app/contants.dart';
import '../../../../app/enums.dart';
import '../../../../app/utils.dart';
import '../../../../utilites/color_manager.dart';
import '../../../../utilites/font_manager.dart';
import '../../../../utilites/styles_manager.dart';
import '../home_imports.dart';





class AuctionButton extends StatelessWidget {
  final  HomeData homeData;
  final  Function(bool) onTap;
  const AuctionButton({super.key,required this.homeData,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:Constants.isArabic? Alignment.bottomRight:Alignment.bottomLeft,
      child: Container(
        width: 120,
        height: 40,
        decoration: Utils.returnDropdownButtonDecoration(ColorManager.primary,
          ColorManager.primary,10),
        margin:  EdgeInsets.only(bottom: 80,right: 10,left: 10),
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: ValueListenableBuilder(valueListenable: homeData.showAuctionOnMap,
            builder: (context, value, child) => value?
            InkWell(
              splashColor: ColorManager.white,
              highlightColor:ColorManager.white ,
              onTap: ()=>onTap(false) ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                      title:'all'.tr(),
                      // title:'advertisements'.tr(),
                      titleAlign: TextAlign.start,
                      titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                      titleSize: FontSize.s14,titleColor: ColorManager.white)
                ],

              ),
            )
                :InkWell(
              splashColor: ColorManager.white,
              highlightColor:ColorManager.white ,
              onTap: ()=>onTap(true) ,
              child: Row(
                children: [

                  CircleAvatar(
                    radius: 16,
                    backgroundColor: ColorManager.white,
                    child: SvgPicture.asset(ImageManager.auctionSvg,height: 18,width: 18,color:ColorManager.primary ,),
                  ),
                  const AppSizeBox(width: 8,),
                  AppText(
                      title:'Auctions'.tr(),
                      titleAlign: TextAlign.start,
                      titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                      titleSize: FontSize.s14,titleColor: ColorManager.white)
                ],

              ),
            ),),
      ),
    );
  }
}

