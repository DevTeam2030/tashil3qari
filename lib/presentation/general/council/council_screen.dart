part of 'council_imports.dart';

class CouncilScreen extends StatefulWidget {
  const CouncilScreen({super.key});

  @override
  State<CouncilScreen> createState() => _CouncilScreenState();
}

class _CouncilScreenState extends State<CouncilScreen> {
  CouncilData councilData = CouncilData();
  // late TabController _controller;
  int _activeTabIndex=0;

  @override
  void initState() {
    super.initState();
    if(mounted){
      context.read<CouncilProvider>().getCouncilData(context: context,notify: false);
    }
  }



  @override
  void dispose() {
    // _controller.dispose();
    councilData.newsController.dispose();
    councilData.opportunityController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title:CouncilBuildAppBar(councilData: councilData,),
          // leading:  null,
          automaticallyImplyLeading: false,
          bottom:  TabBar(
            onTap: (v){
              _activeTabIndex=v;
              setState(() {});
            },

            indicatorColor: ColorManager.primary,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding:  EdgeInsets.symmetric(horizontal: 20),
            // indicator: ShapeDecoration(
            //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            //     color: Colors.red
            // ),

          

            // padding: EdgeInsets.symmetric(horizontal: 20),
            tabs: [
              Tab(
                child: AppText(title:'Real estate news'.tr(),
                  titleSize: FontSize.s16,
                  titleMaxLines: 2,
                  titleAlign: TextAlign.center,
                  titleColor: _activeTabIndex==0?ColorManager.primary:ColorManager.reviewGrey,
                  fontWeightType:_activeTabIndex==0? FontWeightType.bold:FontWeightType.medium,),
              ),
              Tab(
                child: AppText(title:'Real estate opportunity'.tr(),
                  titleSize: FontSize.s16,
                  titleMaxLines: 2,
                  titleAlign: TextAlign.center,
                  titleColor: _activeTabIndex==1?ColorManager.primary:ColorManager.reviewGrey,
                  fontWeightType:_activeTabIndex==1? FontWeightType.bold:FontWeightType.medium,),
              ),



            ],
          ),
        ),
        body:  Consumer<CouncilProvider>(
          builder: (context, provider, child) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ScreenLoading(
                isLoading: provider.isLoading,
                height: 1.0.sh,
                width: 1.0.sw,
                child:     TabBarView(
                  children: [

                    RealEstateNewsTab(councilData: councilData,data: provider.posts),
                    RealEstateOpportunityTab(councilData: councilData,data:provider.opportunities),
                  ],
                ),
            ),
          ),
        ),

      ),
    );
    ;
  }
}
