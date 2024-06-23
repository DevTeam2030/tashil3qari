import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/buttons/text_button.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/domain/model/popular_cat_model.dart';
import 'package:tashil_agary/presentation/filter/search_filter_data.dart';
import 'package:tashil_agary/presentation/search/widgets/botom_filter_header_item.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class FilterSearchBottomSheet extends StatefulWidget {
  final  SearchFilterData searchFilterData;
  const FilterSearchBottomSheet({Key? key,required this.searchFilterData}) : super(key: key);

  @override
  State<FilterSearchBottomSheet> createState() => _FilterSearchBottomSheetState();
}

class _FilterSearchBottomSheetState extends State<FilterSearchBottomSheet> {


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return  Material(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(RadiusManager.r20),
          topRight: Radius.circular(RadiusManager.r20),
        ),
        color: ColorManager.white,
        child: Container(
          padding: const EdgeInsets.all(PaddingManager.p20),
          height:   1.0.sh,
          width:  1.0.sw,

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
              children: [
                const AppSizeBox(height: AppSize.s20,),

                AppText(
                    title: 'SortBy'.tr(),
                    titleAlign: TextAlign.start,
                    titleMaxLines: 1,fontWeightType: FontWeightType.bold,
                    titleSize: FontSize.s20,titleColor: ColorManager.primary),

                const AppSizeBox(height: AppSize.s10,),

                SizedBox(
                  width: 1.0.sw,
                  // height: AppSize.s40.h,
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      for(var item in widget.searchFilterData.sortByList)
                        BottomFilterHeaderItem(
                          onPressed: (){

                          if(widget.searchFilterData.filterSelectedSortList.contains(item)) {
                            widget.searchFilterData.filterSelectedSortList.remove(item);
                          } else {
                            widget.searchFilterData.filterSelectedSortList.add(item);
                          }
                          setState(() {});

                        },
                          isSelected:widget.searchFilterData.filterSelectedSortList.contains(item) ,
                        popularCatModel: item,)
                    ],
                  )
                ),

                const AppSizeBox(height: AppSize.s20,),
                AppText(
                    title: 'SortByGender'.tr(),
                    titleAlign: TextAlign.start,
                    titleMaxLines: 1,fontWeightType: FontWeightType.bold,
                    titleSize: FontSize.s20,titleColor: ColorManager.primary),

                const AppSizeBox(height: AppSize.s10,),

                SizedBox(
                    width: 1.0.sw,
                    // height: AppSize.s40.h,
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      children: [
                        for(var item in widget.searchFilterData.sortByGender)
                          BottomFilterHeaderItem(
                            onPressed: (){
                            if(widget.searchFilterData.filterSelectedSortByGender==item) {
                              widget.searchFilterData.filterSelectedSortByGender=null;
                            }else {
                              widget.searchFilterData.filterSelectedSortByGender=item;
                            }
                              setState(() {});

                            },
                            isSelected:widget.searchFilterData.filterSelectedSortByGender==item ,
                            popularCatModel: item,)
                      ],
                    )
                ),




                const AppSizeBox(height: AppSize.s20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyTextButton(
                        // title: 'ShowNumResults'.tr().replaceAll('num', '10+'),
                        title: 'ShowNumResults'.tr().replaceAll('num', ''),
                        primaryColor: ColorManager.primary,
                        radius: RadiusManager.r12,
                        size: Size( .7.sw,  50),
                        titleColor: ColorManager.white,
                        titleSize: FontSize.s16,
                        fontWeightType: FontWeightType.bold,
                        onPressed: () {
                          Navigator.pop(context);
                          widget.searchFilterData.selectedSortList=widget.searchFilterData.filterSelectedSortList;
                          widget.searchFilterData.selectedSortGender=widget.searchFilterData.filterSelectedSortByGender;
                          // widget.searchFilterData.getsearchFilterData(context: context, notify: true);
                        }),
                  ],
                ),

                const AppSizeBox(height: AppSize.s20,),
                Center(
                  child: InkWell(
                    onTap: (){
                     widget.searchFilterData.filterSelectedSortList.clear();
                     widget.searchFilterData.filterSelectedSortByGender=null;
                      setState(() {});
                    },
                    child: AppText(
                        title: 'DeleteAll'.tr(),
                        titleAlign: TextAlign.start,
                        titleMaxLines: 1,fontWeightType: FontWeightType.regular,
                        titleSize: FontSize.s18,titleColor: ColorManager.red),
                  ),
                ),

                const AppSizeBox(height: AppSize.s20,),

              ],
            ),
          ),
        )
    );
  }
}
