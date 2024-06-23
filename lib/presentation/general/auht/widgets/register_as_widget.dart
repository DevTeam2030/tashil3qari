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


class RegisterAsDropdownButton extends StatefulWidget {
  final  Function( UserType userType) onChanged;
  final  UserType userType;
  final bool enable;
  const RegisterAsDropdownButton({Key? key,required this.onChanged,required this.userType,this.enable=true}) : super(key: key);

  @override
  State<RegisterAsDropdownButton> createState() => _RegisterAsDropdownButtonState();
}

class _RegisterAsDropdownButtonState extends State<RegisterAsDropdownButton> {


  List<String>filterList=[
    "user".tr(),
    "RealEstateConsultant".tr(),
  ];
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
        child: DropdownButton2<String>(
          // isExpanded: true,
          isDense: true,
          value: widget.userType==UserType.user?filterList.first:filterList.last,
          underline: const AppSizeBox(height: 0),
          barrierDismissible: false,
          hint:   AppText(
              title: 'Login as'.tr(),
              titleAlign: TextAlign.start,
              titleMaxLines: 1,fontWeightType: FontWeightType.medium,
              titleSize: FontSize.s14,titleColor: ColorManager.icons),

          items: filterList
              .map((String filter) => DropdownMenuItem<String>(
            value: filter,
            child:  AppText(
                title: filter,
                titleAlign: TextAlign.start,
                titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                titleSize: FontSize.s16,titleColor: ColorManager.icons)
          ))
              .toList(),
          onChanged: (value) {
              widget.onChanged(value==filterList.first?UserType.user:UserType.consultant);

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
    //     value: selectedFilter,
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
    //       selectedFilter = newValue;
    //       setState(() {});
    //
    //     },
    //   ),
    // );
  }
}
