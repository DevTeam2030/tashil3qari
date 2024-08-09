import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/extentions.dart';

import '../../../../app/enums.dart';
import '../../../../components/size_box_height.dart';
import '../../../../utilites/color_manager.dart';
import '../../../../utilites/font_manager.dart';
import '../../../../utilites/styles_manager.dart';
import '../../../../utilites/values_manager.dart';
import 'add_remove_icon.dart';

class SwitchItem extends StatelessWidget {
  final ValueNotifier<bool>  notifier;
  final EdgeInsetsGeometry? padding;
  final String title,addTitleIfTrue,addTitleIFFalse;
  const SwitchItem({
    Key? key,
   required this.title,
   required this.notifier,
    this.addTitleIfTrue='',
    this.addTitleIFFalse='',
    this.padding
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: notifier,
        builder: (context, value, child) => Container(

          // margin: EdgeInsets.only(top: 110),
          padding:padding?? const EdgeInsets.symmetric(vertical: PaddingManager.p10, horizontal: PaddingManager.p16),
          width: 1.0.sw,
          height: 45,
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(RadiusManager.r12),
            // color:ColorManager.review,
            border: Border(
              bottom: BorderSide(
                color: ColorManager.textGrey,
                width: 1,
              ),
            ),
            // boxShadow: Constants.kBoxShadow
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                title: '$title :${value ? addTitleIfTrue : addTitleIFFalse}',
                titleSize: FontSize.s16,
                titleAlign: TextAlign.start,
                titleColor:
                ColorManager.black,
                fontWeightType: FontWeightType.regular,
              ),

             Transform.scale(
               scaleY: .8,
               scaleX: .9,
               child: Switch(value: value,
                   // inactiveThumbColor: ColorManager.white,
                   activeColor: ColorManager.primary,
                   onChanged: (v)=>notifier.value=v,),
             ),
            ],
          ),
        ),);

  }


}
