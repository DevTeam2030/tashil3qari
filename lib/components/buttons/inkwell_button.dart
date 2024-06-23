//
// import 'package:tashil_agary/components/size_box_height.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:tashil_agary/app/extentions.dart';
// import 'package:tashil_agary/utilites/color_manager.dart';
// import 'package:tashil_agary/utilites/font_manager.dart';
// import 'package:tashil_agary/utilites/styles_manager.dart';
// import 'package:tashil_agary/utilites/values_manager.dart';
//
// class InkwellButton extends StatelessWidget {
//   final String title;
//   final String image;
//  final Function onTap;
//   const InkwellButton({Key? key,required this.title,required this.image,required this.onTap}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return   Container(
//       height: .06.sh,
//       width: .8.sw,
//       margin: EdgeInsets.symmetric(vertical: MarginManager.m8.h),
//       decoration: BoxDecoration(
//           color: ColorManager.white,
//           borderRadius: BorderRadius.circular(RadiusManager.r8),
//           border: Border.all(color: ColorManager.primaryButtonColor)
//       ),
//       child: InkWell(
//         onTap: ()=>onTap(),
//         borderRadius:BorderRadius.circular(RadiusManager.r8),
//         splashColor: ColorManager.primaryButtonColor,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             AppSizeBox(width: AppSize.s25.w),
//
//             image.contains('.svg')?
//             SvgPicture.asset(image,
//               height: AppSize.s25.h,width: AppSize.s25.w,color: ColorManager.primaryButtonColor,):
//             Image.asset(image,height: AppSize.s35.h,width: AppSize.s35.w,),
//
//             AppSizeBox(width: AppSize.s20.w),
//             RegularTextStyle(title:title,
//               titleSize: FontSize.s14,titleAlign: TextAlign.center,
//               titleMaxLines: 1,titleColor: ColorManager.primaryButtonColor,),
//
//             // SvgPicture.asset(ImageManager.location,height: AppSize.s50.h,width: AppSize.s50.w,)
//           ],
//         ),
//       ))
//     ;
//   }
// }
