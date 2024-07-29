import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

import '../../home_Screen/widgets/widget_imports.dart';
import '../search_list_data.dart';

class SearchAppbar extends StatefulWidget {
  final SearchListData searchListData;
  const SearchAppbar({super.key,required this.searchListData});

  @override
  State<SearchAppbar> createState() => _SearchAppbarState();
}

class _SearchAppbarState extends State<SearchAppbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        ValueListenableBuilder(valueListenable: widget.searchListData.openSearch,
            builder: (context, value, child) => Container(
                width: 100.0,
                height: AppSize.s35,
                padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p14),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: value?ColorManager.white:ColorManager.primary,
                    border: value?
                    const Border(
                      bottom: BorderSide(color:  ColorManager.primary,width: 3),
                    )
                        :
                    Border.all(color:value?ColorManager.white: ColorManager.primary,width: AppSize.s06),
                    borderRadius:value?null:  BorderRadius.circular(RadiusManager.r14)
                ),


                // padding: EdgeInsets.symmetric(horizontal: PaddingManager.p4),
                child:InkWell(
                    onTap: (){
                      widget.searchListData.openSearch.value=!value;
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                            title: 'search'.tr(),
                            titleAlign: TextAlign.center,
                            titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
                            titleSize: FontSize.s12,titleColor: value?ColorManager.primary:ColorManager.white),
                        Icon(value?Icons.keyboard_arrow_up_outlined:Icons.keyboard_arrow_down_outlined,
                          color: value?ColorManager.primary:ColorManager.white,size: AppSize.s20,)
                      ],
                    ))


            )),
        Row(
          children: [
            SizedBox(
              width: 1.0.sw-140,
              child:     Row(
                children: [
                  Expanded(child: ForSaleOrRentDropdownButton(
                    hint: 'saleRent'.tr(),
                    selectedType:  widget.searchListData.selectedAdType,
                    onChanged: (type) async{
                      widget.searchListData.selectedAdType=type;
                      widget.searchListData.getByCategory(context: context, category: widget.searchListData.selectedCategory.value);
                    },
                  ),),

                  AppSizeBox(width: 10,),

                  Expanded(child: CategoriesDropdownButton(
                    selectedCategory: widget.searchListData.selectedCategory.value,
                    onChanged: (selectedCategory)=>widget.searchListData.getByCategory(context: context, category: selectedCategory),
                  ),),


                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
