import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/extentions.dart';

import '../../../../app/enums.dart';
import '../../../../components/size_box_height.dart';
import '../../../../utilites/color_manager.dart';
import '../../../../utilites/font_manager.dart';
import '../../../../utilites/styles_manager.dart';
import '../../../../utilites/values_manager.dart';

class BarTitleValue extends StatelessWidget {
  final String title,subtitle;
  final double? width;
  const BarTitleValue({super.key,required this.title,required this.subtitle, this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            AppText(title:title,
                titleSize: FontSize.s18,
                titleColor: ColorManager.text,
                fontWeightType: FontWeightType.bold),
          ],

        ),
        const AppSizeBox(height: AppSize.s6),
        SizedBox(
          width: width??0.9.sw,
          child: AppText(title: subtitle,
            titleSize: FontSize.s12,
            titleMaxLines: 3,
            titleAlign: TextAlign.start,
            titleColor: ColorManager.notificationsBody,
            // titleColor: ColorManager.grey,
          ),
        ),
      ],
    );
  }
}
