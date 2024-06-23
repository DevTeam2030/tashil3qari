part of'auctions_imports.dart';

class AuctionsScreen extends StatefulWidget {
  const AuctionsScreen({Key? key}) : super(key: key);

  @override
  State<AuctionsScreen> createState() => _AuctionsScreenState();
}

class _AuctionsScreenState extends State<AuctionsScreen> {
  HomeData homeData=HomeData();
  AuctionsData auctionsData=AuctionsData();
  var categories=Constants.settingModel.categories;


  @override
  void initState() {
    super.initState();
    // categories.addAll(Constants.settingModel.categories);
    auctionsData.selectedCategory.value=categories.first;
    context.read<AuctionProvider>().getProperties(context: context,isNotify: false);
  }


  @override
  void dispose() {
    super.dispose();
    auctionsData.searchController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GeneralAppBar(title: 'Auctions'.tr(),showChatNotify: false),
      // appBar: HomeBuildAppBar(homeData: homeData,showFilter: false,fromHeight: 70),
      body: Consumer<AuctionProvider>(
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
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: DefaultTextFormField(
                                controller: auctionsData.searchController,
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
                                onTap: ()=>auctionsData.onFilterTap(context: context),
                                child: Image.asset(ImageManager.filter,height: 30,width: 30,)),
                          ],
                        ),
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                              title: 'SearchOverProperties'.tr().replaceFirst('num',
                                  provider.allProperties.length.toString()  ),
                              titleAlign: TextAlign.center,
                              titleMaxLines: 1,
                              fontWeightType: FontWeightType.medium,
                              titleSize: FontSize.s12,
                              titleColor:ColorManager.black),


                          Container(
                            height: 35,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 6),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(RadiusManager.r18),
                              color: ColorManager.textGrey,
                              // boxShadow: Constants.kBoxShadow
                            ),
                            child: Row(
                              children: [

                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(RadiusManager.r12),
                                    color:auctionsData.showAsList?ColorManager.white: ColorManager.transparent,
                                    // boxShadow: Constants.kBoxShadow
                                  ),
                                  child:  InkWell(onTap: ()=>setState(()=>auctionsData.showAsList=true),
                                      child: Image.asset(ImageManager.list,height: 30,width: 30,
                                        color: auctionsData.showAsList?ColorManager.primary:null,)),

                                ),
                                const AppSizeBox(width: 10,),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(RadiusManager.r12),
                                    color:!auctionsData.showAsList?ColorManager.white: ColorManager.transparent,
                                    // boxShadow: Constants.kBoxShadow
                                  ),
                                  child: InkWell(
                                      onTap: ()=>setState(()=>auctionsData.showAsList=false),
                                      child: Image.asset(ImageManager.grid,height: 30,width: 30,
                                        color: !auctionsData.showAsList?ColorManager.primary:null,)),

                                ),
                              ],
                            ),

                          )

                        ],
                      ),


                      if(provider.properties.isEmpty&&!provider.isLoading)Padding(
                        padding: EdgeInsets.only(top: .24.sh),
                        child: const NoDataCurrentlyAvailable(),
                      ),
                    ]),
                  ),




                  if(auctionsData.showAsList)
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return AdListItem(property: provider.properties[index],);
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
                        childAspectRatio: .57,
                      ),
                      delegate: SliverChildBuilderDelegate(
                            (context, index) {
                          return AdGridItem(property: provider.properties[index],);
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
