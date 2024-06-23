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


class RealStateAddCountryDropdownButton extends StatefulWidget {
  final  Function(CityCountryModel? v) onSelectedCity;
  final    List<CityCountryModel>selectedCities;
  final    CountryModel selectedCountry;
  const RealStateAddCountryDropdownButton({Key? key,required this.onSelectedCity,required this.selectedCities,
    required this.selectedCountry,}) : super(key: key);

  @override
  State<RealStateAddCountryDropdownButton> createState() => _RealStateAddCountryDropdownButtonState();
}

class _RealStateAddCountryDropdownButtonState extends State<RealStateAddCountryDropdownButton> {


  List<CityCountryModel>cities=[];
  CityCountryModel? selectedCity;
  @override
  void initState() {

    super.initState();
    for(var item in widget.selectedCountry.cities){
      if(!widget.selectedCities.contains(item)) {
        cities.add(CityCountryModel(id: item.id,name: item.name,countryId: widget.selectedCountry.id));
      }
    }

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
        child: DropdownButton2<CityCountryModel>(
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
                        title: 'Please select city'.tr(),
                        // title: widget.selectedCountry.name,
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
          items: cities
              .map((CityCountryModel city) => DropdownMenuItem<CityCountryModel>(
            value: city,
            child:  Row(
              children: [
                CircleAvatar(
                  radius: 8,
                  backgroundColor: ColorManager.textField,
                  child: CircleAvatar(
                    radius: 7,
                    backgroundColor:widget.selectedCities.where((element) => element.id==city.id).toList().isNotEmpty?ColorManager.primary: ColorManager.white,
                  ),
                ),
                const AppSizeBox(width: 6,),
                AppText(
                    title: city.name,
                    titleAlign: TextAlign.start,
                    titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                    titleSize: FontSize.s14,titleColor: ColorManager.textField),
              ],
            )
          ))
              .toList(),
          onChanged: (value) {
              // selectedCountry = value;
              widget.onSelectedCity(value);

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



// class RealStateAddCountryDropdownButton extends StatefulWidget {
//   final  Function(CountryModel? v) onAddCounty;
//   final    List<CountryModel>countries;
//   final    CountryModel selectedCountry;
//   const RealStateAddCountryDropdownButton({Key? key,required this.onAddCounty,required this.countries,
//     required this.selectedCountry,}) : super(key: key);
//
//   @override
//   State<RealStateAddCountryDropdownButton> createState() => _RealStateAddCountryDropdownButtonState();
// }
//
// class _RealStateAddCountryDropdownButtonState extends State<RealStateAddCountryDropdownButton> {
//
//
//
//   @override
//   void initState() {
//
//     super.initState();
//
//   }
//   double width=1.0.sw;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       height: AppSize.s50,
//       decoration:Utils.returnDropdownButtonDecoration(
//           ColorManager.textGrey,ColorManager.textGrey,RadiusManager.r8
//       ),
//       // padding: EdgeInsets.symmetric(horizontal: PaddingManager.p4),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton2<CountryModel>(
//           // isExpanded: true,
//           isDense: true,
//           value: widget.selectedCountry,
//           underline: const AppSizeBox(height: 0),
//           hint:   Row(
//             children: [
//               Icon(
//                 Icons.location_on,
//                 color: ColorManager.icons,
//                 size: 16,
//               ),
//               AppSizeBox(
//                 width: 4,
//               ),
//               AppText(
//                   title: 'AddYourSite'.tr(),
//                   titleAlign: TextAlign.start,
//                   titleMaxLines: 1,fontWeightType: FontWeightType.medium,
//                   titleSize: FontSize.s14,titleColor: ColorManager.textField),
//             ],
//           ),
//           customButton:  Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.location_on,
//                       color: ColorManager.icons,
//                       size: 16,
//                     ),
//                     AppSizeBox(
//                       width: 4,
//                     ),
//                     AppText(
//                         title: widget.selectedCountry.name,
//                         titleAlign: TextAlign.start,
//                         titleMaxLines: 1,fontWeightType: FontWeightType.medium,
//                         titleSize: FontSize.s14,titleColor: ColorManager.textField),
//                   ],
//                 ),
//
//                 Icon(Icons.arrow_drop_down_sharp,
//                   color: ColorManager.textField,size: AppSize.s30,),
//               ],
//             ),
//           ),
//           items: widget.countries
//               .map((CountryModel country) => DropdownMenuItem<CountryModel>(
//               value: country,
//               child:  AppText(
//                   title: country.name,
//                   titleAlign: TextAlign.start,
//                   titleMaxLines: 1,fontWeightType: FontWeightType.medium,
//                   titleSize: FontSize.s14,titleColor: ColorManager.textField)
//           ))
//               .toList(),
//           onChanged: (value) {
//             // selectedCountry = value;
//             widget.onAddCounty(value);
//
//           },
//           buttonStyleData: ButtonStyleData(
//             height: 50,
//             width: width,
//             padding: const EdgeInsets.only(left: 14, right: 14),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(
//                 color: ColorManager.textGrey,
//               ),
//               color:ColorManager.textGrey,
//             ),
//             // elevation: 2,
//           ),
//           iconStyleData: const IconStyleData(
//             icon:Icon(Icons.arrow_drop_down_sharp,
//               color: ColorManager.textField,size: AppSize.s30,),
//
//             iconSize: 14,
//             iconEnabledColor: Colors.yellow,
//             iconDisabledColor: Colors.grey,
//           ),
//           dropdownStyleData: DropdownStyleData(
//             maxHeight: 200,
//             width: .92.sw,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               color: ColorManager.textGrey,
//             ),
//             offset: const Offset(4, -10),
//             scrollbarTheme: ScrollbarThemeData(
//               thumbColor: MaterialStateProperty.all(ColorManager.primary),
//               radius: const Radius.circular(40),
//               thickness: MaterialStateProperty.all(3),
//               thumbVisibility: MaterialStateProperty.all(true),
//             ),
//           ),
//           menuItemStyleData: const MenuItemStyleData(
//             height: 40,
//             padding: EdgeInsets.only(left: 14, right: 14),
//           ),
//         ),
//       ),
//     );
//
//
//   }
// }
