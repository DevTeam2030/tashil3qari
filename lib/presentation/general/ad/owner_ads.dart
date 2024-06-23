import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/presentation/general/search_list/widgets/ad_grid_item.dart';

import '../../../app/contants.dart';
import '../../../components/no_data_available.dart';
import '../../../components/screen_loading.dart';
import '../../../components/size_box_height.dart';
import '../../../components/text_field/general_appbar_logo.dart';
import '../../../domain/model/models/general_property_model.dart';
import '../../../providers/product_provider.dart';


class AllOwnerAds extends StatefulWidget {
  final int ownerId;
  final String ownerName;
  const AllOwnerAds({super.key,required this.ownerId,required this.ownerName});

  @override
  State<AllOwnerAds> createState() => _AllOwnerAdsState();
}

class _AllOwnerAdsState extends State<AllOwnerAds> {
  @override
  void initState() {
    super.initState();
    if(mounted) context.read<ProductProvider>().getOwnerProperties(context: context,ownerId: widget.ownerId,);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(title: widget.ownerName,showChatNotify: false),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) => ScreenLoading(
            isLoading: provider.isLoading,
            height: 1.0.sh,
            width: 1.0.sw,
            child: provider.isLoading?const AppSizeBox(height: 0,):
            Container(
              height: 1.0.sh,
              width: 1.0.sw,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: CustomScrollView(
                // shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                slivers: [

                  SliverList(
                    delegate: SliverChildListDelegate([
                      if(provider.ownerProperties.isEmpty)
                        Padding(
                          padding:  EdgeInsets.only(top: 0.4.sh),
                          child: NoDataCurrentlyAvailable(),
                        )
                    ]),
                  ),
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
                        return AdGridItem(property: provider.ownerProperties[index],);
                      },
                      // childCount:widget.cat.subCategories.length,
                      childCount:provider.ownerProperties.length,
                    ),
                  ),


                ],
              ),


            ),
        ),
      )

    );
  }
}
