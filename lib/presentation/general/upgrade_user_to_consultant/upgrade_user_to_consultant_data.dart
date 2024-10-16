part of'upgrade_user_to_consultant_imports.dart';


class UpgradeUserToConsultantData{
  final formKey = GlobalKey<FormState>();
  TextEditingController licenseNumberController = TextEditingController();
  TextEditingController desController = TextEditingController();
  ValueNotifier<SerialNumberModel?> selectedSerialNumber = ValueNotifier<SerialNumberModel?>(null);
  List<CountryModel>selectedCountries =[];
  List<CityCountryModel>selectedCities =[];
  LatLng currentLocation =  LatLng(23.8859, 45.0792);


  upgrade({required BuildContext context}){
    FocusScope.of(context).requestFocus(FocusNode());
    if(formKey.currentState!.validate()){
        if(selectedSerialNumber.value==null||selectedSerialNumber.value!.booked){
          LoadingDialog.showSimpleToast('ChooseSerialNumberMessge'.tr());
          return;
        }
        if(selectedCities.isEmpty){
          LoadingDialog.showSimpleToast('PleaseEnterCountriesCities'.tr());
          return;
        }



        UpgradeUserConsultantModel model = UpgradeUserConsultantModel(
            des: desController.text,
            licenseNumber: licenseNumberController.text,
            serialNumber: selectedSerialNumber.value!.serialNumber,
            addresses: selectedCities.map((e) => RegisterCityModel(
              cityId: e.id,
              longitude: currentLocation.longitude.toString(),
              latitude: currentLocation.latitude.toString(),
            )).toList());
        context.read<AuthProvider>().requestConsultant(context: context, model: model);

  }
  }
}