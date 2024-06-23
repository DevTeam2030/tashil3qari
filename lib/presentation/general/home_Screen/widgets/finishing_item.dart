import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/extentions.dart';

import '../../../../app/contants.dart';
import '../../../../app/enums.dart';
import '../../../../components/size_box_height.dart';
import '../../../../domain/model/models/finishing_types_model.dart';
import '../../../../providers/home_provider.dart';
import '../../../../utilites/color_manager.dart';
import '../../../../utilites/font_manager.dart';
import '../../../../utilites/styles_manager.dart';
import '../../../../utilites/values_manager.dart';
import 'add_remove_icon.dart';

class FinishingItem extends StatelessWidget {
  final ValueNotifier<FinishingTypesModel>  notifier;
  final bool enabled ;
  const FinishingItem({
    Key? key,
   required this.notifier,
    this.enabled=true
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AppSizeBox(height: 0,width: 0,);
    

      // ValueListenableBuilder(valueListenable: notifier,
      //   builder: (context, value, child) => Container(
      //
      //     // margin: EdgeInsets.only(top: 110),
      //     padding: const EdgeInsets.symmetric(
      //         vertical: PaddingManager.p12, horizontal: PaddingManager.p16),
      //     width: 1.0.sw,
      //     // height: 45,
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(RadiusManager.r12),
      //       color:ColorManager.textGrey,
      //       // boxShadow: Constants.kBoxShadow
      //     ),
      //
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         AppText(
      //           title: 'Finishing'.tr()+' :',
      //           titleSize: FontSize.s16,
      //           titleAlign: TextAlign.start,
      //           titleColor:
      //           ColorManager.black,
      //           fontWeightType: FontWeightType.regular,
      //         ),
      //
      //         const AppSizeBox(width: 10,),
      //
      //         Expanded(
      //           child: Wrap(
      //             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: Constants.settingModel.finishingTypes.map((e) =>  Padding(
      //               padding: const EdgeInsets.all(6),
      //               child: InkWell(
      //                 onTap: () {
      //                   FocusScope.of(context).requestFocus( FocusNode());
      //                   if(enabled){
      //                     notifier.value = e;
      //                   }
      //                 },
      //                 child: Row(
      //                   mainAxisSize: MainAxisSize.min,
      //                   children: [
      //                      CircleAvatar(
      //                       radius: 5,
      //                       backgroundColor: notifier.value == e?ColorManager.primary:ColorManager.grey,
      //                       child: CircleAvatar(
      //                         radius:4,
      //                         backgroundColor:notifier.value == e?ColorManager.primary: ColorManager.textGrey,
      //                       ),
      //                     ),
      //
      //                     const AppSizeBox(width: 4,),
      //                     AppText(
      //                       title: e.name,
      //                       titleSize: FontSize.s12,
      //                       titleAlign: TextAlign.start,
      //                       titleColor:
      //                       ColorManager.black,
      //                       fontWeightType: FontWeightType.regular,
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),).toList(),
      //           ),
      //         ),
      //
      //
      //
      //       ],
      //     ),
      //   ),);

  }


}
