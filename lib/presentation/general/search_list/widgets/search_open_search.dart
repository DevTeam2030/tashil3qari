import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

import '../../../../app/contants.dart';
import '../../../../components/buttons/text_button.dart';
import '../../../../domain/model/models/country_model.dart';
import '../../../../domain/model/models/finishing_types_model.dart';
import '../../../../domain/model/models/home_catogery_model.dart';
import '../../../../providers/general_provider.dart';
import '../../../../providers/search_provider.dart';
import '../../home_Screen/widgets/widget_imports.dart';
import '../search_list_data.dart';


class SearchOpenSearch extends StatefulWidget {
final  SearchListData searchListData;
  const SearchOpenSearch({super.key,required this.searchListData});

  @override
  State<SearchOpenSearch> createState() => _SearchOpenSearchState();
}

class _SearchOpenSearchState extends State<SearchOpenSearch> {
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
  TextEditingController streetWidthController = TextEditingController();
  ValueNotifier<int> receptionsNo = ValueNotifier<int>(0);
  ValueNotifier<int> apartmentsNo = ValueNotifier<int>(0);
  ValueNotifier<int> storesNo = ValueNotifier<int>(0);
  ValueNotifier<int> buildingAge = ValueNotifier<int>(0);
  ValueNotifier<String> direction = ValueNotifier<String>('east');
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
    streetWidthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: widget.searchListData.openSearch,
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
                      storesNo: storesNo,
                      receptionsNo: receptionsNo,
                      apartmentsNo: apartmentsNo,
                      buildingAge: buildingAge,
                      direction: direction,
                      streetWidthController: streetWidthController,
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
                              widget.searchListData.openSearch.value=false;
                              widget.searchListData.selectedCategory.value=selectedCategory.value;
                              // context.read<GeneralProvider>().mapCountry=selectedCountry;
                              // context.read<GeneralProvider>().mapCity=selectedCity;
                              await context.read<SearchProvider>().getProperties(context: context,
                                  forSale: selectedAdType==AdType.forSale,
                                  forRent: selectedAdType==AdType.forRent,
                                  cityId: selectedCity.id,categoryId: selectedCategory.value.id,
                              isNotify: true,
                                  isAuction: widget.searchListData.isAuction.value,
                                  propertySize: spaceController.text.isEmpty?null:double.parse(spaceController.text),
                                  minPrice: lowestPriceController.text.isEmpty?null:double.parse(lowestPriceController.text),
                                  maxPrice: abovePriceController.text.isEmpty?null:double.parse(abovePriceController.text),

                                bathroomsNo:!selectedCategory.value.options.bathroomsNo?0: bathrooms.value,
                                roomsNo: !selectedCategory.value.options.roomsNo?0: bedrooms.value,
                                kitchensNo: !selectedCategory.value.options.kitchensNo?0: kitchen.value,
                                finishingTypeId: finishing.value.id,
                                floor: !selectedCategory.value.options.floor?0: floor.value,
                                apartmentsNo: !selectedCategory.value.options.apartmentsNo?0: apartmentsNo.value,
                                buildingAge:!selectedCategory.value.options.buildingAge?0: buildingAge.value ,
                                direction:!selectedCategory.value.options.direction?'': direction.value ,
                                receptionsNo: !selectedCategory.value.options.receptionsNo?0: receptionsNo.value,
                                storesNo:!selectedCategory.value.options.storesNo?0:  storesNo.value,
                                streetWidth:!selectedCategory.value.options.streetWidth?0: streetWidthController.text.isEmpty?0:double.tryParse(streetWidthController.text)??0,


                              );

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

