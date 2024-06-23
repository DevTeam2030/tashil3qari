// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:tashil_agary/app/enums.dart';
// import 'package:tashil_agary/app/extentions.dart';
// import 'package:tashil_agary/components/buttons/text_button.dart';
// import 'package:tashil_agary/components/size_box_height.dart';
// import 'package:tashil_agary/domain/model/popular_cat_model.dart';
// import 'package:tashil_agary/presentation/search/search_data.dart';
// import 'package:tashil_agary/presentation/search/widgets/botom_filter_header_item.dart';
// import 'package:tashil_agary/utilites/color_manager.dart';
// import 'package:tashil_agary/utilites/font_manager.dart';
// import 'package:tashil_agary/utilites/image_manager.dart';
// import 'package:tashil_agary/utilites/styles_manager.dart';
// import 'package:tashil_agary/utilites/values_manager.dart';
//
// class FilterOneCategoryBottomSheet extends StatefulWidget {
//   final  SearchData searchData;
//   final  int catId;
//   const FilterOneCategoryBottomSheet({Key? key,required this.searchData,required this.catId}) : super(key: key);
//
//   @override
//   State<FilterOneCategoryBottomSheet> createState() => _FilterOneCategoryBottomSheetState();
// }
//
// class _FilterOneCategoryBottomSheetState extends State<FilterOneCategoryBottomSheet> {
//
//
//   @override
//   void initState() {
//     super.initState();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  Material(
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(RadiusManager.r20),
//           topRight: Radius.circular(RadiusManager.r20),
//         ),
//         color: ColorManager.white,
//         child: Container(
//           padding: const EdgeInsets.all(PaddingManager.p20),
//           // height:  .75.sh,
//           width:  1.0.sw,
//
//           constraints: BoxConstraints(
//             maxHeight: .86.sh,
//             minHeight: .6.sh,
//           ),
//           decoration: BoxDecoration(
//             color: ColorManager.white,
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(RadiusManager.r20),
//               topRight: Radius.circular(RadiusManager.r20),
//             ),
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const AppSizeBox(height: AppSize.s20,),
//
//                 AppText(
//                     title: 'SortBy'.tr(),
//                     titleAlign: TextAlign.start,
//                     titleMaxLines: 1,fontWeightType: FontWeightType.bold,
//                     titleSize: FontSize.s20,titleColor: ColorManager.primary),
//
//                 const AppSizeBox(height: AppSize.s10,),
//
//                 SizedBox(
//                   width: 1.0.sw,
//                   // height: AppSize.s40.h,
//                   child: Wrap(
//                     alignment: WrapAlignment.start,
//                     children: [
//                       for(var item in widget.searchData.sortByList)
//                         BottomFilterHeaderItem(
//                           onPressed: (){
//
//                           if(widget.searchData.filterSelectedSortList.contains(item)) {
//                             widget.searchData.filterSelectedSortList.remove(item);
//                           } else {
//                             widget.searchData.filterSelectedSortList.add(item);
//                           }
//                           setState(() {});
//
//                         },
//                           isSelected:widget.searchData.filterSelectedSortList.contains(item) ,
//                         popularCatModel: item,)
//                     ],
//                   )
//                 ),
//
//                 const AppSizeBox(height: AppSize.s20,),
//                 AppText(
//                     title: 'SortByGender'.tr(),
//                     titleAlign: TextAlign.start,
//                     titleMaxLines: 1,fontWeightType: FontWeightType.bold,
//                     titleSize: FontSize.s20,titleColor: ColorManager.primary),
//
//                 const AppSizeBox(height: AppSize.s10,),
//
//                 SizedBox(
//                     width: 1.0.sw,
//                     // height: AppSize.s40.h,
//                     child: Wrap(
//                       alignment: WrapAlignment.start,
//                       children: [
//                         for(var item in widget.searchData.sortByGender)
//                           BottomFilterHeaderItem(
//                             onPressed: (){
//                             if(widget.searchData.filterSelectedSortByGender==item)  return ;
//
//                             widget.searchData.filterSelectedSortByGender=item;
//                               setState(() {});
//
//                             },
//                             isSelected:widget.searchData.filterSelectedSortByGender==item ,
//                             popularCatModel: item,)
//                       ],
//                     )
//                 ),
//
//
//
//
//                 const AppSizeBox(height: AppSize.s20,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     MyTextButton(
//                         // title: 'ShowNumResults'.tr().replaceAll('num', '10+'),
//                         title: 'ShowNumResults'.tr().replaceAll('num', ''),
//                         primaryColor: ColorManager.primary,
//                         radius: RadiusManager.r12,
//                         size: Size( .7.sw,  50),
//                         titleColor: ColorManager.white,
//                         titleSize: FontSize.s16,
//                         fontWeightType: FontWeightType.bold,
//                         onPressed: () {
//                           Navigator.pop(context);
//                           widget.searchData.selectedSortList=widget.searchData.filterSelectedSortList;
//                           widget.searchData.selectedSortGender=widget.searchData.filterSelectedSortByGender;
//                           widget.searchData.getSearchCategoryData(context: context, notify: true,catId: widget.catId);
//                         }),
//                   ],
//                 ),
//
//                 const AppSizeBox(height: AppSize.s20,),
//                 Center(
//                   child: InkWell(
//                     onTap: (){
//                      widget.searchData.filterSelectedSortList.clear();
//                      widget.searchData.filterSelectedSortByGender=null;
//                       setState(() {});
//                     },
//                     child: AppText(
//                         title: 'DeleteAll'.tr(),
//                         titleAlign: TextAlign.start,
//                         titleMaxLines: 1,fontWeightType: FontWeightType.regular,
//                         titleSize: FontSize.s18,titleColor: ColorManager.red),
//                   ),
//                 ),
//
//                 const AppSizeBox(height: AppSize.s20,),
//
//               ],
//             ),
//           ),
//         )
//     );
//   }
// }
