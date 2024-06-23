import 'package:flutter/material.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class BackAppBarButton extends StatelessWidget {
  final Color? backGroundColor;
  final Function? onBackTap;
  const BackAppBarButton({Key? key,this.backGroundColor,this.onBackTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>onBackTap==null?Navigator.pop(context):onBackTap!(),
      child:  Container(
        height: 38,
        width: 38,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:backGroundColor?? ColorManager.textGrey,
          // borderRadius: BorderRadius.circular(AppSize.s12)
        ),
        child: const Icon(Icons.arrow_back_ios_rounded,
            color: ColorManager.icons,size: AppSize.s18),
      ),
    );
  }
}
