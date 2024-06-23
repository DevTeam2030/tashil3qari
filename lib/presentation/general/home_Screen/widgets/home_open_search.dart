part of'widget_imports.dart';



class HomeOpenSearch extends StatefulWidget {
final  HomeData homeData;
  const HomeOpenSearch({super.key,required this.homeData});

  @override
  State<HomeOpenSearch> createState() => _HomeOpenSearchState();
}

class _HomeOpenSearchState extends State<HomeOpenSearch> {
  late CountryModel selectedCountry;
  late CityModel selectedCity;
  AdType? selectedAdType;
  // AdType selectedAdType= AdType.forSale;
  LatLng? currentLocation;
  final ValueNotifier<bool> open = ValueNotifier<bool>(false);
  final formKey = GlobalKey<FormState>();

  late ValueNotifier<HomeCatogeryModel>selectedCategory=ValueNotifier<HomeCatogeryModel>(Constants.settingModel.categories.first);
  TextEditingController lowestPriceController = TextEditingController();
  TextEditingController abovePriceController = TextEditingController();
  TextEditingController spaceController = TextEditingController();
  ValueNotifier<int> floor = ValueNotifier<int>(0);
  ValueNotifier<int> bedrooms = ValueNotifier<int>(0);
  ValueNotifier<int> bathrooms = ValueNotifier<int>(0);
  ValueNotifier<int> kitchen = ValueNotifier<int>(0);
late  ValueNotifier<FinishingTypesModel> finishing;
  @override
  void initState() {
    super.initState();
    selectedCountry= context.read<GeneralProvider>().userCountry;
    selectedCity= context.read<GeneralProvider>().userCity;
    selectedCategory.value=Constants.settingModel.categories.first;
    finishing=finishing = ValueNotifier<FinishingTypesModel>(Constants.settingModel.finishingTypes.first);
  }
  @override
  void dispose() {
    lowestPriceController.dispose();
    abovePriceController.dispose();
    spaceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: widget.homeData.openSearch,
      builder: (context, value, child) =>
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedContainer (
              duration: Duration (seconds: 1),
              // margin: EdgeInsets.only(top: 110),
              padding: const EdgeInsets.symmetric(vertical: PaddingManager.p14,horizontal: PaddingManager.p12),
              width: 1.0.sw,
              constraints: BoxConstraints(
                maxHeight: value?1.0.sh:0,
              ),
              // height: value?280:0,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(RadiusManager.r25),
                  bottomRight: Radius.circular(RadiusManager.r25),
                ),
                color: ColorManager.white,
                // boxShadow: Constants.kBoxShadow
              ),
              child:!value?  const AppSizeBox(width: 0,): SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppSizeBox(height: AppSize.s14,),


                    SearchSelectLocationButton(
                      selectedCity: selectedCity,
                      selectedCountry: selectedCountry,
                      onTap: (country,city,location){
                        selectedCountry=country;
                        selectedCity=city;
                        currentLocation=location;
                        setState(() {});
                      }
                    ),
                    const AppSizeBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p8),
                          child: AppText(
                            title: 'Property type'.tr(),
                            titleSize: FontSize.s14,
                            titleAlign: TextAlign.start,
                            titleColor: ColorManager.black,
                            fontWeightType: FontWeightType.medium,
                          ),
                        ),
                        ForSaleOrRentDropdownButton(
                          hint: 'saleRent'.tr(),
                          selectedType:  selectedAdType,
                          color: ColorManager.textGrey,
                          borderColor: ColorManager.grey,
                          onChanged: (type) async{
                            selectedAdType;
                          },
                        ),
                      ],
                    ),
                    const AppSizeBox(height: AppSize.s14,),
                    TypesFilter(
                      abovePriceController: abovePriceController,
                      bathrooms: bathrooms,
                      bedrooms: bedrooms,
                      finishing: finishing,
                      floor: floor,
                      kitchen: kitchen,
                      lowestPriceController: lowestPriceController,
                      spaceController: spaceController,
                      formKey: formKey,
                      open: open,
                      selectedCategory: selectedCategory,
                    ),



                    const AppSizeBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyTextButton(title: 'Search num ads'.tr().replaceFirst('num', Constants.settingModel.countAllAds.toString()),
                            size: Size( .8.sw,  47),
                            radius: 6,
                            fontWeightType: FontWeightType.bold,
                            titleSize: FontSize.s18,
                            primaryColor: ColorManager.primary,
                            titleColor: ColorManager.white,
                            onPressed: ()async{
                              widget.homeData.openSearch.value=false;
                              widget.homeData.selectedCategory.value=selectedCategory.value;
                              widget.homeData.showCitiesMarkers=false;
                              // context.read<GeneralProvider>().mapCountry=selectedCountry;
                              // context.read<GeneralProvider>().mapCity=selectedCity;
                              await context.read<HomeProvider>().getProperties(context: context,
                                  forSale: selectedAdType==AdType.forSale,
                                  forRent: selectedAdType==AdType.forRent,
                                  cityId: selectedCity.id,categoryId: selectedCategory.value.id,
                              isNotify: true,
                                  isAuction: widget.homeData.showAuctionOnMap.value,
                                  floor: floor.value,
                                  bathroomsNo: bathrooms.value,
                                  roomsNo: bedrooms.value,
                                  propertySize: spaceController.text.isEmpty?null:double.parse(spaceController.text),
                                  minPrice: lowestPriceController.text.isEmpty?null:double.parse(lowestPriceController.text),
                                  maxPrice: abovePriceController.text.isEmpty?null:double.parse(abovePriceController.text),
                                  finishingTypeId: finishing.value.id

                              ).then((value) =>
                                  widget.homeData.initPropertiesMarkers(context: context));

                            }),
                      ],
                    ),


                    const AppSizeBox(height: AppSize.s14,),


                  ],
                ),
              ),
            ),
          ),);
  }
}

