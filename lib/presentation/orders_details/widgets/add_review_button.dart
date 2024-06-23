//
//
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:tashil_agary/components/buttons/text_button.dart';
// import 'package:tashil_agary/utilites/color_manager.dart';
//
// import '../../../utilites/font_manager.dart';
// import '../../../utilites/values_manager.dart';
//
// class AddReviewButton extends StatelessWidget {
//   // final OrderDetailsData orderDetailsData;
//   // const BuildEvaluationServiceButton({super.key,required this.orderDetailsData});
//   const AddReviewButton({super.key,});
//
//   @override
//   Widget build(BuildContext context) {
//     return     Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         MyTextButton(
//             title: 'AddToCart'.tr(),
//             primaryColor: ColorManager.primary,
//             radius: RadiusManager.r10,
//             size: Size(.5.sw, 45),
//             titleColor: ColorManager.white,
//             titleSize: FontSize.s16,
//             fontWeightType: FontWeightType.bold,
//             onPressed: () {
//               if(widget.onTap!=null){
//                 widget.onTap!();
//                 return;
//               }
//               if(widget.productDetails.options.isNotEmpty){
//                 Utils.showModalBottomSheetApp(widget:ProductOptionsBottomSheet(productDetails: widget.productDetails,
//                   productCount:  productCount,));
//               }else {
//                 gotoIntro(currentIndexScreen: 1,context: context);
//               }
//
//             }),
//       ],
//     );
//   }
// }
