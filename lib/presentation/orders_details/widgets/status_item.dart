import 'package:flutter/material.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class StatusItem extends StatelessWidget {
  final String status;
  final String date;
  final bool isActive;
  final bool isLast;
  const StatusItem({super.key,required this.status,
    required this.isActive,required this.date, this.isLast=false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: AppSize.s100,
                child: AppText(title:date,
                  titleSize: FontSize.s14,
                  titleMaxLines: 2,
                  titleHeight: 1.2,
                  titleAlign: TextAlign.start,
                  titleColor: isActive?ColorManager.reviewBorder:ColorManager.mySeparator,
                  fontWeightType: FontWeightType.medium,),
              ),
            ],
          ),
        ),
        Column(
          children: [
            CircleAvatar(
              radius: RadiusManager.r10,
              backgroundColor: isActive?ColorManager.reviewBorder:ColorManager.mySeparator,
            ),
            if(isLast==false)
            Container(
              height: AppSize.s40,
              width: AppSize.s1_5,
              color:  isActive?ColorManager.reviewBorder:ColorManager.mySeparator,
            ),
          ],
        ),
        const AppSizeBox(width: AppSize.s6,),
        Expanded(
          flex: 1,
          child: AppText(title:status,
            titleSize: FontSize.s16,
            titleMaxLines: 2,
            titleHeight: 1.2,
            titleAlign: TextAlign.start,
            titleColor: isActive?ColorManager.text:ColorManager.mySeparator,
            fontWeightType: FontWeightType.bold,),
        ),


      ],
    );
  }
}
