import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

import '../../../../domain/model/models/searial_number_model.dart';


class NationalityDropdownButton extends StatefulWidget {
  final  Function( NationalityModel nationality) onChanged;
  final  NationalityModel nationality;

  const NationalityDropdownButton({Key? key,required this.onChanged,required this.nationality}) : super(key: key);

  @override
  State<NationalityDropdownButton> createState() => _NationalityDropdownButtonState();
}

class _NationalityDropdownButtonState extends State<NationalityDropdownButton> {


  List<NationalityModel>filterList=Constants.settingModel.nationalities;
  @override
  void initState() {
    super.initState();

  }
double width=1.0.sw;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: AppSize.s50,
      decoration:Utils.returnDropdownButtonDecoration(
          ColorManager.textGrey,ColorManager.textGrey,RadiusManager.r8
      ),
      // padding: EdgeInsets.symmetric(horizontal: PaddingManager.p4),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<NationalityModel>(
          // isExpanded: true,
          isDense: true,
          value: widget.nationality,
          underline: const AppSizeBox(height: 0),
          barrierDismissible: false,
          hint:   AppText(
              title: 'Nationality'.tr(),
              titleAlign: TextAlign.start,
              titleMaxLines: 1,fontWeightType: FontWeightType.medium,
              titleSize: FontSize.s14,titleColor: ColorManager.icons),

          items: filterList
              .map((NationalityModel filter) => DropdownMenuItem<NationalityModel>(
            value: filter,
            child:  AppText(
                title: filter.name,
                titleAlign: TextAlign.start,
                titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                titleSize: FontSize.s16,titleColor: ColorManager.icons)
          ))
              .toList(),
          onChanged: (value) {
              widget.onChanged(value!);

          },
          buttonStyleData: ButtonStyleData(
            height: 50,
            width: width,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: ColorManager.textGrey,
              ),
              color:ColorManager.textGrey,
            ),
            // elevation: 2,
          ),
          iconStyleData: const IconStyleData(
            icon:Icon(Icons.arrow_drop_down_sharp,
              color: ColorManager.textField,size: AppSize.s30,),
            iconSize: 14,
            iconEnabledColor: Colors.yellow,
            iconDisabledColor: Colors.grey,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            width: .92.sw,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorManager.textGrey,
            ),
            offset: const Offset(4, -10),
            scrollbarTheme: ScrollbarThemeData(
              thumbColor: MaterialStateProperty.all(ColorManager.primary),
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all(3),
              thumbVisibility: MaterialStateProperty.all(true),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.only(left: 14, right: 14),
          ),
        ),
      ),
    );


  }
}
