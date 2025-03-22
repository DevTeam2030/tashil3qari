import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/app/validator.dart';
import 'package:tashil_agary/components/app_bar.dart';
import 'package:tashil_agary/components/buttons/text_button.dart';
import 'package:tashil_agary/components/screen_loading.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/components/text_field/text_field_imports.dart';
import 'package:tashil_agary/domain/model/home_venue_model.dart';
import 'package:tashil_agary/presentation/cart/widgets/product_cart_Item.dart';
import 'package:tashil_agary/providers/home_provider.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

import '../../app/enums.dart';
import '../../components/buttons/date_button.dart';
import '../../providers/home_map_provider.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<HomeVenueModel> data=[];
  TextEditingController promoCodeController = TextEditingController();
  DateTime? selectedDate;
  ValueNotifier<bool>showPromoHint=ValueNotifier<bool>(true);
  @override
  void initState() {
    super.initState();
   data= [
      HomeVenueModel(id: 0,name: 'Summer Birthday',logo: ImageManager.image1,type: '',address: ''
          ,rate: '0',wishlist: false,distance: '',rateCount: '0'),
      HomeVenueModel(id: 0,name: 'Mint to Be Wedding Balloons',logo: ImageManager.image2,type: '',address: ''
          ,rate: '0',wishlist: false,distance: '',rateCount: '0'),
      HomeVenueModel(id: 0,name: 'Summer Birthday',logo: ImageManager.image1,type: '',address: ''
          ,rate: '0',wishlist: false,distance: '',rateCount: '0'),
      HomeVenueModel(id: 0,name: 'Mint to Be Wedding Balloons',logo: ImageManager.image2,type: '',address: ''
          ,rate: '0',wishlist: false,distance: '',rateCount: '0'),

    ];
  }
  @override
  void dispose() {
    promoCodeController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.white,
        appBar: CustomAppBar(
            title: 'Cart'.tr(),
            showLogo: false,
            showBackICon: false,
            showDrawer: false,
            titleColor: ColorManager.primary),
        body: Consumer<HomeMapProvider>(
          builder: (context, provider, child) => ScreenLoading(
            isLoading: provider.isLoading,
            height: 1.0.sh,
            width: 1.0.sw,
            child: SizedBox(
                height: 1.0.sh,
                width: 1.0.sw,
                child: CustomScrollView(
                  // shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate([
                        Padding(
                          padding: returnPadding(),
                          child: Column(
                            children: [
                              const AppSizeBox(height: AppSize.s20),
                              Row(
                                children: [
                                  AppText(title:'3 ${'items'.tr()}',
                                    titleSize: FontSize.s18,
                                    titleMaxLines: 1,
                                    titleColor: ColorManager.text,
                                    fontWeightType: FontWeightType.medium,),
                                ],
                              ),
                              const AppSizeBox(height: AppSize.s10),

                            ],
                          ),
                        )
                      ]),
                    ),


                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return const ProductCartItem();
                        },
                        // 40 list items
                        childCount: 3,
                      ),
                    ),


                    SliverList(
                      delegate: SliverChildListDelegate([
                        Padding(
                          padding: returnPadding(),
                          child: Column(
                            children: [
                              const AppSizeBox(height: AppSize.s20),
                              Row(
                                children: [
                                  AppText(title:'Delivery date'.tr(),
                                    titleSize: FontSize.s14,
                                    titleMaxLines: 1,
                                    titleColor: ColorManager.textDate,
                                    fontWeightType: FontWeightType.medium,),
                                ],
                              ),
                              const AppSizeBox(height: AppSize.s20),
                              DateButton(
                                date: selectedDate,
                                onTap: (){

                                  Utils.pickDateDialog(
                                    context: context,selectedDate: selectedDate,
                                    onSuccess: (date)=>setState(()=>selectedDate=date),
                                  );

                                },
                              ),
                              const AppSizeBox(height: AppSize.s20),

                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: DottedBorder(
                                    borderType: BorderType.RRect,
                                    radius: const Radius.circular(RadiusManager.r10),
                                    padding: const EdgeInsets.all(PaddingManager.p2),
                                    color: ColorManager.primary,
                                    strokeWidth: 1.2,
                                    child:    Stack(
                                      children: [
                                        SizedBox(
                                          height: 36,
                                          child: DefaultTextFormField(
                                            controller: promoCodeController,
                                            hintTitle: '',
                                            labelTitle: '',

                                            textInputAction: TextInputAction.search,
                                            textInputType: TextInputType.text,
                                            hintFontSize: FontSize.s12,
                                            hintStyle: getAppTextStyle(titleColor: ColorManager.text, titleSize: FontSize.s14,fontWeightType: FontWeightType.regular,underline: false),
                                            textStyle: getAppTextStyle(titleColor: ColorManager.text, titleSize: FontSize.s14,fontWeightType: FontWeightType.regular,underline: false),
                                            textSize: FontSize.s12,
                                            fillColor: ColorManager.white,
                                            borderColor: ColorManager.white,
                                            borderRadius: RadiusManager.r16,
                                            onChanged: (v){
                                             if(v==null||v.toString().isEmpty)showPromoHint.value=true;
                                             else showPromoHint.value=false;
                                              // getSearchData(context: context, notify: false,searchProvider: provider);
                                              // searchData.getSearchData(context: context, notify: false);
                                            },

                                            validator: (v) => Validator().validateEmpty(value: v.toString(),),
                                          ),
                                        ),

                                        ValueListenableBuilder(valueListenable: showPromoHint,
                                            builder: (context, value, child) =>value==false?const AppSizeBox(height: 0,):  Padding(
                                              padding:  const EdgeInsets.all( PaddingManager.p12),
                                              child: AppText(title:'Promo Code'.tr(),
                                                  titleMaxLines: 1,
                                                  titleColor: ColorManager.text,
                                                  titleSize: FontSize.s14,
                                                  fontWeightType: FontWeightType.regular,underline: false
                                              ),
                                            ),),

                                      ],
                                    ),
                                  ),
                                ),
                                const AppSizeBox(width: AppSize.s10),
                                Expanded(
                                  flex: 1,
                                  child: MyTextButton(
                                      title: 'Apply'.tr(),
                                      primaryColor: ColorManager.primary,
                                      radius: RadiusManager.r8,
                                      size: Size(.24.sw, 40),
                                      titleColor: ColorManager.white,
                                      titleSize: FontSize.s16,
                                      fontWeightType: FontWeightType.bold,
                                      onPressed: () {}),
                                ),
                              ],
                            ),
                              const AppSizeBox(height: AppSize.s20),


                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p12),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Row(
                                     children: [
                                       Expanded(
                                         flex: 1,
                                         child: AppText(title:'SubTotal'.tr()+':',
                                           titleSize: FontSize.s12,
                                           titleMaxLines: 1,
                                           titleAlign: TextAlign.start,
                                           titleColor: ColorManager.text,
                                           fontWeightType: FontWeightType.regular,),
                                       ),
                                       const AppSizeBox(width: AppSize.s10,),
                                       Expanded(
                                         flex: 2,
                                         child: AppText(title:'12.00'+'qar'.tr(),
                                           titleSize: FontSize.s12,
                                           titleAlign: TextAlign.start,
                                           titleMaxLines: 1,
                                           titleColor: ColorManager.primary,
                                           fontWeightType: FontWeightType.bold,),
                                       ),
                                     ],
                                   ),
                                   const AppSizeBox(height: AppSize.s10,),
                                   Row(
                                     children: [
                                       Expanded(
                                         flex: 1,
                                         child: AppText(title:'Discount'.tr()+':',
                                           titleSize: FontSize.s12,
                                           titleAlign: TextAlign.start,
                                           titleMaxLines: 1,
                                           titleColor: ColorManager.text,
                                           fontWeightType: FontWeightType.regular,),
                                       ),
                                       const AppSizeBox(width: AppSize.s10,),
                                       const Expanded(
                                         flex: 2,
                                         child: AppText(title:'50%',
                                           titleAlign: TextAlign.start,
                                           titleSize: FontSize.s12,
                                           titleMaxLines: 1,
                                           titleColor: ColorManager.primary,
                                           fontWeightType: FontWeightType.bold,),
                                       ),
                                     ],
                                   ),

                                   const AppSizeBox(height: AppSize.s10,),
                                   const Divider(
                                     height: 2,
                                     thickness: 1.5,
                                     color: ColorManager.searchGrey,
                                   ),
                                   const AppSizeBox(height: AppSize.s10,),
                                   Row(
                                     children: [
                                       Expanded(
                                         flex: 1,
                                         child: AppText(title:'Total'.tr()+':',
                                           titleSize: FontSize.s14,
                                           titleMaxLines: 1,
                                           titleColor: ColorManager.text,
                                           titleAlign: TextAlign.start,
                                           fontWeightType: FontWeightType.extraBold,),
                                       ),
                                       const AppSizeBox(width: AppSize.s10,),
                                       Expanded(
                                         flex: 2,
                                         child: AppText(title:'600'+'qar'.tr(),
                                           titleSize: FontSize.s14,
                                           titleMaxLines: 1,
                                           titleColor: ColorManager.primary,
                                           titleAlign: TextAlign.start,
                                           fontWeightType: FontWeightType.extraBold,),
                                       ),
                                     ],
                                   ),
                                 ],
                               ),
                             ),

                              const AppSizeBox(height: AppSize.s20),

                              MyTextButton(
                                  title: 'Checkout'.tr(),
                                  primaryColor: ColorManager.primary,
                                  radius: RadiusManager.r8,
                                  size: Size(.5.sw, 45),
                                  titleColor: ColorManager.white,
                                  titleSize: FontSize.s16,
                                  fontWeightType: FontWeightType.bold,
                                  onPressed: () {}),
                              const AppSizeBox(height: AppSize.s20),
                            ],
                          ),
                        )
                      ]),
                    ),






                  ],
                )),
          ),
        ),
      ),
    );
  }


}
