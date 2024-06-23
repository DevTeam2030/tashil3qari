import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/components/check_icon.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData iconsData;
  final Function onTap;
  final bool isActive;
  final bool isCurrentPage;
  const DrawerItem({Key? key,required this.title,required this.onTap,
    required this.iconsData,required this.isActive,this.isCurrentPage=false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p16,
          vertical: PaddingManager.p8),
      child: InkWell(
        onTap: ()=>onTap(),
        child: Column(
          children: [
            Container(
              height: 38,
              width: 38,
              decoration: BoxDecoration(
                  color:isActive? ColorManager.primaryWithOpacity.withOpacity(.5):ColorManager.searchGrey,
                  borderRadius: BorderRadius.circular(AppSize.s12)
              ),
              child:  Icon(iconsData,
                  color:isActive? ColorManager.primary: ColorManager.drawerInActive,
                  size:isCurrentPage ?AppSize.s25:AppSize.s20),
            ),
            const AppSizeBox(height: AppSize.s4,),
            AppText(title: title,
              titleSize:isCurrentPage?FontSize.s14: FontSize.s12,
              titleMaxLines: 3,
              titleHeight: 1.3,
              titleAlign: TextAlign.center,
              titleColor:isActive? ColorManager.primary: ColorManager.drawerInActive,
              fontWeightType: FontWeightType.bold,
            ),
            if(isCurrentPage)
            const AppSizeBox(height: AppSize.s4,),
             if(isCurrentPage)
             CircleAvatar(
              backgroundColor: isActive? ColorManager.primary: ColorManager.drawerInActive,
              radius: 3,
            )

          ],
        ),
      ),
    );
  }
}


