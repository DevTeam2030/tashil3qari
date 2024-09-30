import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';
import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
final  bool checkBoxValue;
final  String title;
final  Widget? child;
final  Function(bool? isRemeber) checkBoxFunction;
  const CheckBoxWidget({Key? key,required this.checkBoxValue,required this.checkBoxFunction,this.title='',this.child}) : super(key: key);

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>   widget.checkBoxFunction(!widget.checkBoxValue),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 2),
            width: 20,
            height: 20,
            child: Checkbox(
                value: widget.checkBoxValue,
                onChanged: (isRemember){
                  //print(isRemember.toString());
                  widget.checkBoxFunction(!widget.checkBoxValue);
                },
                activeColor: ColorManager.primary,
                checkColor: ColorManager.white,
                splashRadius: 26,
                side:  const BorderSide(color: ColorManager.starGryColor,style: BorderStyle.solid,width: 2)),
          ),

          const AppSizeBox(width: AppSize.s8,),
          widget.child??
              AppText(title: widget.title, titleSize: FontSize.s16,
                  titleAlign: TextAlign.start,titleHeight: 1.2,
                  titleMaxLines: 1,titleColor: ColorManager.black),
        ],
      ),
    );
  }
}
