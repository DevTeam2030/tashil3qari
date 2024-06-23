// part of'widgets_imports.dart';
//
//
// class AdAdvertiserData extends StatelessWidget {
//   final EditAdData editAdData;
//   const AdAdvertiserData({super.key,required this.editAdData});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Container(
//       width: 1.0.sw,
//       padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 14),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           AppText(
//             title:'Property owner data'.tr(),
//             titleMaxLines: 2,
//             titleHeight: 1.3,
//             titleSize: FontSize.s16,
//             titleAlign: TextAlign.start,
//             titleColor: ColorManager.black,
//             fontWeightType: FontWeightType.extraBold,
//           ),
//
//
//
//
//           Container(
//             margin: const EdgeInsets.symmetric(vertical: 8),
//             padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//             width: 1.0.sw,
//             // height: 140,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(RadiusManager.r14),
//               color: ColorManager.textGrey,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//
//                 Row(
//                   children: [
//                     CachedImage(
//                       url: editAdData.userAd.,
//                       height: 65,width: 65,
//                       fit: BoxFit.cover,
//                       boxShape: BoxShape.circle,
//                     ),
//
//                     const AppSizeBox(width: 10,),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const AppSizeBox(height: 3,),
//                         AppText(
//                             title: "صادق محمود زيدان",
//                             titleAlign: TextAlign.center,
//                             titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
//                             titleSize: FontSize.s14,titleColor: ColorManager.black),
//                         const AppSizeBox(height: 4,),
//                         Row(
//                           children: [
//                             AppText(
//                                 title: 'user'.tr() ,
//                                 titleAlign: TextAlign.start,
//                                 titleMaxLines: 1,fontWeightType: FontWeightType.medium,
//                                 titleSize: FontSize.s8,titleColor: ColorManager.textField),
//
//                             const AppSizeBox(width: 4,),
//                             Row(
//                               children: [
//                                 Icon(Icons.location_on,size: 12,color: ColorManager.black,),
//                                 AppText(
//                                     title: 'الرياض, جدة , الباحة' ,
//                                     titleAlign: TextAlign.start,
//                                     titleMaxLines: 1,fontWeightType: FontWeightType.medium,
//                                     titleSize: FontSize.s8,titleColor: ColorManager.textField),
//
//
//                               ],
//                             ),
//
//                           ],
//                         ),
//
//                         const AppSizeBox(height: 4,),
//
//                       ],
//                     ),
//                   ],
//                 ),
//
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       CallIcon(phoneNo: ''),
//                       const AppSizeBox(width: 4,),
//                       SvgPicture.asset(ImageManager.chatSvg),
//                       const AppSizeBox(width: 4,),
//                       SvgPicture.asset(ImageManager.whatsSvg),
//                       const AppSizeBox(width: 4,),
//                       SvgPicture.asset(ImageManager.messageSvg),
//
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//
//
//
//
//
//
//         ],
//       )
//     );
//   }
// }
