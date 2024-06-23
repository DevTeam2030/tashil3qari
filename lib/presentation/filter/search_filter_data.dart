import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/domain/model/model/home_main_category.dart';
import 'package:tashil_agary/domain/model/popular_cat_model.dart';
import 'package:tashil_agary/presentation/search/widgets/filter_search_bottom_sheet.dart';
import 'package:tashil_agary/providers/search_provider.dart';
import 'package:tashil_agary/utilites/image_manager.dart';

class SearchFilterData{
  final formKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();
  final ScrollController scrollController=ScrollController();
  List<HomeMainCategoryModel> allMoreCats=[];
  List<HomeMainCategoryModel> moreCats=[];

  PopularCatModel? filterSelectedSortByGender;
  List<PopularCatModel> filterSelectedSortList=[];
late PopularCatModel filterSelectedAvailability;

  HomeMainCategoryModel?  selectedPopularCat;
  PopularCatModel? selectedSortGender;
  List<PopularCatModel> selectedSortList=[];


  SearchData({required BuildContext context}){
    // allMoreCats=context.read<HomeProvider>().homeModel.homeCategories;
    moreCats=allMoreCats;
    filterSelectedAvailability=sortByAvailability.first;
    selectedSubCat=subCats.first;
    // if(moreCats.isNotEmpty)selectedPopularCat=moreCats.first;

    // getSearchData(context: context,notify: false);
  }

 late HomeMainCategoryModel selectedSubCat;
 List<HomeMainCategoryModel>subCats=[
  // HomeMainCategoryModel(id: 0,name: 'Summer Bouquets',image: ImageManager.sub1),
  // HomeMainCategoryModel(id: 1,name: 'Airloonz',image: ImageManager.sub2),
  // HomeMainCategoryModel(id: 2,name: 'Aloha balloons',image: ImageManager.sub1),
  // HomeMainCategoryModel(id: 3,name: 'Pool party balloons',image: ImageManager.sub2),
  //  HomeMainCategoryModel(id: 4,name: 'Summer Bouquets',image: ImageManager.sub1),
  // HomeMainCategoryModel(id: 5,name: 'Airloonz',image: ImageManager.sub1),
  // HomeMainCategoryModel(id: 6,name: 'Aloha balloons',image: ImageManager.sub1),
  // HomeMainCategoryModel(id: 7,name: 'Pool party balloons',image: ImageManager.sub2),

  ];

  List<PopularCatModel> sortByAvailability=[
    PopularCatModel(image: ImageManager.s1,name: 'Show In-Stock Items Only'.tr()),
    PopularCatModel(image: ImageManager.s1,name: 'Show All'.tr()),
  ];
  List<PopularCatModel> sortByList=[
    PopularCatModel(image: ImageManager.s1,name: 'Pickup Or In-Store Shoppin'.tr()),
    PopularCatModel(image: ImageManager.s1,name: 'Shipping'.tr()),
    PopularCatModel(image: ImageManager.s1,name: 'Same Day Or Scheduled Delivery'.tr()),
  ];

  List<PopularCatModel> sortByGender=[
    PopularCatModel(image: ImageManager.s1,name: 'MaleOnly'.tr()),
    PopularCatModel(image: ImageManager.s1,name: 'FemaleOnly'.tr()),
    PopularCatModel(image: ImageManager.s1,name: 'ForEveryone'.tr()),

  ];


  getSearchData({required BuildContext context,required bool notify}){

    // context.read<SearchProvider>().getAllSearchData(context: context,notify: notify,
    //     keyword: searchController.text,
    //     sortRecommended:selectedSortList.contains(sortByList[1]) ,
    //     lowPrice: selectedSortList.contains(sortByList[4]) ,
    //     nearest: selectedSortList.contains(sortByList[0])&&latLng!=null ,
    //     sortRate:selectedSortList.contains(sortByList[2]) ,
    //     sortNewest:selectedSortList.contains(sortByList[3]) ,
    //     sortGenderType:selectedSortGender==null?null:(
    //         selectedSortGender==sortByGender.first?SortGenderType.male:(
    //             selectedSortGender==sortByGender.last?SortGenderType.everyOne:SortGenderType.female
    //     )),
    //     latLng: latLng,
    //     catId: selectedPopularCat?.id);
  }



  onFilterTap({required BuildContext context,}){
    Utils.showModalBottomSheetApp(
        widget: FilterSearchBottomSheet(searchFilterData: this,)
    );
  }


}
