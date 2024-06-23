import 'dart:async';
import 'dart:typed_data';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/components/no_data_available.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/presentation/general/search_list/widgets/ad_grid_item.dart';
import 'package:tashil_agary/presentation/general/search_list/widgets/ad_list_item.dart';
import 'package:tashil_agary/providers/search_provider.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

import '../../../app/contants.dart';
import '../../../app/enums.dart';
import '../../../components/gridListItem.dart';
import '../../../components/screen_loading.dart';
import '../../../components/text_field/general_appbar_logo.dart';
import '../../../components/text_field/text_field_imports.dart';
import '../../../domain/model/models/general_property_model.dart';
import '../../../domain/model/models/home_catogery_model.dart';
import '../../../utilites/font_manager.dart';
import '../../../utilites/styles_manager.dart';
import '../home_Screen/home_imports.dart';
import '../home_Screen/widgets/widget_imports.dart';
import 'search_list_data.dart';

class SearchListScreen extends StatefulWidget {
  final List<GeneralPropertyModel>? properties;
  const SearchListScreen({Key? key,this.properties}) : super(key: key);

  @override
  State<SearchListScreen> createState() => _SearchListScreenState();
}

class _SearchListScreenState extends State<SearchListScreen> {

  SearchListData searchListData=SearchListData();
  var categories=Constants.settingModel.categories;
  

  
  @override
  void initState() {
    super.initState();
    // categories.addAll(Constants.settingModel.categories);
    searchListData.selectedCategory.value=categories.first;
    if(widget.properties!=null&&widget.properties!.isNotEmpty){
      context.read<SearchProvider>().allProperties=widget.properties!;
      context.read<SearchProvider>().properties=widget.properties!;
    }else {
      context.read<SearchProvider>().getProperties(context: context,isNotify: false);
    }
  }


  @override
  void dispose() {
    super.dispose();
    searchListData.searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(title: 'SearchByList'.tr(),showMapIcon: false),
      // floatingActionButton: Container(
      //   width: 50,
      //   height: 50,
      //   decoration: Utils.returnDropdownButtonDecoration(ColorManager.primary,
      //       ColorManager.primary,18),
      //   margin:  EdgeInsets.only(bottom: 10,right: 10,left: 10),
      //   padding: EdgeInsets.symmetric(horizontal: 10),
      //   child: InkWell(
      //       splashColor: ColorManager.white,
      //       highlightColor:ColorManager.white ,
      //       onTap: ()=>Navigator.pop(context) ,
      //       child: Icon(Icons.map,color: ColorManager.white,)
      //   ),
      // ),
      body: Consumer<SearchProvider>(
          builder: (context, provider, child) =>ScreenLoading(
            isLoading: provider.isLoading,
            child:     Container(
              height: 1.0.sh,
              width: 1.0.sw,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: CustomScrollView(
                // shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                slivers: [

                  SliverList(
                    delegate: SliverChildListDelegate([


                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: DefaultTextFormField(
                                controller: searchListData.searchController,
                                hintTitle: 'search'.tr(),
                                labelTitle: 'search'.tr(),
                                textInputAction: TextInputAction.search,
                                textInputType: TextInputType.text,
                                hintFontSize: FontSize.s12,
                                hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                textSize: FontSize.s12,
                                fillColor: ColorManager.textGrey,
                                borderColor: ColorManager.textGrey,
                                borderRadius: RadiusManager.r10,
                                prefixIcon: const Icon(Icons.search,color: ColorManager.icons,size: AppSize.s20,),
                                validator: (v) {},
                                onChanged: (v){
                                  if(v==null||v.isEmpty){
                                    provider.properties==provider.allProperties;
                                }else {
                                  provider.properties=provider.allProperties.where((element) =>
                                      element.propertyTitle.contains(v)||
                                          element.propertyDescription.contains(v)||
                                          element.category.contains(v)
                                  ).toList();
                                }
                                  provider.notifyListeners();
                              },
                              ),
                            ),

                            const AppSizeBox(width: 10,),
                            InkWell(
                                onTap: ()=>searchListData.onFilterTap(context: context),
                                child: Image.asset(ImageManager.filter,height: 30,width: 30,)),
                          ],
                        ),
                      ),

                      if(false)
                      SizedBox(
                          width: 1.0.sw,
                          height: AppSize.s35,
                          child: ListView.builder(
                            itemCount: Constants.settingModel.categories.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {

                              return ValueListenableBuilder(valueListenable: searchListData.selectedCategory,
                                builder: (context, value, child) => InkWell(
                                  onTap: ()=> searchListData.getByCategory(context: context, category: categories[index]),
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 6,vertical: 0),
                                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(RadiusManager.r6),
                                      color: value==categories[index]?ColorManager.primary:ColorManager.textGrey,
                                      // boxShadow: Constants.kBoxShadow
                                    ),
                                    child: AppText(
                                        title: categories[index].name,
                                        titleAlign: TextAlign.center,
                                        titleMaxLines: 1,
                                        fontWeightType: FontWeightType.medium,
                                        titleSize: FontSize.s10,
                                        titleColor:value==categories[index]?ColorManager.white: ColorManager.icons),
                                  ),
                                ),);
                            },)),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                              title: 'SearchOverProperties'.tr().replaceFirst('num', provider.allProperties.length.toString()),
                              titleAlign: TextAlign.center,
                              titleMaxLines: 1,
                              fontWeightType: FontWeightType.medium,
                              titleSize: FontSize.s12,
                              titleColor:ColorManager.black),

                          GridListItem(
                            showAsList: searchListData.showAsList,
                            onTap: (value)=>setState(()=>searchListData.showAsList=value),
                          )



                        ],
                      ),


                      if(provider.properties.isEmpty&&!provider.isLoading)Padding(
                        padding: EdgeInsets.only(top: .24.sh),
                        child: const NoDataCurrentlyAvailable(),
                      ),
                    ]),
                  ),




                  if(searchListData.showAsList)
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return AdListItem(property: provider.properties[index],
                                onFavoriteTap: (prop){
                                  if(prop.wishlist) provider.removeFromWishlist(context: context, property: prop);
                                  else provider.addToWishlist(context: context, property: prop);
                                });
                          },
                          childCount: provider.properties.length,
                        ))
                  else
                    SliverGrid(
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 2,
                        childAspectRatio: .74,
                      ),
                      delegate: SliverChildBuilderDelegate(
                            (context, index) {
                          return AdGridItem(property: provider.properties[index],
                            onFavoriteTap: (prop){
                              if(prop.wishlist) provider.removeFromWishlist(context: context, property: prop);
                              else provider.addToWishlist(context: context, property: prop);
                            },);
                        },
                        // childCount:widget.cat.subCategories.length,
                        childCount:provider.properties.length,
                      ),
                    ),


                ],
              ),


            ),
          )
      )


    );
  }
}
