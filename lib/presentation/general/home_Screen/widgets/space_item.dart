import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import '../../../../app/enums.dart';
import '../../../../app/validator.dart';
import '../../../../components/text_field/text_field_imports.dart';
import '../../../../utilites/color_manager.dart';
import '../../../../utilites/font_manager.dart';
import '../../../../utilites/styles_manager.dart';
import '../../../../utilites/values_manager.dart';

class SpaceItem extends StatelessWidget {
  final TextEditingController spaceController ;
  final String title ,subTitle;
  final bool enabled,isSpaceOptional ;
  final Color? color ;
  const SpaceItem({
    Key? key,
   required this.spaceController,
   required this.title,
   required this.subTitle,
    this.color,
    this.enabled =true,
    this.isSpaceOptional =false
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(

      // margin: EdgeInsets.only(top: 110),
      padding: const EdgeInsets.symmetric(
          vertical: PaddingManager.p10, horizontal: PaddingManager.p16),
      width: 1.0.sw,
      // height: 45,
      constraints: BoxConstraints(
        minHeight: 45,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RadiusManager.r12),
        color:color??ColorManager.textGrey,
        // boxShadow: Constants.kBoxShadow
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            title: title+' :',
            titleSize: FontSize.s16,
            titleAlign: TextAlign.start,
            titleColor:
            ColorManager.black,
            fontWeightType: FontWeightType.regular,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
               width: 80,
                height: 35,
                child:     DefaultTextFormField(
                  controller: spaceController,
                  enabled: enabled,
                  hintTitle: title,
                  labelTitle: title,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.number,
                  hintFontSize: FontSize.s12,
                  hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                  textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                  textSize: FontSize.s12,
                  fillColor: ColorManager.white,
                  borderColor: ColorManager.white,
                  borderRadius: RadiusManager.r10,
                  validator: (v) =>
                  isSpaceOptional&&v.toString().isEmpty?null:
                      Validator().validateSpace(value: v.toString(),message: 'required'.tr()),
                ),),
              const AppSizeBox(width: 4,),
              AppText(
                title: subTitle,
                titleSize: FontSize.s14,
                titleAlign: TextAlign.end,
                titleColor:
                ColorManager.black,
                fontWeightType: FontWeightType.regular,
              ),
            ],
          )
        ],
      ),
    );

  }


}
