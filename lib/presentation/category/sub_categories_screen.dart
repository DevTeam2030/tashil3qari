import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/app/validator.dart';
import 'package:tashil_agary/components/app_bar.dart';
import 'package:tashil_agary/components/buttons/icon_button.dart';
import 'package:tashil_agary/components/cach_image.dart';
import 'package:tashil_agary/components/screen_loading.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/components/text_field/text_field_imports.dart';
import 'package:tashil_agary/domain/model/model/home_main_category.dart';
import 'package:tashil_agary/presentation/search/search_screen.dart';
import 'package:tashil_agary/presentation/search/widgets/search_sub_cat_item.dart';
import 'package:tashil_agary/providers/one_category_provider.dart';
import 'package:tashil_agary/providers/search_provider.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

import '../../components/lottie_item.dart';
import '../../utilites/route_manager.dart';

class SubCategoriesScreen extends StatefulWidget {
  final HomeMainCategoryModel cat;
  const SubCategoriesScreen({Key? key,required this.cat,}) : super(key: key);

  @override
  State<SubCategoriesScreen> createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen>  {

  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // if(mounted) context.read<OneCategoryProvider>().getAllCategoryProducts(context: context,catId: widget.cat.id);

  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (context, provider, child) => ScreenLoading(
          isLoading: provider.isLoading,
          height: 1.0.sh,
          width: 1.0.sw,
          child:  Scaffold(
              appBar: CustomAppBar(title: 'Filter'.tr(),
                  showLogo: false,
                  showBackICon: true,
                  showDrawer: false,
                  appBarWidget: Row(
                    children: [

                      CachedImage(
                    url:widget.cat.image,height: 70.0,width: 50,
                        colorImage:   widget.cat.background.toColor(),
                        colorFilter: ColorFilter.mode(widget.cat.background.toColor(), BlendMode.srcIn),
                      ),
                      AppText(title:widget.cat.name,
                        titleSize: FontSize.s24,
                        titleMaxLines: 2,
                        titleAlign: TextAlign.center,
                        titleColor: widget.cat.background.toColor(),
                        fontWeightType: FontWeightType.medium,),

                    ],
                  )
              ),


              body:SizedBox(
                  width: 1.0.sw,
                  height: 1.0.sh,
                  child: Padding(
                    padding:  returnPadding(),
                    child:
                    // provider.searchData.isEmpty&&!provider.isLoading?const NoDataCurrentlyAvailable():
                    CustomScrollView(
                      // shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      slivers: [



                        SliverPadding(
                          padding: const EdgeInsets.symmetric(vertical: PaddingManager.p8),
                          sliver: SliverList(
                            delegate: SliverChildListDelegate([


                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: .94.sw,
                                    height: AppSize.s40,
                                    child: DefaultTextFormField(
                                      controller: searchController,
                                      hintTitle: 'search'.tr(),
                                      labelTitle: 'search'.tr(),
                                      prefixIcon: const Icon(Icons.search,color: ColorManager.green,size: AppSize.s25),
                                      textInputAction: TextInputAction.search,
                                      textInputType: TextInputType.text,
                                      hintFontSize: FontSize.s12,
                                      hintStyle: getAppTextStyle(titleColor: ColorManager.text, titleSize: FontSize.s12,underline: false),
                                      textStyle: getAppTextStyle(titleColor: ColorManager.text, titleSize: FontSize.s12,underline: false),
                                      textSize: FontSize.s12,
                                      fillColor: ColorManager.searchGrey,
                                      borderColor: ColorManager.searchGrey,
                                      borderRadius: RadiusManager.r10,
                                      onChanged: (v){
                                        MyRoute().navigate(context: context, route:  SearchScreen(cat: widget.cat, subCat: null,));
                                      },

                                      validator: (v) => Validator().validateEmpty(value: v.toString(),),
                                    ),
                                  ),

                                  if(false)
                                  CustomIconButton(
                                      // onPressed: ()=> MyRoute().navigate(context: context,
                                      //     route: SearchFilterScreen(searchData: searchData,)),
                                    onPressed: (){},

                                      // onPressed: ()=> MyRoute..onFilterTap(context: context,searchData: searchData),
                                      title: '',
                                      content:
                                      Icon(FontAwesomeIcons.filter,
                                        color: ColorManager.green,size: AppSize.s22,)
                                    // Image.asset(ImageManager.sort,
                                    // width: AppSize.s20,
                                    // fit: BoxFit.cover,
                                    // height: AppSize.s30,)
                                  ),



                                ],
                              ),

                              const AppSizeBox(height: AppSize.s20,),
                              LottieItem(),

                              const AppSizeBox(height: AppSize.s10,),
                            ]),
                          ),
                        ),


                        SliverGrid(
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 1,
                            crossAxisSpacing: 2,
                            childAspectRatio: .7,
                          ),
                          delegate: SliverChildBuilderDelegate(
                                (context, index) {
                              return SubCatItem(subCat: widget.cat.subCategories[0],);
                            },
                            // childCount:widget.cat.subCategories.length,
                            childCount:10,
                          ),
                        ),


                      ],
                    ),
                  )
              )

          )
      ),
    );

  }


}
