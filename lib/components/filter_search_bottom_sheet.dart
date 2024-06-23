import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';


class FilterProductsDropdownButton extends StatefulWidget {
  final  Function(String? v) onChanged;
  const FilterProductsDropdownButton({Key? key,required this.onChanged}) : super(key: key);

  @override
  State<FilterProductsDropdownButton> createState() => _FilterProductsDropdownButtonState();
}

class _FilterProductsDropdownButtonState extends State<FilterProductsDropdownButton> {

  String? selectedFilter;
  List<String>filterList=[
    "Our Picks".tr(),
    "Top Related".tr(),
    "PriceLowToHight".tr(),
    "PriceHightToLow".tr(),
    "ProductNameAZ".tr(),
    "ProductNameZA".tr()
  ];
  @override
  void initState() {
    super.initState();

  }
double width=150;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: AppSize.s40,
      decoration:Utils.returnDropdownButtonDecoration(),
      // padding: EdgeInsets.symmetric(horizontal: PaddingManager.p4),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          value: selectedFilter,
          underline: const AppSizeBox(height: 0),
          hint:   AppText(
              title: 'SortBy'.tr(),
              titleAlign: TextAlign.start,
              titleMaxLines: 1,fontWeightType: FontWeightType.regular,
              titleSize: FontSize.s14,titleColor: ColorManager.black),

          items: filterList
              .map((String filter) => DropdownMenuItem<String>(
            value: filter,
            child:  AppText(
                title: filter,
                titleAlign: TextAlign.start,
                titleMaxLines: 1,fontWeightType: FontWeightType.regular,
                titleSize: FontSize.s14,titleColor: ColorManager.black)
          ))
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedFilter = value;
            });
          },
          buttonStyleData: ButtonStyleData(
            height: 50,
            width: 160,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: ColorManager.searchGrey,
              ),
              color:ColorManager.searchGrey,
            ),
            // elevation: 2,
          ),
          iconStyleData: const IconStyleData(
            icon:Icon(Icons.arrow_drop_down_sharp,
              color: ColorManager.green,size: AppSize.s30,),
            iconSize: 14,
            iconEnabledColor: Colors.yellow,
            iconDisabledColor: Colors.grey,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorManager.searchGrey,
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

      Container(
      width: AppSize.s38,
      height: AppSize.s38,
      decoration:Utils.returnDropdownButtonDecoration(),
      padding: EdgeInsets.symmetric(horizontal: PaddingManager.p4),
      child: DropdownButton<String>(
        isDense: false,
        value: selectedFilter,
        borderRadius: BorderRadius.circular(AppSize.s10),

        underline: const AppSizeBox(height: 0),
        hint:   AppText(
            title: 'SortBy'.tr(),
            titleAlign: TextAlign.start,
            titleMaxLines: 1,fontWeightType: FontWeightType.regular,
            titleSize: FontSize.s14,titleColor: ColorManager.black),

        // Down Arrow Icon
        icon:const Icon(Icons.arrow_drop_down_sharp,
          color: ColorManager.green,size: AppSize.s30,),
        elevation: 4,
        isExpanded: false,
        // Array list of items
        items: filterList.map((String filter) {
          return DropdownMenuItem(
            value: filter,
            child:  AppText(
                title: filter,
                titleAlign: TextAlign.start,
                titleMaxLines: 1,fontWeightType: FontWeightType.regular,
                titleSize: FontSize.s14,titleColor: ColorManager.black),
          );
        }).toList(),
        // After selecting the desired option,it will
        // change button value to selected value
        onChanged: (String? newValue) {

          if(newValue==null)return;
          selectedFilter = newValue;
          setState(() {});

        },
      ),
    );
  }
}
