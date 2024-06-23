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
  }


  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: HomeBuildAppBar(homeData: homeData,showFilter: false,fromHeight: 70),
      body:Container(
        height: 1.0.sh,
        width: 1.0.sw,
        padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Padding(
              padding:  EdgeInsets.only(top:0.3.sh),
              child: NoDataCurrentlyAvailable(message: 'Will be available soon'.tr(),),
            )
            // AppText(
            //     title: 'Our services'.tr(),
            //     titleAlign: TextAlign.start,
            //     titleMaxLines: 1,fontWeightType: FontWeightType.bold,
            //     titleSize: FontSize.s14,titleColor: ColorManager.black),
            //
            // const AppSizeBox(height: 14,),
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
        )



      ),
    );
  }
}
