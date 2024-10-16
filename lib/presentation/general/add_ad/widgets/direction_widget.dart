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
import '../../../../domain/model/models/country_model.dart';


class DirectionDropdownButton extends StatefulWidget {
    final ValueNotifier<List<String>>  notifier;
  final    List<String>directions;
  const DirectionDropdownButton({super.key,required this.notifier,required this.directions,

  });

  @override
  State<DirectionDropdownButton> createState() => _DirectionDropdownButtonState();
}

class _DirectionDropdownButtonState extends State<DirectionDropdownButton> {

  final ValueNotifier<bool> open=ValueNotifier(false);
  List<String>directions=[];
  List<String> selectedDirections=[];
  @override
  void initState() {
    super.initState();
    selectedDirections=widget.notifier.value;
    directions=widget.directions;
  }
double width=1.0.sw;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: widget.notifier,
      builder: (context, value, child) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              open.value=!open.value;
              FocusScope.of(context).requestFocus( FocusNode());

            },
            child: Container(
                width: width,
                // height: AppSize.s50,
                padding: EdgeInsets.symmetric(horizontal: PaddingManager.p10,vertical: 12),
                decoration:Utils.returnDropdownButtonDecoration(
                  ColorManager.textGrey,ColorManager.textGrey,RadiusManager.r8,
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: AppText(
                      title:  '${'direction'.tr()} : ${selectedDirections.map((e) => e.tr()).join(' - ')}' ,
                      titleAlign: TextAlign.start,
                      titleMaxLines: 4,fontWeightType: FontWeightType.medium,
                      titleSize: FontSize.s14,titleColor: ColorManager.textField),
                ),

                Icon(Icons.arrow_drop_down_sharp, color: ColorManager.textField,size: AppSize.s30,),
              ],
            ),),
          ),

          ValueListenableBuilder(
            valueListenable: open,
            builder: (context, value, child) => !value?const AppSizeBox(height: 0,):AnimatedContainer(
              duration:  const Duration(milliseconds: 500),
              margin: const EdgeInsets.only(top: 10,),
              padding: const EdgeInsets.symmetric(vertical: PaddingManager.p10, horizontal: PaddingManager.p16),
              width: 1.0.sw,
              // height: value ? 280 : 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(RadiusManager.r12),
                border: Border.all(color: ColorManager.grey, width: 1),
                color: ColorManager.textGrey,
                // boxShadow: Constants.kBoxShadow
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  for(var dir in directions)

                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: InkWell(
                        onTap: () {
                          // if(widget.fromSearch){
                          //   selectedDirections=[dir];
                          //   widget.notifier.value=selectedDirections;
                          //   open.value=false;
                          //   setState(() {});
                          //   return;
                          // }
                          if(selectedDirections.contains(dir)){
                            selectedDirections.remove(dir);
                          }else{
                            selectedDirections.add(dir);
                          }

                          widget.notifier.value=selectedDirections;
                             setState(() {});
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              title: dir.tr(),
                              titleSize: FontSize.s14,
                              titleAlign: TextAlign.start,
                              titleHeight: 1.4,
                              titleMaxLines: 4,
                              titleColor: ColorManager.black,
                              fontWeightType: FontWeightType.medium,
                            ),

                            Icon(selectedDirections.contains(dir)?Icons.check_circle:Icons.circle_outlined,
                              color: ColorManager.primary,size: AppSize.s25,)
                          ],
                        ),
                      ),
                    ),


                ],
              ),
            ),
          ),


          // for(var item in value)
          // Padding(
          //   padding:  EdgeInsets.only(bottom:value.isEmpty?0:8.0),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: Container(
          //           width: width,
          //           height: AppSize.s50,
          //           decoration:Utils.returnDropdownButtonDecoration(
          //               ColorManager.textGrey,ColorManager.textGrey,RadiusManager.r8,
          //
          //           ),
          //           // padding: EdgeInsets.symmetric(horizontal: PaddingManager.p4),
          //           child: DropdownButtonHideUnderline(
          //             child: DropdownButton2<String>(
          //               // isExpanded: true,
          //               isDense: true,
          //               value: item,
          //               underline: const AppSizeBox(height: 0),
          //               hint:   AppText(
          //                   title:  'direction'.tr(),
          //                   titleAlign: TextAlign.start,
          //                   titleMaxLines: 1,fontWeightType: FontWeightType.medium,
          //                   titleSize: FontSize.s14,titleColor: ColorManager.textField),
          //               customButton:  Padding(
          //                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     AppText(
          //                         title:'direction'.tr() +' : ' +item.tr(),
          //                         titleAlign: TextAlign.start,
          //                         titleMaxLines: 1,fontWeightType: FontWeightType.medium,
          //                         titleSize: FontSize.s14,titleColor: ColorManager.textField),
          //
          //                     Icon(Icons.arrow_drop_down_sharp,
          //                       color: ColorManager.textField,size: AppSize.s30,),
          //                   ],
          //                 ),
          //               ),
          //               items: directions.map((String item) => DropdownMenuItem<String>(
          //                   value: item,
          //                   child:  Row(
          //                     children: [
          //                       AppText(
          //                           title: item.tr(),
          //                           titleAlign: TextAlign.start,
          //                           titleMaxLines: 1,fontWeightType: FontWeightType.medium,
          //                           titleSize: FontSize.s14,titleColor:item==item?ColorManager.primary: ColorManager.textField),
          //                     ],
          //                   )
          //               ))
          //                   .toList(),
          //               onChanged: (value) {
          //
          //                 selectedDirections[selectedDirections.indexOf(item)]=value!;
          //                 widget.notifier.value=selectedDirections;
          //                 // selectedDirection = value;
          //                 // widget.notifier.value=value!;
          //
          //               },
          //               buttonStyleData: ButtonStyleData(
          //                 height: 50,
          //                 width: width,
          //                 padding: const EdgeInsets.only(left: 14, right: 14),
          //                 decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(8),
          //                   border: Border.all(
          //                     color: ColorManager.textGrey,
          //                   ),
          //                   color:ColorManager.textGrey,
          //                 ),
          //                 // elevation: 2,
          //               ),
          //               iconStyleData: const IconStyleData(
          //                 icon:Icon(Icons.arrow_drop_down_sharp,
          //                   color: ColorManager.textField,size: AppSize.s30,),
          //
          //                 iconSize: 14,
          //                 iconEnabledColor: Colors.yellow,
          //                 iconDisabledColor: Colors.grey,
          //               ),
          //               dropdownStyleData: DropdownStyleData(
          //                 maxHeight: 200,
          //                 width: .92.sw,
          //                 decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(8),
          //                   color: ColorManager.textGrey,
          //                 ),
          //                 offset: const Offset(4, -10),
          //                 scrollbarTheme: ScrollbarThemeData(
          //                   thumbColor: MaterialStateProperty.all(ColorManager.primary),
          //                   radius: const Radius.circular(40),
          //                   thickness: MaterialStateProperty.all(3),
          //                   thumbVisibility: MaterialStateProperty.all(true),
          //                 ),
          //               ),
          //               menuItemStyleData: const MenuItemStyleData(
          //                 height: 40,
          //                 padding: EdgeInsets.only(left: 14, right: 14),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //
          //       if(value.length>1&&!widget.fromSearch)
          //       Row(
          //         children: [
          //           AppSizeBox(width: 6,),
          //           InkWell(
          //               onTap: (){
          //                 selectedDirections.remove(item);
          //                 widget.notifier.value=selectedDirections;
          //                 setState(() {});
          //
          //               },
          //               child: Icon(Icons.remove_circle_outline,color:  ColorManager.primary,)),
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          //
          //
          // if(value.length<4&&!widget.fromSearch)
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //
          //     InkWell(
          //         onTap: (){
          //           selectedDirections.add(Constants.directions.first);
          //           widget.notifier.value=selectedDirections;
          //           setState(() {});
          //
          //         },
          //         child: Icon(Icons.add_circle_outline,color:  ColorManager.primary,)),
          //   ],
          // ),


        ],
      ));


  }

  // Widget build(BuildContext context) {
  //   return ValueListenableBuilder(valueListenable: widget.notifier,
  //       builder: (context, value, child) => Column(
  //         children: [
  //           for(var item in value)
  //             Padding(
  //               padding:  EdgeInsets.only(bottom:value.isEmpty?0:8.0),
  //               child: Row(
  //                 children: [
  //                   Expanded(
  //                     child: Container(
  //                       width: width,
  //                       height: AppSize.s50,
  //                       decoration:Utils.returnDropdownButtonDecoration(
  //                         ColorManager.textGrey,ColorManager.textGrey,RadiusManager.r8,
  //
  //                       ),
  //                       // padding: EdgeInsets.symmetric(horizontal: PaddingManager.p4),
  //                       child: DropdownButtonHideUnderline(
  //                         child: DropdownButton2<String>(
  //                           // isExpanded: true,
  //                           isDense: true,
  //                           value: item,
  //                           underline: const AppSizeBox(height: 0),
  //                           hint:   AppText(
  //                               title:  'direction'.tr(),
  //                               titleAlign: TextAlign.start,
  //                               titleMaxLines: 1,fontWeightType: FontWeightType.medium,
  //                               titleSize: FontSize.s14,titleColor: ColorManager.textField),
  //                           customButton:  Padding(
  //                             padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //                             child: Row(
  //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                               children: [
  //                                 AppText(
  //                                     title:'direction'.tr() +' : ' +item.tr(),
  //                                     titleAlign: TextAlign.start,
  //                                     titleMaxLines: 1,fontWeightType: FontWeightType.medium,
  //                                     titleSize: FontSize.s14,titleColor: ColorManager.textField),
  //
  //                                 Icon(Icons.arrow_drop_down_sharp,
  //                                   color: ColorManager.textField,size: AppSize.s30,),
  //                               ],
  //                             ),
  //                           ),
  //                           items: directions.map((String item) => DropdownMenuItem<String>(
  //                               value: item,
  //                               child:  Row(
  //                                 children: [
  //                                   AppText(
  //                                       title: item.tr(),
  //                                       titleAlign: TextAlign.start,
  //                                       titleMaxLines: 1,fontWeightType: FontWeightType.medium,
  //                                       titleSize: FontSize.s14,titleColor:item==item?ColorManager.primary: ColorManager.textField),
  //                                 ],
  //                               )
  //                           ))
  //                               .toList(),
  //                           onChanged: (value) {
  //
  //                             selectedDirections[selectedDirections.indexOf(item)]=value!;
  //                             widget.notifier.value=selectedDirections;
  //                             // selectedDirection = value;
  //                             // widget.notifier.value=value!;
  //
  //                           },
  //                           buttonStyleData: ButtonStyleData(
  //                             height: 50,
  //                             width: width,
  //                             padding: const EdgeInsets.only(left: 14, right: 14),
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(8),
  //                               border: Border.all(
  //                                 color: ColorManager.textGrey,
  //                               ),
  //                               color:ColorManager.textGrey,
  //                             ),
  //                             // elevation: 2,
  //                           ),
  //                           iconStyleData: const IconStyleData(
  //                             icon:Icon(Icons.arrow_drop_down_sharp,
  //                               color: ColorManager.textField,size: AppSize.s30,),
  //
  //                             iconSize: 14,
  //                             iconEnabledColor: Colors.yellow,
  //                             iconDisabledColor: Colors.grey,
  //                           ),
  //                           dropdownStyleData: DropdownStyleData(
  //                             maxHeight: 200,
  //                             width: .92.sw,
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(8),
  //                               color: ColorManager.textGrey,
  //                             ),
  //                             offset: const Offset(4, -10),
  //                             scrollbarTheme: ScrollbarThemeData(
  //                               thumbColor: MaterialStateProperty.all(ColorManager.primary),
  //                               radius: const Radius.circular(40),
  //                               thickness: MaterialStateProperty.all(3),
  //                               thumbVisibility: MaterialStateProperty.all(true),
  //                             ),
  //                           ),
  //                           menuItemStyleData: const MenuItemStyleData(
  //                             height: 40,
  //                             padding: EdgeInsets.only(left: 14, right: 14),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //
  //                   if(value.length>1&&!widget.fromSearch)
  //                     Row(
  //                       children: [
  //                         AppSizeBox(width: 6,),
  //                         InkWell(
  //                             onTap: (){
  //                               selectedDirections.remove(item);
  //                               widget.notifier.value=selectedDirections;
  //                               setState(() {});
  //
  //                             },
  //                             child: Icon(Icons.remove_circle_outline,color:  ColorManager.primary,)),
  //                       ],
  //                     )
  //                 ],
  //               ),
  //             ),
  //
  //
  //           if(value.length<4&&!widget.fromSearch)
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.end,
  //               children: [
  //
  //                 InkWell(
  //                     onTap: (){
  //                       selectedDirections.add(Constants.directions.first);
  //                       widget.notifier.value=selectedDirections;
  //                       setState(() {});
  //
  //                     },
  //                     child: Icon(Icons.add_circle_outline,color:  ColorManager.primary,)),
  //               ],
  //             ),
  //
  //
  //         ],
  //       ));
  //
  //
  // }
}




