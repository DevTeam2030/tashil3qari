import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';

class TitleRow extends StatelessWidget {
  final String title;
  final Widget? otherWidget;
  const TitleRow({Key? key,required this.title,required this.otherWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(title:title, titleSize: FontSize.s18,
          titleMaxLines: 1,
          titleColor: ColorManager.text,
          fontWeightType: FontWeightType.bold,),

        
        if(otherWidget!=null)
          otherWidget!
      ],
    );
  }
}
