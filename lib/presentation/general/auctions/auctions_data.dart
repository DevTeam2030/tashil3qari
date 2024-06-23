part of'auctions_imports.dart';


class AuctionsData {

  TextEditingController searchController = TextEditingController();
  ValueNotifier<HomeCatogeryModel?> selectedCategory = ValueNotifier<HomeCatogeryModel?>(null);

  bool showAsList=true;
  onFilterTap({required BuildContext context,}){
    Utils.showModalBottomSheetApp(
        widget: SearchFilterBottomSheet(selectedCategory: selectedCategory,)
    );
  }
}

