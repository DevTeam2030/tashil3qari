import 'package:flutter/material.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class DrawerAppBarButton extends StatelessWidget {
  final Color? backGroundColor;
  final Function? onTap;
  const DrawerAppBarButton({Key? key,this.backGroundColor,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(onTap!=null)onTap!();
      },
      child:  Container(
        height: 38,
        width: 38,
        decoration: BoxDecoration(
          color:backGroundColor?? ColorManager.primaryWithOpacity.withOpacity(.5),
          borderRadius: BorderRadius.circular(AppSize.s12)
        ),
        child: Center(
          child: const Icon(Icons.menu,
              color: ColorManager.primary,size: AppSize.s25),
        ),
      ),
    );
  }
}
