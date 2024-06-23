import 'package:flutter/material.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';


class MyTextButton extends StatelessWidget {
  const MyTextButton({Key? key,
    required this.onPressed, this.titleSize,this.titleColor,this.radius,
    required this.title, this.size,this.primaryColor,this.content,this.borderColor,this.fontWeightType=FontWeightType.medium}) : super(key: key);
  final String title;
  final double? titleSize;
  final double? radius;
  final Color? titleColor;
  final Widget? content;
  final Function onPressed;
  final Size? size;
  final Color? primaryColor;
  final Color? borderColor;
  final  FontWeightType? fontWeightType;


  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      style: TextButton.styleFrom(
        fixedSize: size ?? Size( .77.sw,  50),
        foregroundColor:primaryColor?? ColorManager.white,
        backgroundColor:primaryColor?? ColorManager.white ,
        shape: RoundedRectangleBorder(
          side:  BorderSide(color:borderColor??(primaryColor?? ColorManager.grey )),
          borderRadius: BorderRadius.circular(radius??RadiusManager.r8),
        ),
      ),
      child:content?? AppText(title:title,
                 titleColor:titleColor??ColorManager.primary ,titleMaxLines: 1,
          fontWeightType:fontWeightType ,
                 titleSize:titleSize),
    );
  }
}
