import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/extentions.dart';

import '../../../../app/enums.dart';
import '../../../../components/size_box_height.dart';
import '../../../../utilites/color_manager.dart';
import '../../../../utilites/font_manager.dart';
import '../../../../utilites/styles_manager.dart';
import '../../../../utilites/values_manager.dart';
import 'add_remove_icon.dart';

class PropertyItem extends StatelessWidget {
  final ValueNotifier<int>  notifier;
  final Color color;
  final String title;
  final bool enabled ;
  const PropertyItem({
    Key? key,
   required this.title,
   required this.notifier,
   required this.color,
    this.enabled=true,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: notifier,
        builder: (context, value, child) => Container(

          // margin: EdgeInsets.only(top: 110),
          padding: const EdgeInsets.symmetric(
              vertical: PaddingManager.p10, horizontal: PaddingManager.p16),
          width: 1.0.sw,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(RadiusManager.r12),
            color:color,
            // boxShadow: Constants.kBoxShadow
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                title: title+' :',
                titleSize: FontSize.s16,
                titleAlign: TextAlign.start,
                titleColor:
                ColorManager.black,
                fontWeightType: FontWeightType.regular,
              ),

              Row(
                children: [
                  AddRemoveIcon(iconData: Icons.remove,onTap: ()=>!enabled?null:notifier.value>0?notifier.value--:0,),


                  SizedBox(
                    width: 30,
                    child: AppText(
                      title: notifier.value.toString()  ,
                      titleSize: FontSize.s16,
                      titleAlign: TextAlign.center,
                      titleColor:
                      ColorManager.black,
                      fontWeightType: FontWeightType.medium,
                    ),
                  ),
                  AddRemoveIcon(iconData: Icons.add,onTap: ()=>!enabled?null:notifier.value++,),

                ],
              )
            ],
          ),
        ),);

  }


}
