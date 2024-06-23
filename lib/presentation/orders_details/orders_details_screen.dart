import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/components/app_bar.dart';
import 'package:tashil_agary/components/screen_loading.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/presentation/cart/widgets/product_cart_Item.dart';
import 'package:tashil_agary/presentation/orders/widgets/order_item.dart';
import 'package:tashil_agary/presentation/orders_details/widgets/order_product_Item.dart';
import 'package:tashil_agary/presentation/orders_details/orders_details_data.dart';
import 'package:tashil_agary/presentation/orders_details/widgets/status_item.dart';
import 'package:tashil_agary/providers/auth_provider.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class OrdersDetailsScreen extends StatefulWidget {
  const OrdersDetailsScreen({Key? key}) : super(key: key);

  @override
  State<OrdersDetailsScreen> createState() => _OrdersDetailsScreenState();
}

class _OrdersDetailsScreenState extends State<OrdersDetailsScreen> {
  OrdersDetailsData ordersData=OrdersDetailsData();


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
        child: Container(
          width: 1.0.sw,
          height: 1.0.sh,
          margin: returnPadding(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AppSizeBox(height: AppSize.s20,),
                OrderItem(onTap:null,),

                const AppSizeBox(height: AppSize.s20,),
                Row(
                  children: [
                    AppText(
                      title:'Order Status'.tr(),
                      titleSize: FontSize.s18,
                      titleMaxLines: 2,
                      titleHeight: 1.2,
                      titleAlign: TextAlign.start,
                      titleColor: ColorManager.text,
                      fontWeightType: FontWeightType.bold,),
                  ],
                ),
                const AppSizeBox(height: AppSize.s20,),
                StatusItem(
                    date: '20 Jun 2022 10:00 AM',
                status: 'ConfirmStatus'.tr(),
                isActive: true),

                StatusItem(
                    date: '20 Jun 2022 10:00 AM',
                    status: 'ProcessingStatus'.tr(),
                    isActive: true),
                StatusItem(
                    date: '20 Jun 2022 10:00 AM',
                    status: 'OnTheWayStatus'.tr(),
                    isActive: false),
                StatusItem(
                    date: '20 Jun 2022 10:00 AM',
                    status: 'DeliveredStatus'.tr(),
                    isActive: false,
                isLast: true),

                const AppSizeBox(height: AppSize.s20,),
                Row(
                  children: [
                    AppText(
                      title:'Order Details'.tr(),
                      titleSize: FontSize.s18,
                      titleMaxLines: 2,
                      titleHeight: 1.2,
                      titleAlign: TextAlign.start,
                      titleColor: ColorManager.text,
                      fontWeightType: FontWeightType.bold,),
                  ],
                ),

                const AppSizeBox(height: AppSize.s10,),
                for(var item in [1,2,3])OrderProductItem()

              ],
            ),
          ),

        ),
      ),
    );
  }
}
