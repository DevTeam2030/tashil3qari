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


class CityDropDown extends StatefulWidget {
  final  Function(CityModel? v) onChanged;
  final  CityModel?  selectedCity;
  final List<CityModel> cities;
  const CityDropDown({Key? key,required this.onChanged,this.selectedCity,required this.cities}) : super(key: key);

  @override
  State<CityDropDown> createState() => _CityDropDownState();
}

class _CityDropDownState extends State<CityDropDown> {

  CityModel? selectedCity;
  @override
  void initState() {
    // selectedCity=widget.selectedCity;
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
        child: DropdownButton2<CityModel>(
          // isExpanded: true,
          isDense: true,
          value: selectedCity,
          underline: const AppSizeBox(height: 0),
          hint:   Row(
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
                  title: 'City'.tr(),
                  titleAlign: TextAlign.start,
                  titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                  titleSize: FontSize.s14,titleColor: ColorManager.textField),
            ],
          ),
          items: widget.cities
              .map((CityModel city) => DropdownMenuItem<CityModel>(
            value: city,
            child:  AppText(
                title: city.name,
                titleAlign: TextAlign.start,
                titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                titleSize: FontSize.s14,titleColor: ColorManager.textField)
          ))
              .toList(),
          onChanged: (value) {
              selectedCity = value;
              widget.onChanged(value);

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

    //   Container(
    //   width: AppSize.s38,
    //   height: AppSize.s38,
    //   decoration:Utils.returnDropdownButtonDecoration(),
    //   padding: EdgeInsets.symmetric(horizontal: PaddingManager.p4),
    //   child: DropdownButton<String>(
    //     isDense: false,
    //     value: selectedCity,
    //     borderRadius: BorderRadius.circular(AppSize.s10),
    //
    //     underline: const AppSizeBox(height: 0),
    //     hint:   AppText(
    //         title: 'SortBy'.tr(),
    //         titleAlign: TextAlign.start,
    //         titleMaxLines: 1,fontWeightType: FontWeightType.regular,
    //         titleSize: FontSize.s14,titleColor: ColorManager.black),
    //
    //     // Down Arrow Icon
    //     icon:const Icon(Icons.arrow_drop_down_sharp,
    //       color: ColorManager.green,size: AppSize.s30,),
    //     elevation: 4,
    //     isExpanded: false,
    //     // Array list of items
    //     items: filterList.map((String filter) {
    //       return DropdownMenuItem(
    //         value: filter,
    //         child:  AppText(
    //             title: filter,
    //             titleAlign: TextAlign.start,
    //             titleMaxLines: 1,fontWeightType: FontWeightType.regular,
    //             titleSize: FontSize.s14,titleColor: ColorManager.black),
    //       );
    //     }).toList(),
    //     // After selecting the desired option,it will
    //     // change button value to selected value
    //     onChanged: (String? newValue) {
    //
    //       if(newValue==null)return;
    //       selectedCity = newValue;
    //       setState(() {});
    //
    //     },
    //   ),
    // );
  }
}
