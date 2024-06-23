import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

import '../../../../domain/model/models/country_model.dart';



class CountryHomeDropdownButton extends StatefulWidget {
  final  Function(CountryModel? v) onAddCounty;
  final    List<CountryModel>countries;
  final    CountryModel selectedCountry;
  final     CityModel selectedCity;
  const CountryHomeDropdownButton({Key? key,required this.onAddCounty,required this.countries,
    required this.selectedCountry, required this.selectedCity,}) : super(key: key);

  @override
  State<CountryHomeDropdownButton> createState() => _CountryHomeDropdownButtonState();
}

class _CountryHomeDropdownButtonState extends State<CountryHomeDropdownButton> {



  @override
  void initState() {

    super.initState();

  }
  double width=1.0.sw;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: AppSize.s40,
      decoration:Utils.returnDropdownButtonDecoration(
          ColorManager.textGrey,ColorManager.grey,RadiusManager.r8
      ),
      // padding: EdgeInsets.symmetric(horizontal: PaddingManager.p4),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<CountryModel>(
          // isExpanded: true,
          isDense: true,
          value: widget.selectedCountry,
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
                  title: 'AddYourSite'.tr(),
                  titleAlign: TextAlign.start,
                  titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                  titleSize: FontSize.s14,titleColor: ColorManager.textField),
            ],
          ),
          customButton:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                        title: widget.selectedCountry.name+' , '+widget.selectedCity.name,
                        titleAlign: TextAlign.start,
                        titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                        titleSize: FontSize.s14,titleColor: ColorManager.textField),
                  ],
                ),

                Icon(Icons.arrow_drop_down_sharp,
                  color: ColorManager.textField,size: AppSize.s30,),
              ],
            ),
          ),
          items: widget.countries
              .map((CountryModel country) => DropdownMenuItem<CountryModel>(
              value: country,
              child:  AppText(
                  title: country.name,
                  titleAlign: TextAlign.start,
                  titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                  titleSize: FontSize.s14,titleColor: ColorManager.textField)
          ))
              .toList(),
          onChanged: (value) {
            // selectedCountry = value;
            widget.onAddCounty(value);

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
