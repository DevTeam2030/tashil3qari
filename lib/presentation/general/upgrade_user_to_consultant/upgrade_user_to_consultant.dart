part of'upgrade_user_to_consultant_imports.dart';

class UpgradeUserToConsultantScreen extends StatefulWidget {
  const UpgradeUserToConsultantScreen({super.key});

  @override
  State<UpgradeUserToConsultantScreen> createState() => _UpgradeUserToConsultantScreenState();
}

class _UpgradeUserToConsultantScreenState extends State<UpgradeUserToConsultantScreen> {
 final UpgradeUserToConsultantData upgradeData=UpgradeUserToConsultantData();

  @override
  void initState() {
    super.initState();

      for(var item in Constants.settingModel.countries){
        if(item.cities.isEmpty)break;
        if(!upgradeData.selectedCountries.contains(item)){
          upgradeData.selectedCountries.add(item);
          upgradeData.selectedCities.add(CityCountryModel(id: item.cities.first.id,
              countryId: item.id, name: item.cities.first.name));
          break;
        }
      }


  }

  @override
  void dispose() {
    upgradeData.licenseNumberController.dispose();
    upgradeData.desController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: 'upgradeTpConsultant'.tr(),showLogo: false,
        showBackICon: true,  titleColor: ColorManager.primary,),
      body: Consumer<AuthProvider>(
        builder: (context, provider, child) => ScreenLoading(
          isLoading: provider.isLoading,
          height: 1.0.sh,
          width: 1.0.sw,
          child:Container(
            height: 1.0.sh,
            width: 1.0.sw,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Form(
              key: upgradeData.formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const AppSizeBox(height: AppSize.s30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BarTitleValue(
                            title: 'AddYourSite'.tr(),
                            subtitle:'locationRealEstateMessage'.tr() ,
                            width: .75.sw,
                          ),
                        ],
                      ),
                    ),

                    const AppSizeBox(height: AppSize.s10),
                    for(var country in upgradeData.selectedCountries)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Column(
                          children: [

                            RealStateAddCountryDropdownButton(
                              selectedCountry: country,
                              selectedCities:upgradeData.selectedCities,
                              onSelectedCity: (v) {
                                if(v==null)return;
                                if(upgradeData.selectedCities.contains(v)){
                                  upgradeData.selectedCities.remove(v);
                                }else{
                                  upgradeData.selectedCities.add(v);
                                }
                                provider.notify();


                              },
                            ),
                            for(var item in upgradeData.selectedCities.where((element) => element.countryId==country.id))
                              SelectedCityWidget(
                                city: item,
                                onRemove: (){
                                  upgradeData.selectedCities.remove(item);
                                  provider.notify();
                                },
                              )
                          ],
                        ),
                      ),


                    const AppSizeBox(height: AppSize.s10),
                    DefaultTextFormField(
                      controller: upgradeData.licenseNumberController,
                      hintTitle: 'licenseNumber'.tr(),
                      labelTitle: 'licenseNumber'.tr(),
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text,
                      hintFontSize: FontSize.s12,
                      hintStyle: getAppTextStyle(titleColor: ColorManager.icons, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                      textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s16,underline: false),
                      textSize: FontSize.s12,
                      fillColor: ColorManager.textGrey,
                      borderColor: ColorManager.textGrey,
                      // borderRadius: RadiusManager.r10,
                      // prefixIcon: const Icon(Icons.email_outlined,color: ColorManager.icons,size: AppSize.s20,),
                      validator: (v) => Validator().validateEmpty(value: v.toString(),),
                    ),

                    const AppSizeBox(height: AppSize.s10),
                    MoreLineTextFormField(
                      controller: upgradeData.desController,
                      hintTitle: 'aboutYou'.tr(),
                      labelTitle: 'aboutYou'.tr(),
                      textInputType: TextInputType.multiline,
                      textInputAction: TextInputAction.next,
                      hintFontSize: FontSize.s12,
                      hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                      textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                      textSize: FontSize.s12,
                      fillColor: ColorManager.textGrey,
                      borderColor: ColorManager.textGrey,
                      maxLines: 3,
                      // borderRadius: RadiusManager.r10,
                      // prefixIcon: const Icon(Icons.phone,color: ColorManager.icons,size: AppSize.s20,),
                      validator: (v) => Validator().validateEmpty(value: v.toString(),),
                    ),
                    const AppSizeBox(height: AppSize.s10),

                    ValueListenableBuilder(valueListenable: upgradeData.selectedSerialNumber,
                      builder: (context, value, child) =>   SerialNumbersDropdownButton(
                        selectedSerialNumber: upgradeData.selectedSerialNumber.value,
                        onChanged: (selectedSerialNumber)=>upgradeData.selectedSerialNumber.value=selectedSerialNumber,
                      ),),



                    const AppSizeBox(height: AppSize.s20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyTextButton(title: 'upgradeTpConsultant'.tr(),
                            size: Size( .65.sw,  42),
                            radius: 8,
                            fontWeightType: FontWeightType.medium,
                            titleSize: FontSize.s18,
                            primaryColor: ColorManager.primary,
                            titleColor: ColorManager.white,
                            onPressed: ()=>upgradeData.upgrade(context: context)),
                      ],
                    ),
                  ],
                ),
              ),
            ),

          ),
        ),
      ),

    );
  }


}
