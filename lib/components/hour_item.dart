import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/components/check_icon.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/calender_manager.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class HourItem extends StatelessWidget {
  final bool isSelected;
  final String hour;
  const HourItem({Key? key,required this.hour,required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p4,vertical: PaddingManager.p4),
      child: Stack(
        children: [
          Column(
            children: [
              const AppSizeBox(height: AppSize.s10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(title:  CalenderManager.getHourName(time: hour),
                    titleSize: FontSize.s14,
                    titleMaxLines: 1,
                    titleAlign: TextAlign.start,
                    titleColor: ColorManager.text,
                    fontWeightType: FontWeightType.bold,
                  ),
                  Icon(Icons.arrow_forward_ios,color: ColorManager.black,size: AppSize.s16,)
                ],
              ),
              const AppSizeBox(height: AppSize.s14,),
              const Divider(
                height: 2,
                thickness: 1.3,
                color: ColorManager.starGryColor,
              )
            ],
          ),

          if(isSelected)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CheckIcon(primaryColor: ColorManager.primary, fillColor: ColorManager.white)
              ],
            )
        ],
      ),
    );
  }
}


