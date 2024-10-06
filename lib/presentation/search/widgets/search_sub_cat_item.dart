// import 'package:flutter/material.dart';
// import 'package:tashil_agary/app/enums.dart';
// import 'package:tashil_agary/app/extentions.dart';
// import 'package:tashil_agary/components/cach_image.dart';
// import 'package:tashil_agary/components/size_box_height.dart';
// import 'package:tashil_agary/presentation/search/search_screen.dart';
// import 'package:tashil_agary/utilites/color_manager.dart';
// import 'package:tashil_agary/utilites/font_manager.dart';
// import 'package:tashil_agary/utilites/route_manager.dart';
// import 'package:tashil_agary/utilites/styles_manager.dart';
// import 'package:tashil_agary/utilites/values_manager.dart';
//
// import '../../../domain/model/model/sub_category.dart';
//
// class SubCatItem extends StatelessWidget {
//   final SubCategoryModel subCat;
//   const SubCatItem({Key? key,required this.subCat}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: (){
//         MyRoute().navigate(context: context, route:  SearchScreen(
//           cat: null,
//           subCat: subCat,
//           // cat: context.read<HomeProvider>().homeModel.homeCategories[1],
//           // haveSubCats: true,
//         ));
//       },
//       child: Container(
//         height: AppSize.s200,
//         margin: const EdgeInsets.all(2),
//         clipBehavior: Clip.antiAliasWithSaveLayer,
//      decoration: BoxDecoration(
//        borderRadius: BorderRadius.circular(RadiusManager.r12),
//        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(RadiusManager.r12)),
//      ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//
//             CachedImage(
//               url: subCat.image,
//               // url: 'https://shake.qa/wp-content/uploads/2015/12/product-2.jpg',
//               height: 110,
//               width: .3.sw,
//               fit: BoxFit.cover,
//             ),
//
//             const AppSizeBox(height: 6,),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal:PaddingManager.p8),
//               child: AppText(title:subCat.name, titleSize: FontSize.s14,
//                 titleMaxLines: 2,
//                 titleHeight: 1.2,
//                 titleAlign: TextAlign.center,
//                 titleColor: ColorManager.text,
//                 fontWeightType: FontWeightType.medium,),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
