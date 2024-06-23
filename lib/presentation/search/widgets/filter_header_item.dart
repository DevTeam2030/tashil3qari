import 'package:flutter/material.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/domain/model/model/home_main_category.dart';
import 'package:tashil_agary/domain/model/popular_cat_model.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class FilterHeaderItem extends StatelessWidget {
final  Function onPressed;
final  HomeMainCategoryModel cat;
final  HomeMainCategoryModel? selectedCatModel;
  const FilterHeaderItem({Key? key,required this.cat,required this.onPressed,required this.selectedCatModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>onPressed(),
      child: Container(
        // width: AppSize.s45,
        height: AppSize.s50,
        padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p8,
            vertical: PaddingManager.p4),
        margin: const EdgeInsets.symmetric(horizontal: MarginManager.m4,),
        // constraints: BoxConstraints(
        //   minWidth: AppSize.s50,
        //   maxWidth: .4.sw
        // ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RadiusManager.r10),
          border: Border.all(color: selectedCatModel==cat?ColorManager.primary:ColorManager.textGrey),
          color:selectedCatModel==cat?ColorManager.primary: ColorManager.white,
        ),
        child: Center(
          child: AppText(title:cat.name,titleAlign: TextAlign.center,
              titleColor:selectedCatModel==cat?ColorManager.white: ColorManager.textGrey ,
              titleMaxLines: 1,
              titleSize:FontSize.s14),
        ),
      ),
    );
  }
}
