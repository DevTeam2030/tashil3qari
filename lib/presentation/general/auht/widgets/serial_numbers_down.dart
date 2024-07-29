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

import '../../../../app/contants.dart';
import '../../../../domain/model/models/home_catogery_model.dart';
import '../../../../domain/model/models/searial_number_model.dart';
import '../select_serial_screen.dart';




class SerialNumbersDropdownButton extends StatefulWidget {
  final  Function(SerialNumberModel selectedCategory) onChanged;
  final SerialNumberModel? selectedSerialNumber;
const SerialNumbersDropdownButton({Key? key,required this.onChanged,required this.selectedSerialNumber,}) : super(key: key);

  @override
  State<SerialNumbersDropdownButton> createState() => _SerialNumbersDropdownButtonState();
}

class _SerialNumbersDropdownButtonState extends State<SerialNumbersDropdownButton> {
  double width=1.0.sw;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ()async{
          var data=await   Navigator.push(context, MaterialPageRoute(builder: (context) =>  SelectSerialScreen(selectedSerialNumber: widget.selectedSerialNumber,)));
          if(data!=null&&data is SerialNumberModel) widget.onChanged(data);
        },
      child: Container(
        width: width,
        height: AppSize.s45,

        decoration:Utils.returnDropdownButtonDecoration(
           ColorManager.textGrey,ColorManager.white,RadiusManager.r8
        ),
        padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p12,vertical: 8),

        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
                title:widget.selectedSerialNumber!=null?widget.selectedSerialNumber!.serialNumber: 'ChooseSerialNumber'.tr(),
                titleAlign: TextAlign.start,
                titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                titleSize: FontSize.s10,titleColor: ColorManager.icons),

            Icon(Icons.arrow_forward_ios,color: ColorManager.icons,size: AppSize.s18,)
          ],
        )
        // child: DropdownButtonHideUnderline(
        //   child: DropdownButton2<SerialNumberModel>(
        //     isExpanded: true,
        //     isDense: true,
        //     value: selectedSerialNumber,
        //     underline: const AppSizeBox(height: 0),
        //     hint:   Row(
        //       children: [
        //         // Icon(
        //         //   Icons.location_on,
        //         //   color: ColorManager.icons,
        //         //   size: 16,
        //         // ),
        //         // AppSizeBox(
        //         //   width: 4,
        //         // ),
        //         AppText(
        //             title: 'ChooseSerialNumber'.tr(),
        //             titleAlign: TextAlign.start,
        //             titleMaxLines: 1,fontWeightType: FontWeightType.medium,
        //             titleSize: FontSize.s10,titleColor: ColorManager.icons),
        //       ],
        //     ),
        //
        //     items: serialNumbers.map((SerialNumberModel type) => DropdownMenuItem<SerialNumberModel>(
        //       value: type,
        //       child:  AppText(
        //           title: type.serialNumber,
        //           titleAlign: TextAlign.start,
        //           titleMaxLines: 2,fontWeightType: FontWeightType.medium,
        //           titleSize: FontSize.s14,
        //           titleColor: type.booked?ColorManager.red:ColorManager.icons)
        //     ))
        //         .toList(),
        //     onChanged: (value) {
        //       if(value==null||value==selectedSerialNumber||value.booked)return;
        //       setState(() {
        //         selectedSerialNumber = value;
        //       });
        //       widget.onChanged(value);
        //     },
        //     buttonStyleData: ButtonStyleData(
        //       height: 50,
        //       width: .9.sw,
        //       padding: const EdgeInsets.symmetric(horizontal: 10),
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(14),
        //         border: Border.all(
        //           color: ColorManager.textGrey,
        //         ),
        //         color:ColorManager.textGrey,
        //       ),
        //       // elevation: 2,
        //     ),
        //
        //     iconStyleData: const IconStyleData(
        //       icon:Icon(Icons.arrow_drop_down_sharp,
        //         color: ColorManager.icons,size: AppSize.s20,),
        //       iconSize: 14,
        //       iconEnabledColor: Colors.yellow,
        //       iconDisabledColor: Colors.grey,
        //     ),
        //     dropdownStyleData: DropdownStyleData(
        //       maxHeight: 200,
        //       width: width,
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(8),
        //         color: ColorManager.textGrey,
        //       ),
        //       offset: const Offset(4, -10),
        //       scrollbarTheme: ScrollbarThemeData(
        //         thumbColor: MaterialStateProperty.all(ColorManager.primary),
        //         radius: const Radius.circular(40),
        //         thickness: MaterialStateProperty.all(3),
        //         thumbVisibility: MaterialStateProperty.all(true),
        //       ),
        //     ),
        //     menuItemStyleData: const MenuItemStyleData(
        //       height: 40,
        //       padding: EdgeInsets.only(left: 14, right: 14),
        //     ),
        //   ),
        // ),
      ),
    );


  }
}
