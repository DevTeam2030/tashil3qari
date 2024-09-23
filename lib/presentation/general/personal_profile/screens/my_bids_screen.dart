import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/no_data_available.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/presentation/general/search_list/widgets/ad_grid_item.dart';
import 'package:tashil_agary/presentation/general/search_list/widgets/ad_list_item.dart';
import 'package:tashil_agary/utilites/color_manager.dart';

import '../../../../app/enums.dart';
import '../../../../components/gridListItem.dart';
import '../../../../components/screen_loading.dart';
import '../../../../components/text_field/general_appbar_logo.dart';
import '../../../../providers/profile_provider.dart';
import '../../../../utilites/font_manager.dart';
import '../../../../utilites/styles_manager.dart';



class MyBidsScreen extends StatefulWidget {
  const MyBidsScreen({Key? key,}) : super(key: key);

  @override
  State<MyBidsScreen> createState() => _MyBidsScreenState();
}

class _MyBidsScreenState extends State<MyBidsScreen> {
  bool showAsList=true;
  @override
  void initState() {
    super.initState();
      context.read<ProfileProvider>().getBids(context: context,isNotify: false,);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(
        title: 'Bids'.tr(),),

      body: Consumer<ProfileProvider>(
          builder: (context, provider, child) =>ScreenLoading(
            isLoading: provider.isLoading,
            child:Container(
              height: 1.0.sh,
              width: 1.0.sw,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: CustomScrollView(
                // shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                slivers: [

                  SliverList(
                    delegate: SliverChildListDelegate([



                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         const AppSizeBox(width: 0,),

                          GridListItem(
                            showAsList: showAsList,
                            onTap: (value)=>setState(()=>showAsList=value),
                          )



                        ],
                      ),


                      if(provider.bids.isEmpty&&!provider.isLoading)Padding(
                        padding: EdgeInsets.only(top: .24.sh),
                        child: const NoDataCurrentlyAvailable(),
                      ),
                    ]),
                  ),




                  if(showAsList)
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return AdListItem(property: provider.bids[index],
                                onFavoriteTap: (prop){
                                  if(prop.wishlist) provider.removeFromWishlist(context: context, property: prop);
                                  else provider.addToWishlist(context: context, property: prop);
                                });
                          },
                          childCount: provider.bids.length,
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
                          return AdGridItem(property: provider.bids[index],
                            onFavoriteTap: (prop){
                              if(prop.wishlist) provider.removeFromWishlist(context: context, property: prop);
                              else provider.addToWishlist(context: context, property: prop);
                            },);
                        },
                        // childCount:widget.cat.subCategories.length,
                        childCount:provider.bids.length,
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
