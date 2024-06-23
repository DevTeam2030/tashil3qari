import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/app_bar.dart';
import 'package:tashil_agary/components/screen_loading.dart';
import 'package:tashil_agary/domain/model/home_venue_model.dart';
import 'package:tashil_agary/providers/home_provider.dart';
import 'package:tashil_agary/providers/wishlist_provider.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final ScrollController scrollController=ScrollController();

  @override
  void initState() {
    super.initState();
    if(mounted)context.read<WishlistProvider>().getWishList(context: context,notify: false);
   }
  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            title: 'Favorite'.tr(),
            showLogo: false,
            showBackICon: false,
            showDrawer: false, titleColor: ColorManager.primary,
         ),
      body:  Consumer<WishlistProvider>(
        builder: (context, provider, child) => ScreenLoading(
            isLoading: provider.isLoading,
            height: 1.0.sh,
            width: 1.0.sw,
            child:SizedBox(
              height: 1.0.sh,
              width: 1.0.sw,
              // child:
              // // provider.wishList.isEmpty&&!provider.isLoading?const NoDataCurrentlyAvailable():
              // NotificationListener<ScrollNotification>(
              //   onNotification: (notification ) {
              //     // if(!provider.isExitMoreData)return false;
              //     //
              //     // var nextPageTrigger = 0.8 * scrollController.position.maxScrollExtent;
              //     // // if (notification is ScrollEndNotification && notification.metrics.pixels != 160) {
              //     // if (notification is ScrollEndNotification && scrollController.position.pixels > nextPageTrigger) {
              //     //
              //     //   Future.delayed(const Duration(milliseconds: 100), () {}).then((s)async {
              //     //     await  provider.getMoreWishList(context: context,);
              //     //
              //     //   });
              //     // }
              //     return false;
              //   },
              //   child: ListView.builder(
              //     padding: const EdgeInsets.symmetric(vertical: PaddingManager.p20,horizontal: PaddingManager.p10),
              //
              //     itemCount:  provider.wishList.length,
              //     itemBuilder: (context, index) {
              //     return HomeProductItem(
              //       margin: const EdgeInsets.symmetric(vertical: PaddingManager.p8),
              //       showImageLoading: true,
              //       height: AppSize.s220,
              //       width: 1.0.sw,
              //       product:  provider.wishList[index],
              //     );
              //
              //         // FavoriteItem(venue:provider.wishList[index] ,
              //         //   isFavorite: true,
              //         //   width: 1.0.sw,height: .24.sh);
              //     },
              //   ),
              // ),
            )
        ),
      )
    );
  }
}
