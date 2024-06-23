
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
  });

  factory ConsultantModel.fromJson(Map<String, dynamic> json) => ConsultantModel(
    id: json["id"],
    name: json["name"]??'',
    image: json["image"]??'',
    phone: json["phone"]??'',
    licenseNumber: json["license_number"]??'',
    city: json["city"]??'',
      cityId: json["city_id"],
      countryId: json["country_id"],
    country: json["country"]??'',
    serialCode: json["serial_code"]??'',
    countAds: json["count_ads"]??0,
      dealingConsultant: json["dealingConsultant"]??false,
    rate: double.tryParse(json["rate"].toString())??0.0
  );


}
