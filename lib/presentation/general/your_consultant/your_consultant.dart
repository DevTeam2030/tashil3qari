part of'your_consultant_imports.dart';

class YourConsultantScreen extends StatefulWidget {
  const YourConsultantScreen({super.key});

  @override
  State<YourConsultantScreen> createState() => _YourConsultantScreenState();
}

class _YourConsultantScreenState extends State<YourConsultantScreen> {
  bool showAsList=false;
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    context.read<ConsultantProvider>().getConsultants(notify: false,context: context);
  }


  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: HomeBuildAppBar(showFilter: false,fromHeight: 70,showLogo:false),
      body: Consumer<ConsultantProvider>(
        builder: (context, provider, child) => ScreenLoading(
          isLoading: provider.isLoading,
          height: 1.0.sh,
          width: 1.0.sw,
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

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: DefaultTextFormField(
                              controller: searchController,
                              hintTitle: 'searchSerialAndName'.tr(),
                              labelTitle: 'searchSerialAndName'.tr(),
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
                              onChanged: (v) {
                                provider.searchConsultants(name: v);
                              },
                            ),
                          ),


                          const AppSizeBox(width: 10,),
                          InkWell(
                              onTap: (){
                                Utils.showModalBottomSheetApp(widget:ConsultantFilterBottomSheet(
                                  onSelectedConsultant: (consultant) {

                                  },
                                ));
                              },
                              child: Image.asset(ImageManager.filter,height: 30,width: 30,)),
                        ],
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // AppText(
                        //     title: 'SearchOverProperties'.tr().replaceFirst('num', provider.allProperties.length.toString()),
                        //     titleAlign: TextAlign.center,
                        //     titleMaxLines: 1,
                        //     fontWeightType: FontWeightType.medium,
                        //     titleSize: FontSize.s12,
                        //     titleColor:ColorManager.black),

                        GridListItem(
                          showAsList: showAsList,
                          onTap: (value)=>setState(()=>showAsList=value),
                        )



                      ],
                    ),
                    if(provider.filterConsultants.isEmpty&&!provider.isLoading)
                      Padding(
                        padding: EdgeInsets.only(top: .25.sh),
                        child: NoDataCurrentlyAvailable(),
                      ),

                    // for(var conslt in provider.filterConsultants)
                    // HorizontalRealEstateConsultantWidget(
                    //   consultant: conslt,
                    //   onSelected: (){},
                    // ),
                  ]),
                ),




                if(showAsList)
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return   HorizontalRealEstateConsultantWidget(
                            consultant:  provider.filterConsultants[index],
                            onSelected: (){},
                          );
                        },
                        childCount:  provider.filterConsultants.length,
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
                      return RealEstateConsultantWidget(
                        consultant: provider.filterConsultants[index],
                        onSelected: (){},);
                    },
                    // childCount:widget.cat.subCategories.length,
                    childCount:provider.filterConsultants.length,
                  ),
                ),


              ],
            ),



          ),
        ),
      ),

    );
  }
}
