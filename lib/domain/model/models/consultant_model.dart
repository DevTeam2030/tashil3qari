
class ConsultantModel {
  int id;
  String name;
  String image;
  String phone;
  String licenseNumber;
  String city;
  int cityId;
  int countryId;
  String country;
  String serialCode;
  int countAds;
  double rate;
  bool canRate  ;
  bool dealingConsultant;

  ConsultantModel({
    required this.id,
    required this.name,
    required this.image,
    required this.phone,
    required this.licenseNumber,
    required this.city,
    required this.cityId,
    required this.country,
    required this.countAds,
    required this.rate,
    required this.dealingConsultant,
    required this.countryId,
    required this.serialCode,
    required this.canRate,
  });

  factory ConsultantModel.fromJson(Map<String, dynamic> json) => ConsultantModel(
    id: json["id"],
    name: json["name"]??'',
    image: json["image"]??'',
    phone: json["phone"]??'',
    licenseNumber: json["license_number"]??'',
    city: json["city"]??'',
      cityId: json["city_id"]??0,
      countryId: json["country_id"]??0,
    country: json["country"]??'',
    serialCode: json["serial_code"]??'',
    countAds: json["count_ads"]??0,
      canRate: json["can_rate  "].toString()=='true'||json["can_rate  "].toString()=='1'?true:false,
      dealingConsultant: json["dealingConsultant"]??false,
    rate: double.tryParse(json["rate"].toString())??0.0
  );


}
