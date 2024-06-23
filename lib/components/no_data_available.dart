import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';

class NoDataCurrentlyAvailable extends StatelessWidget {
 final String? message;
 final Function? onTap;
  const NoDataCurrentlyAvailable({Key? key,this.message,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: (){
          if(onTap!=null)onTap!();
        },
        child: AppText(title:message??'NoDataCurrentlyAvailable'.tr(), titleSize: FontSize.s14,
          titleMaxLines: 14,
          titleHeight: 1.4,
          underline: onTap!=null,
          titleAlign: TextAlign.center,
          titleColor: ColorManager.titleServiceNameColor,
          fontWeightType: FontWeightType.bold,),
      ),
    );
  }
}
