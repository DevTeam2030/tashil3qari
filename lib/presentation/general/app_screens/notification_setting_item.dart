import 'package:flutter/material.dart';

import '../../../app/enums.dart';
import '../../../components/size_box_height.dart';
import '../../../utilites/color_manager.dart';
import '../../../utilites/font_manager.dart';
import '../../../utilites/styles_manager.dart';
import '../../../utilites/values_manager.dart';

class NotificationSettingItem extends StatelessWidget {
  final bool value;
  final Function(bool newValue) onChanged;
  final String title;
  final String des;
  const NotificationSettingItem({super.key,required this.value,required this.title,required this.des,required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return    Column(
      children: [
        const AppSizeBox(height: AppSize.s18,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: AppText(title: title,
                titleSize: FontSize.s16,
                titleMaxLines: 3,
                titleHeight: 1.3,
                titleAlign: TextAlign.start,
                titleColor: ColorManager.primary,
                fontWeightType: FontWeightType.bold,
              ),
            ),
            const AppSizeBox(width: AppSize.s10,),
            Expanded(
                flex: 1,
                child: Transform.scale(
                  scale: 1,
                  child: Switch(
                    value:value,
                    activeTrackColor: ColorManager.textFormFieldFillColor,
                    activeColor: ColorManager.selectedColor,
                    onChanged: (v)=>onChanged(v),
                  ),
                )
            ),
          ],
        ),
        // const AppSizeBox(height: AppSize.s10,),
        Row(
          children: [
            Expanded(
              child: AppText(title: des,
                titleSize: FontSize.s14,
                titleMaxLines: 3,
                titleHeight: 1.3,
                titleAlign: TextAlign.start,
                titleColor: ColorManager.text,
                fontWeightType: FontWeightType.regular,
              ),
            ),
          ],
        ),
        const AppSizeBox(height: AppSize.s10,),
        const Divider(
          height: 2,
          thickness: 1.2,
          color: ColorManager.starGryColor,
        ),
      ],
    );
  }
}
