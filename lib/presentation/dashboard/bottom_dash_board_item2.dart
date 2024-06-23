import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class DashBoardItem2 extends StatelessWidget {
  final String title,image;
  final bool isActive;
  final Function onTap;
  const DashBoardItem2({Key? key,required this.title,required this.image,required this.onTap,
    this.isActive=false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>onTap(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(image,height: 26,width: 26,color:isActive?ColorManager.primary:ColorManager.bottom ,),

          const AppSizeBox(height: AppSize.s2,),
          AppText(title: title,
            titleSize: FontSize.s12,
            titleMaxLines: 3,
            titleHeight: 1.3,
            titleAlign: TextAlign.center,
            titleColor:isActive? ColorManager.primary: ColorManager.bottom,
            fontWeightType: FontWeightType.bold,
          ),



        ],
      ),
    );
  }
}
