import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/app_bar.dart';
import 'package:tashil_agary/components/buttons/text_button.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/presentation/filter/search_filter_data.dart';

import 'package:tashil_agary/presentation/search/widgets/filter_repalcement_widget.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class SearchFilterScreen extends StatefulWidget {
  final Function() onSearch;

  const SearchFilterScreen({Key? key, required this.onSearch}) : super(key: key);

  @override
  State<SearchFilterScreen> createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
 final SearchFilterData searchData = SearchFilterData();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: CustomAppBar(
            title: 'Filter'.tr(),
            showLogo: false,
            showBackICon: true,
            showDrawer: false,
            titleColor: ColorManager.primary),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal:PaddingManager.p14),
          height: 1.0.sh,
          width: 1.0.sw,
          constraints: BoxConstraints(
            maxHeight: 1.0.sh,
            minHeight: .6.sh,
          ),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(RadiusManager.r20),
              topRight: Radius.circular(RadiusManager.r20),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const AppSizeBox(
                  height: AppSize.s10,
                ),
                FilterReplacementWidget(title: 'Availability'.tr(),
                    isSelected:(data)=> searchData.filterSelectedAvailability==data,
                    onSelected: (data){
                    searchData.filterSelectedAvailability=data;
                    print(data.toJson().toString());
                      setState(() {});

                    },
                    sortList: searchData.sortByAvailability,
                 isCheckBox: true),
                FilterReplacementWidget(title: 'Product Type'.tr(),
                  isSelected:(data)=> searchData.filterSelectedSortList.contains(data),
                  onSelected: (data){
                    if (searchData.filterSelectedSortList.contains(data)) {
                      searchData.filterSelectedSortList.remove(data);
                    } else {
                      searchData.filterSelectedSortList.add(data);
                    }
                    setState(() {});
                  },
                  sortList: searchData.sortByList,),
                FilterReplacementWidget(title: 'Product Category'.tr(),
                  isSelected:(data)=> searchData.filterSelectedSortList.contains(data),
                  onSelected: (data){
                    if (searchData.filterSelectedSortList.contains(data)) {
                      searchData.filterSelectedSortList.remove(data);
                    } else {
                      searchData.filterSelectedSortList.add(data);
                    }
                    setState(() {});
                  },
                  sortList: searchData.sortByList,),
                FilterReplacementWidget(title: 'Themes'.tr(),
                  isSelected:(data)=> searchData.filterSelectedSortList.contains(data),
                  onSelected: (data){
                    if (searchData.filterSelectedSortList.contains(data)) {
                      searchData.filterSelectedSortList.remove(data);
                    } else {
                      searchData.filterSelectedSortList.add(data);
                    }
                    setState(() {});
                  },
                  sortList: searchData.sortByList,),
                FilterReplacementWidget(title: 'Gender'.tr(),
                  isSelected:(data)=> searchData.filterSelectedSortList.contains(data),
                  onSelected: (data){
                    if (searchData.filterSelectedSortList.contains(data)) {
                      searchData.filterSelectedSortList.remove(data);
                    } else {
                      searchData.filterSelectedSortList.add(data);
                    }
                    setState(() {});
                  },
                  sortList: searchData.sortByList,),
                FilterReplacementWidget(title: 'Occasion'.tr(),
                  isSelected:(data)=> searchData.filterSelectedSortList.contains(data),
                  onSelected: (data){
                    if (searchData.filterSelectedSortList.contains(data)) {
                      searchData.filterSelectedSortList.remove(data);
                    } else {
                      searchData.filterSelectedSortList.add(data);
                    }
                    setState(() {});
                  },
                  sortList: searchData.sortByList,),

                const AppSizeBox(
                  height: AppSize.s40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyTextButton(
                        title: 'Apply'.tr(),
                        primaryColor: ColorManager.primary,
                        radius: RadiusManager.r12,
                        size: Size(.7.sw, 50),
                        titleColor: ColorManager.white,
                        titleSize: FontSize.s16,
                        fontWeightType: FontWeightType.bold,
                        onPressed: () {
                          Navigator.pop(context);
                          // searchData.selectedSortList=searchData.filterSelectedSortList;
                          // searchData.selectedSortGender=searchData.filterSelectedSortByGender;
                          // searchData.getSearchData(context: context, notify: true);

                        }),
                  ],
                ),
                const AppSizeBox(
                  height: AppSize.s20,
                ),
              ],
            ),
          ),
        ));
  }
}
