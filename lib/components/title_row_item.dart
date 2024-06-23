import 'package:flutter/material.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/calender_manager.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class TitleItem extends StatelessWidget {
  final String title;
  final bool? showDivider;
  final Function onTap;
  const TitleItem({Key? key,required this.title,required this.onTap,this.showDivider=true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>onTap(),
      child: Column(
        children: [
          const AppSizeBox(height: AppSize.s14,),
          Padding(
            padding: const EdgeInsets.symmetric( horizontal:PaddingManager.p16,
                // vertical: PaddingManager.p18
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(title: title,
                  titleSize: FontSize.s16,
                  titleMaxLines: 1,
                  titleAlign: TextAlign.start,
                  titleColor: ColorManager.text,
                  fontWeightType: FontWeightType.regular,
                ),
                Icon(Icons.arrow_forward_ios,color: ColorManager.black,size: AppSize.s16,)
              ],
            ),
          ),
          const AppSizeBox(height: AppSize.s14,),
          if(showDivider==true)
          const Divider(
            height: 2,
            thickness: 1.3,
            color: ColorManager.starGryColor,
          )
        ],
      ),
    );
  }
}
