import 'package:flutter/material.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/calender_manager.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class DayItem extends StatelessWidget {
  final DateTime dateTime;
  final bool isSelected;
  final Function onTap;
  const DayItem({Key? key,required this.dateTime,required this.isSelected,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppSize.s120.h,
        width: AppSize.s64,
        margin: const EdgeInsets.symmetric(horizontal: MarginManager.m6,),
        // padding: EdgeInsets.symmetric(horizontal: PaddingManager.p10,),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(RadiusManager.r10),
            border: Border.all(color:isSelected ?ColorManager.primary:ColorManager.reviewGrey ),
            color:isSelected ?ColorManager.primary:ColorManager.white
        ),
      child: InkWell(
        onTap: ()=>onTap(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(title: CalenderManager.getDayName(date: dateTime),
              titleSize: FontSize.s14,
              titleMaxLines: 2,
              titleAlign: TextAlign.center,
              titleColor: isSelected ?ColorManager.white:ColorManager.black,
              fontWeightType: FontWeightType.regular,
            ),
            const AppSizeBox(height: AppSize.s10,),
            AppText(title: dateTime.day.toString(),
              titleSize: FontSize.s14,
              titleMaxLines: 2,
              titleAlign: TextAlign.center,
              titleColor: isSelected ?ColorManager.white:ColorManager.black,
              fontWeightType: FontWeightType.bold,
            ),
          ],
        ),
      ),
    );
  }
}
