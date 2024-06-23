import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/presentation/search/search_screen.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/route_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

import '../../utilites/calender_manager.dart';

class DateButton extends StatelessWidget {
  final DateTime? date;
  final Color? iconColor;
  final Function() onTap;
  const DateButton({Key? key,required this.onTap,required this.date,this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.0.sw,
      height: AppSize.s45,
      padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p12,),
      decoration: Utils.returnDropdownButtonDecoration(ColorManager.searchGrey.withOpacity(.4),
        ColorManager.searchGrey.withOpacity(.4),),
      child: InkWell(
        onTap: ()=>onTap(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            AppText(title: '${'Date'.tr()} ${date!=null?CalenderManager.getDateName(date: date!):''}',
              titleSize: FontSize.s14,
              titleMaxLines: 1,
              titleColor: ColorManager.text,
              titleAlign: TextAlign.start,
              fontWeightType: FontWeightType.regular,),

             Icon(Icons.calendar_month,color:iconColor?? ColorManager.primary,size: AppSize.s25,),

          ],
        ),
      ),
    );
  }
}
