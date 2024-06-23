import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/domain/model/models/country_model.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';


class SelectedCityWidget extends StatelessWidget {
  final  Function() onRemove;
  final CityCountryModel city;
  const SelectedCityWidget({super.key,required this.city,required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return   Container(
        margin: EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(vertical: PaddingManager.p10, horizontal: PaddingManager.p16),
        width: 1.0.sw,
        // height: value ? 280 : 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RadiusManager.r12),
          border: Border.all(color: ColorManager.grey, width: 1),
          color: ColorManager.textGrey,
          // boxShadow: Constants.kBoxShadow
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on,
                  color: ColorManager.icons,
                  size: 16,
                ),
                AppSizeBox(
                  width: 4,
                ),
                AppText(
                  title: city.name,
                  titleSize: FontSize.s14,
                  titleAlign: TextAlign.start,
                  titleHeight: 1.4,
                  titleMaxLines: 4,
                  titleColor: ColorManager.black,
                  fontWeightType: FontWeightType.medium,
                ),

              ],
            ),

            InkWell(
              onTap: ()=>onRemove(),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(RadiusManager.r4),
                  color: ColorManager.transparent,
                  border: Border.all(color: ColorManager.icons, width: 1),
                ),
                child: Icon(
                  Icons.remove,
                  color: ColorManager.icons,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
      );
  }
}
