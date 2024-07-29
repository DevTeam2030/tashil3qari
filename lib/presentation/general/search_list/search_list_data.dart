import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/presentation/general/search_list/widgets/search_filter_bottom_sheet.dart';
import 'package:tashil_agary/providers/search_provider.dart';

import '../../../app/contants.dart';
import '../../../app/enums.dart';
import '../../../domain/model/models/country_model.dart';
import '../../../domain/model/models/home_catogery_model.dart';


class SearchListData {
  ValueNotifier<bool> isAuction = ValueNotifier<bool>(false);
  TextEditingController searchController = TextEditingController();
  ValueNotifier<HomeCatogeryModel?> selectedCategory = ValueNotifier<HomeCatogeryModel?>(Constants.settingModel.categories.first);
  AdType? selectedAdType;
  ValueNotifier<bool> openSearch = ValueNotifier<bool>(false);
  ValueNotifier<CityModel?> selectedCity = ValueNotifier<CityModel?>(null);

  bool showAsList=true;
  getByCategory({required BuildContext context ,required HomeCatogeryModel? category})async{

    // if(selectedCategory.value==category)return;
    selectedCategory.value=category;
    await context.read<SearchProvider>().getProperties(context: context,categoryId: category?.id,
      isAuction: isAuction.value,
      forSale: selectedAdType == AdType.forSale,
      forRent: selectedAdType == AdType.forRent,
      cityId: selectedCity.value?.id,);

  }



  onFilterTap({required BuildContext context,}){
    Utils.showModalBottomSheetApp(
        widget: SearchFilterBottomSheet(selectedCategory: selectedCategory,)
    );
  }
}

