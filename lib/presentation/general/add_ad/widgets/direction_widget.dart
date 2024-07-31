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


class DirectionDropdownButton extends StatefulWidget {
    final ValueNotifier<String>  notifier;
  final    List<String>directions;
  const DirectionDropdownButton({Key? key,required this.notifier,required this.directions,}) : super(key: key);

  @override
  State<DirectionDropdownButton> createState() => _DirectionDropdownButtonState();
}

class _DirectionDropdownButtonState extends State<DirectionDropdownButton> {


  List<String>directions=[];
  String? selectedDirection;
  @override
  void initState() {
    super.initState();
    selectedDirection=widget.notifier.value;
    directions=widget.directions;
  }
double width=1.0.sw;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: widget.notifier,
      builder: (context, value, child) => Container(
        width: width,
        height: AppSize.s50,
        decoration:Utils.returnDropdownButtonDecoration(
            ColorManager.textGrey,ColorManager.textGrey,RadiusManager.r8,

        ),
        // padding: EdgeInsets.symmetric(horizontal: PaddingManager.p4),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            // isExpanded: true,
            isDense: true,
            value: selectedDirection,
            underline: const AppSizeBox(height: 0),
            hint:   AppText(
                title:  'direction'.tr(),
                titleAlign: TextAlign.start,
                titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                titleSize: FontSize.s14,titleColor: ColorManager.textField),
            customButton:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                      title:'direction'.tr() +' : ' +selectedDirection.toString().tr(),
                      titleAlign: TextAlign.start,
                      titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                      titleSize: FontSize.s14,titleColor: ColorManager.textField),

                  Icon(Icons.arrow_drop_down_sharp,
                    color: ColorManager.textField,size: AppSize.s30,),
                ],
              ),
            ),
            items: directions.map((String item) => DropdownMenuItem<String>(
                value: item,
                child:  Row(
                  children: [
                    AppText(
                        title: item.tr(),
                        titleAlign: TextAlign.start,
                        titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                        titleSize: FontSize.s14,titleColor:item==selectedDirection?ColorManager.primary: ColorManager.textField),
                  ],
                )
            ))
                .toList(),
            onChanged: (value) {
              selectedDirection = value;
              widget.notifier.value=value!;

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
      ));


  }
}




