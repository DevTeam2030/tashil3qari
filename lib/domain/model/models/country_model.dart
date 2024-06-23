


class CountryModel {
  int id;
  String name;
  String countryCode;
  String mobileNo;
  String currency;
  String timeZone;
  List<CityModel> cities;

  CountryModel({
    required this.id,
    required this.name,
    required this.countryCode,
    required this.mobileNo,
    required this.currency,
    required this.timeZone,
    required this.cities,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
    id: json["id"],
    name: json["name"]??'',
    countryCode: json["country_code"]??'',
    mobileNo: json["mobile_no"]??'',
    currency: json["currency"]??'',
    timeZone: json["time_zone"]??'',
    cities: List<CityModel>.from(json["cities"].map((x) => CityModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country_code": countryCode,
    "mobile_no": mobileNo,
    "currency": currency,
    "time_zone": timeZone,
    "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
  };
}


class CityModel {
  int id;
  String name;
  double longitude;
  double latitude;
  String image;
  CityModel({
    required this.id,
    required this.name,
    required this.longitude,
    required this.latitude,
    required this.image,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    id: json["id"],
    name: json["name"]??'',
    longitude: double.tryParse(json["longitude"]??'0')??0,
    latitude: double.tryParse(json["latitude"]??'0')??0,
    image: json["image"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "longitude": longitude,
    "latitude": latitude,
    "image": image,
  };
}
class CityCountryModel {
  int id;
  int countryId;
  String name;

  CityCountryModel({
    required this.id,
    required this.countryId,
    required this.name,
  });

  factory CityCountryModel.fromJson(Map<String, dynamic> json) => CityCountryModel(
    id: json["id"],
    countryId:0,
    name: json["name"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}