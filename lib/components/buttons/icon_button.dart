import 'package:flutter/material.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';


class CustomIconButton extends StatelessWidget {
  const CustomIconButton({Key? key,
    required this.onPressed, this.titleSize,this.titleColor,
    required this.title,this.content,this.fontWeightType=FontWeightType.medium}) : super(key: key);
  final String title;
  final double? titleSize;
  final Color? titleColor;
  final Widget? content;
  final Function onPressed;
  final  FontWeightType? fontWeightType;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>onPressed(),
      child: Container(
        width: AppSize.s38,
        height: AppSize.s38,
        decoration:Utils.returnDropdownButtonDecoration(),
        child:content?? AppText(title:title,
                   titleColor:titleColor??ColorManager.primary ,titleMaxLines: 1,
            fontWeightType:fontWeightType ,
                   titleSize:titleSize),
      ),
    );
  }
}
