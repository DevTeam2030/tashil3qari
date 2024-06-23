import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/components/app_bar.dart';
import 'package:tashil_agary/components/screen_loading.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/presentation/orders/orders_data.dart';
import 'package:tashil_agary/presentation/orders/widgets/order_item.dart';
import 'package:tashil_agary/presentation/orders/widgets/tab_item.dart';
import 'package:tashil_agary/presentation/orders_details/orders_details_screen.dart';
import 'package:tashil_agary/providers/auth_provider.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/route_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  OrdersData ordersData=OrdersData();


  @override
  void dispose() {
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Orders'.tr(),showLogo: false,
        showBackICon: true,  titleColor: ColorManager.primary,),
      body: ScreenLoading(
        isLoading: context.watch<AuthProvider>().isLoading,
        child: SizedBox(
            width: 1.0.sw,
            height: 1.0.sh,
            child: Padding(
              padding:  returnPadding(),
              child:
              // provider.searchData.isEmpty&&!provider.isLoading?const NoDataCurrentlyAvailable():
              NotificationListener<ScrollNotification>(
                onNotification: (notification ) {
                  // if(!provider.isExitMoreAllSearchData)return false;
                  //
                  // var nextPageTrigger = 0.8 *  searchData.scrollController.position.maxScrollExtent;
                  // if (notification is ScrollEndNotification &&  searchData.scrollController.position.pixels > nextPageTrigger) {
                  //
                  //   Future.delayed(const Duration(milliseconds: 100), () {}).then((s)async {
                  //     await  searchData.getMoreSearchData(context: context,);
                  //
                  //   });
                  // }
                  return false;
                },
                child:  CustomScrollView(
                  // shrinkWrap: true,
                  controller: ordersData.scrollController,
                  physics: const ClampingScrollPhysics(),
                  slivers: [




                    SliverPadding(
                      padding: const EdgeInsets.symmetric(vertical: PaddingManager.p16),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TabItem(title: 'New Orders'.tr(),isSelected: ordersData.selectedOrderType==OrderType.newOrder,
                                onTap: (){
                                  ordersData.selectedOrderType=OrderType.newOrder;
                                  setState(() {

                                  });
                                },),
                              const AppSizeBox(width: AppSize.s20,),

                              TabItem(title: 'Past Orders'.tr(),
                                isSelected: ordersData.selectedOrderType==OrderType.pastOrder,
                                onTap: (){
                                  ordersData.selectedOrderType=OrderType.pastOrder;
                                  setState(() {

                                  });
                                },),
                            ],
                          ),





                        ]),
                      ),
                    ),

                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return OrderItem(
                              onTap: (){
                                MyRoute().navigate(context: context, route: const OrdersDetailsScreen());
                              },
                            );
                          },
                          childCount: 20,
                        )),



                  ],
                ),
              ),
            )
        )
      ),
    );
  }
}
