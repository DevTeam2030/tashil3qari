import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/buttons/text_button.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/providers/search_provider.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/route_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';
import '../../../../domain/model/models/country_model.dart';
import '../../../../domain/model/models/finishing_types_model.dart';
import '../../../../domain/model/models/home_catogery_model.dart';
import '../../../../providers/general_provider.dart';
import '../../home_Screen/home_imports.dart';
import '../../home_Screen/widgets/widget_imports.dart';

class SearchFilterBottomSheet extends StatefulWidget {
  final ValueNotifier<HomeCatogeryModel?> selectedCategory;
  const SearchFilterBottomSheet({Key? key,required this.selectedCategory}) : super(key: key);

  @override
  State<SearchFilterBottomSheet> createState() => _SearchFilterBottomSheetState();
}

class _SearchFilterBottomSheetState extends State<SearchFilterBottomSheet> {
  AdType selectedAdType= AdType.forSale;
  // HomeData homeData=HomeData();
  late CountryModel selectedCountry;
  late CityModel selectedCity;
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
  ValueNotifier<int> floorsNo = ValueNotifier<int>(0);
  late  ValueNotifier<FinishingTypesModel> finishing;
  TextEditingController streetWidthController = TextEditingController();
  ValueNotifier<int> receptionsNo = ValueNotifier<int>(0);
  ValueNotifier<int> apartmentsNo = ValueNotifier<int>(0);
  ValueNotifier<int> storesNo = ValueNotifier<int>(0);
  ValueNotifier<int> buildingAge = ValueNotifier<int>(0);
  ValueNotifier<String> direction = ValueNotifier<String>('east');
  @override
  void initState() {
    super.initState();    selectedCountry= context.read<GeneralProvider>().userCountry;
    selectedCity= context.read<GeneralProvider>().userCity;
    selectedCategory.value=widget.selectedCategory.value==null?Constants.settingModel.categories.first:widget.selectedCategory.value!;
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
    return  Material(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(RadiusManager.r20),
          topRight: Radius.circular(RadiusManager.r20),
        ),
        color: ColorManager.white,
        child: Container(
          padding: const EdgeInsets.all(PaddingManager.p20),
          // height:  .75.sh,
          width:  1.0.sw,

          constraints: BoxConstraints(
            maxHeight: .8.sh,
            minHeight: .2.sh,
          ),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(RadiusManager.r20),
              topRight: Radius.circular(RadiusManager.r20),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AppSizeBox(height: AppSize.s20,),

            //     Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p8),
            //       child: Row(
            //         children: [
            //           AppText(
            //             title: 'Region'.tr(),
            //             titleSize: FontSize.s14,
            //             titleAlign: TextAlign.start,
            //             titleColor: ColorManager.black,
            //             fontWeightType: FontWeightType.medium,
            //           ),
            //         ],
            //       ),
            //     ),
            //
            // const AppSizeBox(
            //     height: 8
            // ),

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

            if(false)
            Container(
              padding: const EdgeInsets.symmetric(vertical: PaddingManager.p10, horizontal: PaddingManager.p16),
              width: 1.0.sw,
              // height: value ? 280 : 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(RadiusManager.r12),
                border: Border.all(color: ColorManager.grey, width: 1),
                color: ColorManager.textGrey,
                // boxShadow: Constants.kBoxShadow
              ),
              child: InkWell(
                onTap: () {
                  MyRoute().navigate(context: context, route:  SearchLocationScreen(
                    onTap: (country,city,location){
                      selectedCountry=country;
                      selectedCity=city;
                      currentLocation=location;
                      setState(() {});}
                  ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: ColorManager.icons,
                          size: 16,
                        ),
                        AppSizeBox(
                          width: 4,
                        ),
                        AppText(
                          title: 'المدينه الرياض- مكة',
                          titleSize: FontSize.s14,
                          titleAlign: TextAlign.start,
                          titleHeight: 1.4,
                          titleMaxLines: 4,
                          titleColor: ColorManager.black,
                          fontWeightType: FontWeightType.medium,
                        ),
                      ],
                    ),

                    AppText(
                      title: 'otherPlace'.tr(),
                      titleSize: FontSize.s14,
                      titleAlign: TextAlign.start,
                      titleHeight: 1.4,
                      titleMaxLines: 4,
                      titleColor: ColorManager.primary,
                      fontWeightType: FontWeightType.medium,
                    ),
                  ],
                ),
              ),
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
                  floorsNo: floorsNo,
                  streetWidthController: streetWidthController,
                ),

                const AppSizeBox(height: 20,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyTextButton(title: 'ApplyFilter'.tr(),
                        size: Size( .8.sw,  47),
                        radius: 6,
                        fontWeightType: FontWeightType.bold,
                        titleSize: FontSize.s18,
                        primaryColor: ColorManager.primary,
                        titleColor: ColorManager.white,
                        onPressed: ()async{
                      Navigator.pop(context);
                      widget.selectedCategory.value=selectedCategory.value;

                          await context.read<SearchProvider>().getProperties(
                              context: Constants.navigatorAppKey.currentContext!,
                              cityId: selectedCity.id,categoryId: selectedCategory.value.id,
                              isNotify: true,
                              forSale: selectedAdType==AdType.forSale,
                              forRent: selectedAdType==AdType.forRent,
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
                            floorsNo:!selectedCategory.value.options.floorsNo?0:  floorsNo.value,
                            streetWidth:!selectedCategory.value.options.streetWidth?0: streetWidthController.text.isEmpty?0:double.tryParse(streetWidthController.text)??0,


                          );

                        }),
                  ],
                ),
                const AppSizeBox(height: 20,),
              ],
            ),
          )),

    );
  }
}
