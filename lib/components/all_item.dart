import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class AllItem extends StatelessWidget {
  final Function onTap;
  final bool showAll;
  const AllItem({Key? key,required this.onTap,required this.showAll}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showAll?InkWell(
      onTap: ()=>onTap(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.add,size: AppSize.s14,color: ColorManager.allColor),

          AppText(title:'all'.tr(), titleSize: FontSize.s16,
            titleMaxLines: 1,
            titleColor: ColorManager.allColor,
            fontWeightType: FontWeightType.regular,),


        ],
      ),
    ):const AppSizeBox(width: 0,);
  }
}
