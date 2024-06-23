import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class RadioWidget extends StatelessWidget {
  final String title;
  final int value;
  final int selectedValue;
final  Function(int? v) onchange;
 const RadioWidget({Key? key,required this.title,required this.value,
   required this.onchange,required this.selectedValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onchange(value),
      child: Row(
        children: [

          SizedBox(
            width: AppSize.s30.w,
            child: CircleAvatar(
              backgroundColor: selectedValue==value?ColorManager.primary:ColorManager.grey,
              radius: RadiusManager.r10,
              child:  CircleAvatar(
                backgroundColor: ColorManager.white,
                radius: RadiusManager.r8,
                child:  CircleAvatar(
                  backgroundColor: selectedValue==value?ColorManager.primary:ColorManager.grey,
                  radius: RadiusManager.r4,

                )
              ),
            )
          ),
          // SizedBox(
          //   width: AppSize.s30.w,
          //   child: Theme(
          //     data: Theme.of(context).copyWith(
          //         unselectedWidgetColor:ColorManager.primary ,
          //         disabledColor: ColorManager.secondary),
          //     child: Radio(
          //       activeColor: ColorManager.secondary,
          //       // title:titleWidget,
          //       // regularTextStyle(
          //       //   title:title,
          //       //   color: ColorManager.primary,
          //       //   maxLines: 1,
          //       //   fontSize: FontSize.s14,
          //       //   textAlign: TextAlign.start,),
          //       value: value,
          //       groupValue: groupValue,
          //       onChanged: (bool? v ) =>onchange(v),
          //     ),
          //   ),
          // ),

          AppText(
              title: title,
              titleAlign: TextAlign.start,
              titleColor: selectedValue==value?ColorManager.primary:ColorManager.grey,
              titleMaxLines: 1,
              titleHeight: 1.1,
              fontWeightType: FontWeightType.regular,
              titleSize: FontSize.s16),
         ],
      ),
    );
  }
}
