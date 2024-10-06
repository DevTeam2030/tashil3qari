// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:tashil_agary/app/enums.dart';
// import 'package:tashil_agary/app/extentions.dart';
// import 'package:tashil_agary/utilites/color_manager.dart';
// import 'package:tashil_agary/utilites/font_manager.dart';
// import 'package:tashil_agary/utilites/image_manager.dart';
// import 'package:tashil_agary/utilites/styles_manager.dart';
// import 'package:tashil_agary/utilites/values_manager.dart';
//
// class LottieItem extends StatelessWidget {
//   const LottieItem({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  SizedBox(
//       height: AppSize.s200.h,
//       width:1.0.sw,
//       child: Stack(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(RadiusManager.r10),
//             child: Image.asset(
//               ImageManager.product2,
//               height: AppSize.s200.h,
//               width:1.0.sw,
//               // borderRadius:  BorderRadius.circular(RadiusManager.r8),
//               fit: BoxFit.fill,
//             ),
//           ),
//           Lottie.asset('assets/celebrate.json',fit: BoxFit.fill,
//             height: AppSize.s200.h,
//             width:1.0.sw,
//             repeat: true,
//             reverse: true,
//             frameRate: FrameRate(60),
//           ),
//           Align(
//             alignment: Alignment.center,
//             child: RichText(
//               textAlign: TextAlign.center,
//               text:  TextSpan(
//                 text:"WeCreate".tr(),
//                 style:getAppTextStyle(titleColor: ColorManager.orange,
//                     titleSize:FontSize.s24,underline: false),
//
//                 children: [
//                   TextSpan(
//                     text:'you celebrate'.tr(),
//                     style: getAppTextStyle(titleColor: ColorManager.white,
//                         fontWeightType: FontWeightType.bold,
//                         titleSize:FontSize.s24,underline: false),
//
//                   ),
//
//                 ],
//               ),
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }
