part of 'council_imports.dart';

class CouncilData{
  var selectedCountry= Constants.settingModel.countries.first;
  List<CityModel> cities= Constants.settingModel.countries.first.cities;
  CityModel? selectedCity;
  final newsFormKey = GlobalKey<FormState>();
  final opportunityFormKey = GlobalKey<FormState>();
  TextEditingController newsController = TextEditingController();
  TextEditingController opportunityController = TextEditingController();
  TextEditingController opportunityDesController = TextEditingController();
  XFile? opportunityPicker;


}