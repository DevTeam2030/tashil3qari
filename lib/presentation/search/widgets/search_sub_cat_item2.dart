import 'package:flutter/material.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/domain/model/model/home_main_category.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class SearchSubCatItem2 extends StatelessWidget {
  final HomeMainCategoryModel subCat;
  final Function(HomeMainCategoryModel cat) onTap;
  final bool isSelected;
  const SearchSubCatItem2({Key? key,required this.subCat,required this.onTap,required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>onTap(subCat),
      child: Container(
        height: AppSize.s200,
        width: .24.sw,
        margin: const EdgeInsets.all(2),
        clipBehavior: Clip.antiAliasWithSaveLayer,
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(RadiusManager.r12),
       // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(RadiusManager.r12)),
     ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Image.asset(
              subCat.image,
              // height: 40,
              fit: BoxFit.cover,
            ),

            const AppSizeBox(height: 6,),
            Flexible(
              child: AppText(title:  subCat.name, titleSize: FontSize.s14,
                titleMaxLines: 2,
                titleHeight: 1.2,
                titleAlign: TextAlign.center,
                titleColor:isSelected?ColorManager.primary: ColorManager.black,
                fontWeightType: FontWeightType.medium,),
            ),
            const AppSizeBox(height: 6,),
            if(isSelected)
            CircleAvatar(radius: RadiusManager.r4,
            backgroundColor: ColorManager.primary,)
          ],
        ),
      ),
    );
  }
}
