import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/screen_loading.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';

import '../../../app/enums.dart';
import '../../../components/gridListItem.dart';
import '../../../components/text_field/general_appbar_logo.dart';
import '../../../providers/profile_provider.dart';
import '../search_list/widgets/ad_grid_item.dart';
import '../search_list/widgets/ad_list_item.dart';


class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {

bool showFavoriteAsList=true;
  @override
  void initState() {
    super.initState();
    if (mounted) {
      context.read<ProfileProvider>().getUserWishList(context: context, notify: false);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: GeneralAppBar(title: 'Favorite'.tr(),showChatNotify: false),
        body: Consumer<ProfileProvider>(
            builder: (context, provider, child) =>ScreenLoading(
              isLoading: provider.isLoading,
              child: Container(
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  AppText(
                                      title:' ${provider.userWishList.length} ',
                                      titleAlign: TextAlign.start,
                                      titleMaxLines: 1,
                                      fontWeightType: FontWeightType.extraBold,
                                      titleSize: FontSize.s16,
                                      titleColor: ColorManager.primary),
                                  AppText(
                                      title: 'advertisement'.tr(),
                                      titleAlign: TextAlign.start,
                                      titleMaxLines: 1,
                                      fontWeightType: FontWeightType.extraBold,
                                      titleSize: FontSize.s16,
                                      titleColor: ColorManager.black),
                                ],
                              ),



                                GridListItem(
                                  showAsList: showFavoriteAsList ,
                                  onTap: (value)=>
                                      setState(() =>showFavoriteAsList=value),
                                ),

                            ],
                          ),
                        ),



                        if (provider.userWishList.isEmpty&&provider.isLoading==false)
                          Padding(
                            padding:  EdgeInsets.only(top:.2.sh),
                            child: AppText(
                                title: 'NoDataCurrentlyAvailable'.tr(),
                                titleAlign: TextAlign.center,
                                titleMaxLines: 1,
                                fontWeightType: FontWeightType.extraBold,
                                titleSize: FontSize.s16,
                                titleColor: ColorManager.black),
                          ),

                      ]),
                    ),




                    if(showFavoriteAsList)
                      SliverList(
                          delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                              return AdListItem(property: provider.userWishList[index],);
                            },
                            childCount: provider.userWishList.length,
                          ))
                    else
                      SliverGrid(
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 1,
                          crossAxisSpacing: 2,
                          childAspectRatio: .57,
                        ),
                        delegate: SliverChildBuilderDelegate(
                              (context, index) {
                            return AdGridItem(property: provider.userWishList[index],);
                          },
                          // childCount:widget.cat.subCategories.length,
                          childCount:provider.userWishList.length,
                        ),
                      ),


                  ],
                ),


              ),
            )
        ));
  }
}

