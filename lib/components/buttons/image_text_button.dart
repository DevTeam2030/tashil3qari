import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';


class MyImageTextButton extends StatelessWidget {
  const MyImageTextButton({Key? key,
    required this.image,required this.onPressed}) : super(key: key);

  final String image;
  final Function() onPressed;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p4),
      child: InkWell(
        onTap: ()=>onPressed(),
        child: image.contains('.svg')?
        SvgPicture.asset(image,width: AppSize.s35,height: AppSize.s35,):
        Image.asset(image,width: AppSize.s35,height: AppSize.s35,),
      ),
    );
  }
}
