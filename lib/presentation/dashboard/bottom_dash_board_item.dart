import 'package:flutter/material.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class DashBoardItem extends StatelessWidget {
  final String title;
  final IconData iconsData;
  final Function onTap;
  final bool isCurrentPage;
  const DashBoardItem({Key? key,required this.title,required this.onTap,
    required this.iconsData,this.isCurrentPage=false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: ()=>onTap(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 38,
              width: 38,
              decoration: BoxDecoration(
                  color:isCurrentPage? ColorManager.primaryWithOpacity.withOpacity(.5):ColorManager.transparent,
                  borderRadius: BorderRadius.circular(AppSize.s12)
              ),
              child:  Icon(iconsData,
                  color:isCurrentPage? ColorManager.primary: ColorManager.drawerInActive,
                  size:AppSize.s20),
            ),
            const AppSizeBox(height: AppSize.s2,),
            AppText(title: title,
              titleSize: FontSize.s12,
              titleMaxLines: 3,
              titleHeight: 1.3,
              titleAlign: TextAlign.center,
              titleColor:isCurrentPage? ColorManager.primary: ColorManager.drawerInActive,
              fontWeightType: FontWeightType.bold,
            ),



          ],
        ),
      ),
    );
  }
}
