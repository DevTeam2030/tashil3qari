import 'package:flutter/material.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class TabItem extends StatelessWidget {
  final String title;
  final Function() onTap;
  final bool isSelected;
  const TabItem({super.key, required this.title, required this.onTap, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: .3.sw,
      child: InkWell(
        onTap: ()=>onTap(),
        child: Column(
          children: [

            AppText(
                title:title,
                titleAlign: TextAlign.start,
                titleColor:isSelected?ColorManager.primary: ColorManager.drawerInActive,
                titleMaxLines: 2,
                titleHeight: 1.1,
                fontWeightType: FontWeightType.medium,
                titleSize: FontSize.s14),
            const AppSizeBox(height: AppSize.s10,),
            if(isSelected==true)
              const Divider(
                height: 2,
                thickness: 1.3,
                color: ColorManager.primary,
              )
          ],
        ),
      ),
    );
  }
}
