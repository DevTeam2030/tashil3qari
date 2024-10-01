part of'services_imports.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  HomeData homeData=HomeData();

  @override
  void initState() {
    super.initState();
    context.read<ServicesProvider>().getServices(notify: false,context: context);
  }


  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: HomeBuildAppBar(homeData: homeData,showFilter: false,fromHeight: 70),
      body: Consumer<ServicesProvider>(
        builder: (context, provider, child) => ScreenLoading(
          isLoading: provider.isLoading,
          height: 1.0.sh,
          width: 1.0.sw,
          child:  Container(
              height: 1.0.sh,
              width: 1.0.sw,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [




                    if(Constants.settingModel.servicesAboutAr.isNotEmpty&&Constants.settingModel.servicesAboutEn.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                      child: AppText(
                          title: Constants.isArabic?Constants.settingModel.servicesAboutAr:Constants.settingModel.servicesAboutEn,
                          titleAlign: TextAlign.center,
                          titleHeight: 1.5,
                          titleMaxLines: 10,fontWeightType: FontWeightType.medium,
                          titleSize: FontSize.s14,titleColor: ColorManager.black),
                    ),



                    if(!provider.isLoading&&provider.services.isEmpty)
                      Padding(
                        padding:  EdgeInsets.only(top:0.3.sh),
                        child: NoDataCurrentlyAvailable(message: 'Will be available soon'.tr(),),
                      ),
                    for(var item in provider.services)
                      ServicesItem(service: item),


                    const AppSizeBox(height: AppSize.s25),
                    InkWell(
                        onTap: ()=>
                            MyRoute().navigate(context: context, route:  const TermsOfUseScreen()),
                        child:
                        AppText(
                            title: 'Terms and Conditions'.tr(),
                            titleColor: ColorManager.primary,
                            fontWeightType: FontWeightType.medium,
                            titleSize:FontSize.s20,underline: true)),


                    const AppSizeBox(height: AppSize.s20),
                    InkWell(
                        onTap: ()=>
                            MyRoute().navigate(context: context, route:  const PrivacyPolicyScreen()),
                        child:
                        AppText(
                            title: 'PrivacyPolicy'.tr(),
                            titleColor: ColorManager.primary,
                            fontWeightType: FontWeightType.medium,
                            titleSize:FontSize.s20,underline: true)),

                    const AppSizeBox(height: AppSize.s30),

                    // ServicesItem(title: 'FindPropertyEasily'.tr(), value: 'servicesMessage'.tr(),showSoon: false,image: ImageManager.services1),
                    // ServicesItem(title: 'AdvertisingFeesAndPackages'.tr(), value: 'servicesMessage'.tr(),image: ImageManager.services2),
                    // ServicesItem(title: 'GeometricDesign'.tr(), value: 'servicesMessage'.tr(),image: ImageManager.services3),
                    // ServicesItem(title: 'AdvertisementVideo'.tr(), value: 'servicesMessage'.tr(),image: ImageManager.services4),
                    // ServicesItem(title: 'ConstructionAndContracting'.tr(), value: 'servicesMessage'.tr(),image: ImageManager.services5),
                    // ServicesItem(title: 'ConstructionAccount'.tr(), value: 'servicesMessage'.tr(),image: ImageManager.services6),
                    //
                    //
                    // const AppSizeBox(height: 10,),
                  ],
                ),
              )



          ),
        ),
      )

    );
  }
}
