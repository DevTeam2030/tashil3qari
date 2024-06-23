import 'package:flutter/material.dart';
import 'package:tashil_agary/app/extentions.dart';

import '../../app/enums.dart';
import '../../utilites/color_manager.dart';
import '../../utilites/font_manager.dart';
import '../../utilites/styles_manager.dart';
import '../../utilites/values_manager.dart';

class NotificationTab extends StatelessWidget {
  final Function() onTap;
  final String title;
  final bool isSelected;

  const NotificationTab({super.key,required this.onTap,required this.title,required this.isSelected,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>onTap(),
      child: Container(
        height: 35,
        width: .29.sw,
        // padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(RadiusManager.r12),
            color: isSelected?ColorManager.primary:ColorManager.textGrey
          // boxShadow: Constants.kBoxShadow
        ),
        child: AppText(
            title: title,
            titleAlign: TextAlign.center,
            titleMaxLines: 1,fontWeightType: FontWeightType.medium,
            titleSize: FontSize.s10,
            titleColor: isSelected?ColorManager.white:ColorManager.black),
      ),
    );
  }
}
