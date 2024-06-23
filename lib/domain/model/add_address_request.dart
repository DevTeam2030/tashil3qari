
class AddAddressRequest {
  AddAddressRequest({
    required this.cityId,
    required this.countryId,
    required this.addressName,
    required this.apt,
    required this.district,
    required this.type,
    required this.longitude,
    required this.latitude,
    required this.primaryAddress,
  });

  int? cityId;
  int countryId;
  String addressName;
  String apt;
  String district;
  String type;
  String longitude;
  String latitude;
  int primaryAddress;

  factory AddAddressRequest.fromJson(Map<String, dynamic> json) => AddAddressRequest(
    countryId: json["country_id"],
    cityId: json["city_id"],
    addressName: json["address_name"],
    apt: json["apt"],
    district: json["district"],
    type: json["type"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    primaryAddress: json["primary_address"],
  );

  Map<String, dynamic> toJson() => {
    "city_id": cityId,
    "address_name": addressName,
    "apt": apt,
    "district": district,
    "type": type,
    "longitude": longitude,
    "latitude": latitude,
    "primary_address": primaryAddress,
  };
}


class EditAddressRequest {
  EditAddressRequest({
    required this.addressId,
    required this.cityId,
    required this.countryId,
    required this.addressName,
    required this.apt,
    required this.district,
    required this.type,
    required this.longitude,
    required this.latitude,
    required this.primaryAddress,
  });

  int addressId;
  int? cityId;
  int countryId;
  String addressName;
  String apt;
  String district;
  String type;
  String longitude;
  String latitude;
  int primaryAddress;

  factory EditAddressRequest.fromJson(Map<String, dynamic> json) => EditAddressRequest(
    addressId: json["address_id"],
    countryId: json["country_id"],
    cityId: json["city_id"],
    addressName: json["address_name"],
    apt: json["apt"],
    district: json["district"],
    type: json["type"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    primaryAddress: json["primary_address"],
  );

  Map<String, dynamic> toJson() => {
    "address_id": addressId,
    "city_id": cityId,
    "country_id": countryId,
    "address_name": addressName,
    "apt": apt,
    "district": district,
    "type": type,
    "longitude": longitude,
    "latitude": latitude,
    "primary_address": primaryAddress,
  };
}
