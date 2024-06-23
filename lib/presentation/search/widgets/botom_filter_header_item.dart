import 'package:flutter/material.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/domain/model/popular_cat_model.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class BottomFilterHeaderItem extends StatelessWidget {
final  Function onPressed;
final  PopularCatModel popularCatModel;
final bool isSelected;
  const BottomFilterHeaderItem({Key? key,
    required this.popularCatModel,required this.onPressed,required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: AppSize.s45,
      height: AppSize.s35,
      padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p8,),
      margin: const EdgeInsets.symmetric(horizontal: MarginManager.m2,
        vertical: MarginManager.m4,),
      // constraints: BoxConstraints(
      //   minWidth: AppSize.s50,
      //   maxWidth: .4.sw
      // ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RadiusManager.r10),
        border: Border.all(color: isSelected?ColorManager.primary:ColorManager.textGrey),
        // color:isSelected?ColorManager.primary: ColorManager.textFormFieldFillColor,
      ),
      child: InkWell(
        onTap: ()=>onPressed(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle_outline,
                size: AppSize.s20,
                color:isSelected?ColorManager.primary:ColorManager.textGrey  ),
            const AppSizeBox(width: AppSize.s2,),
            AppText(title:popularCatModel.name,titleAlign: TextAlign.center,
                titleColor:isSelected?ColorManager.primary:ColorManager.textGrey ,
                titleMaxLines: 1,
                titleSize:FontSize.s14),
          ],
        ),
      ),
    );
  }
}
