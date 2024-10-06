// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';
// import 'package:tashil_agary/app/Debouncer.dart';
// import 'package:tashil_agary/app/extentions.dart';
// import 'package:tashil_agary/app/utils.dart';
// import 'package:tashil_agary/app/validator.dart';
// import 'package:tashil_agary/components/app_bar.dart';
// import 'package:tashil_agary/components/buttons/icon_button.dart';
// import 'package:tashil_agary/components/cach_image.dart';
// import 'package:tashil_agary/components/no_data_available.dart';
// import 'package:tashil_agary/components/screen_loading.dart';
// import 'package:tashil_agary/components/size_box_height.dart';
// import 'package:tashil_agary/components/text_field/text_field_imports.dart';
// import 'package:tashil_agary/domain/model/model/home_main_category.dart';
// import 'package:tashil_agary/domain/model/model/sub_category.dart';
// import 'package:tashil_agary/presentation/filter/search_filter_screen.dart';
// import 'package:tashil_agary/providers/one_category_provider.dart';
//
// import 'package:tashil_agary/providers/search_provider.dart';
// import 'package:tashil_agary/utilites/color_manager.dart';
// import 'package:tashil_agary/utilites/font_manager.dart';
// import 'package:tashil_agary/utilites/image_manager.dart';
// import 'package:tashil_agary/utilites/route_manager.dart';
// import 'package:tashil_agary/utilites/styles_manager.dart';
// import 'package:tashil_agary/utilites/values_manager.dart';
//
// import '../../app/enums.dart';
// import '../../components/filter_search_bottom_sheet.dart';
// import '../../components/lottie_item.dart';
// class SearchScreen extends StatefulWidget {
//   final HomeMainCategoryModel? cat;
//   final SubCategoryModel? subCat;
//
//   const SearchScreen({
//     Key? key,
//     required this.cat,
//     required this.subCat,
//   }) : super(key: key);
//
//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   TextEditingController searchController = TextEditingController();
//   final debouncer = DebouncerClass(seconds: 2);
//
//   @override
//   void initState() {
//     super.initState();
//     if (mounted) {
//         context.read<OneCategoryProvider>().searchProducts(context: context, catId: widget.cat?.id,keyword: null,subCatId: widget.subCat?.id,);
//
//     }
//   }
//
//   @override
//   void dispose() {
//     searchController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<OneCategoryProvider>(
//       builder: (context, provider, child) => ScreenLoading(
//           isLoading: provider.isLoading,
//           height: 1.0.sh,
//           width: 1.0.sw,
//           child: Scaffold(
//               appBar: CustomAppBar(
//                   title: 'Filter'.tr(),
//                   showLogo: false,
//                   showBackICon: true,
//                   showDrawer: false,
//                   appBarWidget:widget.cat==null?null: Row(
//                     children: [
//                       CachedImage(
//                         url: widget.cat!.image,
//                         height: 70.0,
//                         width: 50,
//                         colorImage: widget.cat!.background.toColor(),
//                         colorFilter: ColorFilter.mode(
//                             widget.cat!.background.toColor(), BlendMode.srcIn),
//                       ),
//                       AppText(
//                         title: widget.cat!.name,
//                         titleSize: FontSize.s24,
//                         titleMaxLines: 2,
//                         titleAlign: TextAlign.center,
//                         titleColor: widget.cat!.background.toColor(),
//                         fontWeightType: FontWeightType.medium,
//                       ),
//                     ],
//                   )),
//               body: SizedBox(
//                   width: 1.0.sw,
//                   height: 1.0.sh,
//                   child: Padding(
//                     padding: returnPadding(),
//                     child:
//                     // provider.searchData.isEmpty&&!provider.isLoading?const NoDataCurrentlyAvailable():
//                     CustomScrollView(
//                       // shrinkWrap: true,
//                       physics: const ClampingScrollPhysics(),
//                       slivers: [
//                         SliverPadding(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: PaddingManager.p8),
//                           sliver: SliverList(
//                             delegate: SliverChildListDelegate([
//                               Row(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   SizedBox(
//                                     width: .8.sw,
//                                     height: AppSize.s40,
//                                     child: DefaultTextFormField(
//                                       controller: searchController,
//                                       hintTitle: 'search'.tr(),
//                                       labelTitle: 'search'.tr(),
//                                       prefixIcon: const Icon(Icons.search,
//                                           color: ColorManager.green,
//                                           size: AppSize.s25),
//                                       textInputAction: TextInputAction.search,
//                                       textInputType: TextInputType.text,
//                                       hintFontSize: FontSize.s12,
//                                       hintStyle: getAppTextStyle(
//                                           titleColor: ColorManager.text,
//                                           titleSize: FontSize.s12,
//                                           underline: false),
//                                       textStyle: getAppTextStyle(
//                                           titleColor: ColorManager.text,
//                                           titleSize: FontSize.s12,
//                                           underline: false),
//                                       textSize: FontSize.s12,
//                                       fillColor: ColorManager.searchGrey,
//                                       borderColor: ColorManager.searchGrey,
//                                       borderRadius: RadiusManager.r10,
//                                       onChanged: (v) {
//                                         debouncer.run(() {
//                                           if((v==null||v.isEmpty)){
//                                             provider.getAllCategoryProducts(
//                                                 context: context,
//                                                 catId: widget.cat!.id);
//                                           } else {
//                                             provider.searchProducts(
//                                                 context: context,
//                                                 subCatId: widget.subCat?.id,
//                                                 keyword: v,
//                                                 catId: widget.cat?.id);
//                                           }
//                                         });
//
//                                       },
//                                       validator: (v) =>
//                                           Validator().validateEmpty(
//                                             value: v.toString(),
//                                           ),
//                                     ),
//                                   ),
//                                   CustomIconButton(
//                                       onPressed: () => MyRoute().navigate(
//                                           context: context,
//                                           route: SearchFilterScreen(
//                                             onSearch: () {},
//                                           )),
//                                       title: '',
//                                       content:
//                                       // Icon(FontAwesomeIcons.filter,
//                                       //   color: ColorManager.green,size: AppSize.s22,)
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: SvgPicture.asset(
//                                           ImageManager.filter,
//                                           width: AppSize.s20,
//                                           fit: BoxFit.cover,
//                                           height: AppSize.s20,
//                                         ),
//                                       )),
//                                 ],
//                               ),
//
//                               Column(
//                                 children: [
//                                   const AppSizeBox(
//                                     height: AppSize.s20,
//                                   ),
//                                   LottieItem(),
//                                   const AppSizeBox(
//                                     height: AppSize.s20,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.center,
//                                     children: [
//                                       Expanded(
//                                         flex: 2,
//                                         child: AppText(
//                                           title: '${provider.products.length} ${'Products'.tr()}',
//                                           titleSize: FontSize.s22,
//                                           titleMaxLines: 2,
//                                           titleAlign: TextAlign.start,
//                                           titleColor: ColorManager.appBarTitle,
//                                           fontWeightType: FontWeightType.bold,
//                                         ),
//                                       ),
//                                       FilterProductsDropdownButton(
//                                         onChanged: (v) {},
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//
//                               const AppSizeBox(
//                                 height: AppSize.s20,
//                               ),
//
//                               // if(widget.haveSubCats==true)
//                               //   SizedBox(
//                               //     height: AppSize.s160.h,
//                               //     width: 1.0.sw,
//                               //     child: ListView.builder(
//                               //       scrollDirection: Axis.horizontal,
//                               //       itemCount: searchData.subCats.length,
//                               //       itemBuilder: (context, index) => SearchSubCatItem2(
//                               //           isSelected:  searchData.selectedSubCat== searchData.subCats[index],
//                               //           onTap: (cat){
//                               //             setState(() {
//                               //               searchData.selectedSubCat=cat;
//                               //             });
//                               //           },
//                               //           subCat: searchData.subCats[index]
//                               //       ),),
//                               //   )
//                               if(!provider.isLoading&&provider.products.isEmpty)
//                                 const NoDataCurrentlyAvailable()
//                             ]),
//                           ),
//                         ),
//                         // SliverList(
//                         //     delegate: SliverChildBuilderDelegate(
//                         //           (BuildContext context, int index) {
//                         //         return HomeProductItem(
//                         //           margin: const EdgeInsets.symmetric(
//                         //               vertical: PaddingManager.p8),
//                         //           showImageLoading: true,
//                         //           height: AppSize.s220,
//                         //           width: 1.0.sw,
//                         //           product: provider.products[index],
//                         //         );
//                         //       },
//                         //       childCount: provider.products.length,
//                         //     )),
//                       ],
//                     ),
//                   )))),
//     );
//   }
// }
// // class SearchScreen extends StatefulWidget {
// //   const SearchScreen({Key? key,}) : super(key: key);
// //
// //   @override
// //   State<SearchScreen> createState() => _SearchScreenState();
// // }
// //
// // class _SearchScreenState extends State<SearchScreen>  {
// //   TextEditingController searchController = TextEditingController();
// //   final debouncer = DebouncerClass(seconds: 2);
// //   @override
// //   void initState() {
// //     super.initState();
// //     if (mounted)
// //       context
// //           .read<SearchProvider>()
// //           .searchProducts(context: context, catId: null,keyword: null,subCatId: null,notify: false);
// //   }
// //
// //   @override
// //   void dispose() {
// //     searchController.dispose();
// //     super.dispose();
// //   }
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Consumer<SearchProvider>(
// //       builder: (context, provider, child) => ScreenLoading(
// //           isLoading: provider.isLoading,
// //           height: 1.0.sh,
// //           width: 1.0.sw,
// //           child:  Scaffold(
// //               appBar: CustomAppBar(title: 'Filter'.tr(),
// //                   showLogo: false,
// //                   showBackICon: true,
// //                   showDrawer: false,
// //               ),
// //
// //
// //               body:SizedBox(
// //                   width: 1.0.sw,
// //                   height: 1.0.sh,
// //                   child: Padding(
// //                     padding:  returnPadding(),
// //                     child:
// //
// //                     CustomScrollView(
// //                       // shrinkWrap: true,
// //                       // controller: searchData.scrollController,
// //                       physics: const ClampingScrollPhysics(),
// //                       slivers: [
// //
// //
// //
// //                         SliverPadding(
// //                           padding: const EdgeInsets.symmetric(vertical: PaddingManager.p8),
// //                           sliver: SliverList(
// //                             delegate: SliverChildListDelegate([
// //
// //
// //                               Row(
// //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                                 children: [
// //                                   SizedBox(
// //                                     width: .8.sw,
// //                                     height: AppSize.s40,
// //                                     child: DefaultTextFormField(
// //                                       controller: searchController,
// //                                       hintTitle: 'search'.tr(),
// //                                       labelTitle: 'search'.tr(),
// //                                       showSuffixColor: false,
// //                                       prefixIcon: const Icon(Icons.search,color: ColorManager.green,size: AppSize.s25),
// //                                       textInputAction: TextInputAction.search,
// //                                       textInputType: TextInputType.text,
// //                                       hintFontSize: FontSize.s12,
// //                                       hintStyle: getAppTextStyle(titleColor: ColorManager.text, titleSize: FontSize.s12,underline: false),
// //                                       textStyle: getAppTextStyle(titleColor: ColorManager.text, titleSize: FontSize.s12,underline: false),
// //                                       textSize: FontSize.s12,
// //                                       fillColor: ColorManager.searchGrey,
// //                                       borderColor: ColorManager.searchGrey,
// //                                       borderRadius: RadiusManager.r10,
// //                                       onChanged: (v){
// //                                         debouncer.run(() {
// //                                             provider.searchProducts(
// //                                                 context: context,
// //                                                 subCatId: null,
// //                                                 keyword: v,
// //                                                 catId:null);
// //
// //                                         });
// //                                       },
// //
// //                                       validator: (v) => Validator().validateEmpty(value: v.toString(),),
// //                                     ),
// //                                   ),
// //
// //                                   CustomIconButton(
// //                                       onPressed: ()=> MyRoute().navigate(context: context, route: SearchFilterScreen(onSearch: (){},)),
// //                                       // onPressed: ()=> MyRoute..onFilterTap(context: context,searchData: searchData),
// //                                       title: '',
// //                                       content:
// //                                       // Icon(FontAwesomeIcons.filter,
// //                                       //   color: ColorManager.green,size: AppSize.s22,)
// //                                     Padding(
// //                                       padding: const EdgeInsets.all(8.0),
// //                                       child: SvgPicture.asset(ImageManager.filter,
// //                                       width: AppSize.s20,
// //                                       fit: BoxFit.cover,
// //                                       height: AppSize.s20,
// //                                         ),
// //                                     )
// //                                   ),
// //
// //
// //
// //                                 ],
// //                               ),
// //
// //                               Column(
// //                                 children: [
// //                                   const AppSizeBox(
// //                                     height: AppSize.s20,
// //                                   ),
// //                                   LottieItem(),
// //                                   const AppSizeBox(
// //                                     height: AppSize.s20,
// //                                   ),
// //                                   Row(
// //                                     mainAxisAlignment:
// //                                     MainAxisAlignment.spaceBetween,
// //                                     crossAxisAlignment:
// //                                     CrossAxisAlignment.center,
// //                                     children: [
// //                                       Expanded(
// //                                         flex: 2,
// //                                         child: AppText(
// //                                           title: '${provider.products.length} ${'Products'.tr()}',
// //                                           titleSize: FontSize.s22,
// //                                           titleMaxLines: 2,
// //                                           titleAlign: TextAlign.start,
// //                                           titleColor: ColorManager.appBarTitle,
// //                                           fontWeightType: FontWeightType.bold,
// //                                         ),
// //                                       ),
// //
// //                                     ],
// //                                   ),
// //                                 ],
// //                               ),
// //
// //                               const AppSizeBox(
// //                                 height: AppSize.s20,
// //                               ),
// //
// //                               const AppSizeBox(height: AppSize.s20,),
// //
// //                               if (  provider.products.isEmpty&&!provider.isLoading)const NoDataCurrentlyAvailable()
// //
// //                             ]),
// //                           ),
// //                         ),
// //
// //                         SliverList(
// //                             delegate: SliverChildBuilderDelegate(
// //                                   (BuildContext context, int index) {
// //                                 return HomeProductItem(
// //                                   margin: const EdgeInsets.symmetric(vertical: PaddingManager.p8),
// //                                   showImageLoading: true,
// //                                   height: AppSize.s220,
// //                                   width: 1.0.sw,
// //                                   product: provider.products[index],
// //                                 );
// //                               },
// //                               childCount: provider.products.length,
// //                             )),
// //
// //
// //
// //                       ],
// //                     ),
// //                   )
// //               )
// //
// //           )
// //       ),
// //     );
// //
// //   }
// //
// //
// // }
