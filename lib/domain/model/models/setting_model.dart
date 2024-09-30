import 'country_model.dart';
import 'finishing_types_model.dart';
import 'home_catogery_model.dart';
import 'searial_number_model.dart';

class SettingModel {
  SettingModel({
    required this.categories,
    required this.countries,
    required this.finishingTypes,
    required this.consultantFess,
    required this.licenseFess,
    required this.countAllAds,
    required this.auctionDurations,
    required this.reasons,
    required this.currencies,
    required this.featuredPlans,
    required this.serialNumbers,
    required this.nationalities,
    required this.appValueAfterSelling,
    required this.servicesAboutEn,
    required this.servicesAboutAr,
    required this.terms,
    required this.policyPrivacy,
    required this.pledgeMessage,
  });
  List<HomeCatogeryModel> categories;
  List<CountryModel> countries;
  List<FinishingTypesModel> finishingTypes;
  List<AuctionDurationsModel> auctionDurations;
  List<ReasonModel> reasons;
  List<CurrencyModel> currencies;
  List<FeaturedPlansModel> featuredPlans;
  List<SerialNumberModel> serialNumbers;
  List<NationalityModel> nationalities;
  double consultantFess;
  double licenseFess;
  double appValueAfterSelling;
  int countAllAds;
  String servicesAboutAr;
  String servicesAboutEn;
  String terms;
  String policyPrivacy;
  String pledgeMessage ;

  factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
    categories: List<HomeCatogeryModel>.from(json["categories"].map((x) => HomeCatogeryModel.fromJson(x))),
    countries: List<CountryModel>.from(json["countries"].map((x) => CountryModel.fromJson(x))),
    finishingTypes: List<FinishingTypesModel>.from(json["finishing_types"].map((x) => FinishingTypesModel.fromJson(x))),
    auctionDurations: List<AuctionDurationsModel>.from(json["auction_durations"].map((x) => AuctionDurationsModel.fromJson(x))),
    reasons: List<ReasonModel>.from(json["reasons"].map((x) => ReasonModel.fromJson(x))),
    currencies: List<CurrencyModel>.from(json["currencies"].map((x) => CurrencyModel.fromJson(x))),
    featuredPlans: List<FeaturedPlansModel>.from(json["featuredPlans"].map((x) => FeaturedPlansModel.fromJson(x))),
    serialNumbers: List<SerialNumberModel>.from(json["serialNmbers"].map((x) => SerialNumberModel.fromJson(x))),
    nationalities: List<NationalityModel>.from(json["nationalities"].map((x) => NationalityModel.fromJson(x))),
    consultantFess : double.tryParse(json["consultant_fess"].toString())??0,
    licenseFess : double.tryParse(json["license_fess"].toString())??0,
    appValueAfterSelling : double.tryParse(json["app_value_after_selling"].toString())??0,
    countAllAds : int.tryParse(json["count_all_ads"].toString())??0,
      servicesAboutAr: json["services_about_ar"]??'',
      servicesAboutEn: json["services_about_en"]??'',
    pledgeMessage : json["pledge_message "]??'',
    terms: json["terms"]??'',
    policyPrivacy: json["policy_privacy"]??'',

  );

}

