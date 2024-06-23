
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/utils.dart';

class AddressModel {
  AddressModel({
    required this.id,
    required this.cityId,
    required this.city,
    required this.country,
    required this.countryId,
    required this.addressName,
    required this.apt,
    required this.type,
    required this.district,
    required this.longitude,
    required this.latitude,
    required this.primaryAddress,
  });

  int id;
  String cityId;
  String primaryAddress;
  String city;
  String countryId;
  String country;
  String addressName;
  String apt;
  AddressType type;
  String district;
  String longitude;
  String latitude;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    id: json["id"],
    primaryAddress: json["primary_address"]??'0',
    cityId: json["city_id"]??0,
    city: json["city"].toString(),
    country: json["country"]??'',
    countryId: json["country_id"].toString(),
    addressName: json["address_name"]??'',
    apt: json["apt"]??'',
    type: Utils.getAddressType(type: json["type"]??''),
    district: json["district"]??'',
    longitude: json["longitude"]??'0',
    latitude: json["latitude"]??'0',
  );

  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "city_id": cityId,
  //   "address_name": addressName,
  //   "apt": apt,
  //   "type": type,
  //   "district": district,
  //   "longitude": longitude,
  //   "latitude": latitude,
  // };
}
