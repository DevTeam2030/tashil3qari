
import 'package:tashil_agary/app/enums.dart';

class UserDataModel {
  String accessToken;
  String tokenType;
  int expiresIn;
  int id;
  String firstName;
  String lastName;
  String email;
  String phone;
  String lang;
  String registrationType;
  String licenseNumber;
  String idNumber;
  String nationalityId;
  String nationality;
  String image;
  UserType type;
  bool isActive;
  bool isCompletedProfile;
  bool isCompletedAddress;
  String longitude;
  String latitude;
  String des;
  bool isUser;
  bool documented;
  List<UserAddressModel> address;




  UserDataModel({
  required this.accessToken,
  required this.tokenType,
  required this.expiresIn,
  required this.id,
  required this.firstName,
  required this.lastName,
  required this.email,
  required this.phone,
  required this.lang,
  required this.registrationType,
  required this.licenseNumber,
  required this.idNumber,
  required this.nationality,
  required this.nationalityId,
  required this.image,
    required this.type,
    required this.isActive,
    required this.longitude,
    required this.latitude,
    required this.isUser,
    required this.address,
    required this.isCompletedProfile,
    required this.isCompletedAddress,
    required this.des,
    required this.documented,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
  accessToken: json["access_token"],
  tokenType: json["token_type"]??'',
  expiresIn: json["expires_in"]??'',
  id: json["id"],
  firstName: json["first_name"]??'',
  lastName: json["last_name"]??'',
  email: json["email"]??'',
  phone: json["phone"]??'',
  lang: json["lang"]??'ar',
  registrationType: json["registration_type"]??'email',
  licenseNumber: json["license_number"]??'',
  idNumber: json["id_number"]??'',
  nationality: json["nationality"]??'',
    nationalityId: json["nationality_id"].toString(),
  image: json["image"]??'',
      type: json["type"]=='normal'?UserType.user:UserType.consultant,
    isUser: json["type"]=='normal',
      isActive: json["is_active"]??false,
    documented: json["documented"]??false,
    isCompletedProfile: json["is_completed_profile"]??false,
    isCompletedAddress: json["is_completed_address"]??false,
      longitude: json["longitude"]??'0',
      latitude: json["latitude"]??'0',
    des: json["des"]??'',
    address: List<UserAddressModel>.from(json["address"].map((x) => UserAddressModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
  "access_token": accessToken,
  "token_type": tokenType,
  "expires_in": expiresIn,
  "id": id,
  "first_name": firstName,
  "last_name": lastName,
  "email": email,
  "phone": phone,
  "lang": lang,
  "registration_type": registrationType,
  "license_number": licenseNumber,
  "id_number": idNumber,
  "nationality": nationality,
  "image": image,
  "type": type==UserType.user?'normal':"consultant",
  "is_active": isActive,
  "documented": documented,
  "is_completed_profile": isCompletedProfile,
  "is_completed_address": isCompletedAddress,
  "longitude": longitude,
  "latitude": latitude,
  "is_user": isUser,
  "des": des,
  "address": List<dynamic>.from(address.map((x) => x.toJson())),

  };
  }


class UserAddressModel {
  int cityId;
  String cityName;
  int countryId;
  String countryName;
  String longitude;
  String latitude;

  UserAddressModel({
    required this.cityId,
    required this.cityName,
    required this.countryId,
    required this.countryName,
    required this.longitude,
    required this.latitude,
  });

  factory UserAddressModel.fromJson(Map<String, dynamic> json) => UserAddressModel(
    cityId: json["city_id"]??0,
    cityName: json["city_name"]??'',
    countryId: json["country_id"]??0,
    countryName: json["country_name"]??'',
    longitude: double.tryParse(json["longitude"].toString())!=null?json["longitude"].toString():'0',
    latitude: double.tryParse(json["latitude"].toString())!=null?json["latitude"].toString():'0',
  );

  Map<String, dynamic> toJson() => {
    "city_id": cityId,
    "city_name": cityName,
    "country_id": countryId,
    "country_name": countryName,
    "longitude": longitude,
    "latitude": latitude,
  };
}