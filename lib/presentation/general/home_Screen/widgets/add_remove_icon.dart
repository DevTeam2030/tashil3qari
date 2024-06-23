import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/extentions.dart';

import '../../../../app/enums.dart';
import '../../../../utilites/color_manager.dart';
import '../../../../utilites/font_manager.dart';
import '../../../../utilites/styles_manager.dart';
import '../../../../utilites/values_manager.dart';

class AddRemoveIcon extends StatelessWidget {
  final IconData iconData;
  final Function() onTap;
  const AddRemoveIcon({
    Key? key,
   required this.iconData,
   required this.onTap,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>onTap(),
      child: Container(

        width: 22,
        height: 22,
        alignment: Alignment.center,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RadiusManager.r6),
          color:ColorManager.primary,
          // boxShadow: Constants.kBoxShadow
        ),

        child: Icon(iconData,color: ColorManager.white,size: 22,)
      ),
    );
  }


}
