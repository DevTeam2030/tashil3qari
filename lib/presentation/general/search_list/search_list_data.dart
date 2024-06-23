import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/presentation/general/search_list/widgets/search_filter_bottom_sheet.dart';
import 'package:tashil_agary/providers/search_provider.dart';

import '../../../domain/model/models/home_catogery_model.dart';


class SearchListData {

  TextEditingController searchController = TextEditingController();
  ValueNotifier<HomeCatogeryModel?> selectedCategory = ValueNotifier<HomeCatogeryModel?>(null);

  bool showAsList=true;
  getByCategory({required BuildContext context ,required HomeCatogeryModel category})async{

    if(selectedCategory.value==category)return;
    selectedCategory.value=category;
    await context.read<SearchProvider>().getProperties(context: context,categoryId: category.id);

  }
  onFilterTap({required BuildContext context,}){
    Utils.showModalBottomSheetApp(
        widget: SearchFilterBottomSheet(selectedCategory: selectedCategory,)
    );
  }
}

