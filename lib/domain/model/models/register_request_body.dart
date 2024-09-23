


import 'dart:io';

import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/utils.dart';

class RegisterRequestModel {
  RegisterRequestModel({
   required this.userType,
    required this.email,
    required this.nationality,
    required this.licenseNumber,
    required this.idNumber,
    required this.registrationType,
    required this.password,
    required this.passwordConfirmation,
    required this.lang,
    required this.serialNumber,
    required this.image,
    required this.phone,
    required this.firstName,
    required this.lastName,
    required this.des,
  });

  UserType userType;
  String email;
  String nationality;
  String idNumber;
  String licenseNumber;
  RegisterType registrationType;
  String password;
  String passwordConfirmation;
  String lang;
  String serialNumber;
  File image;
  String phone;
  String firstName;
  String des;
  String lastName;



  Map<String, dynamic> toJson() => {
    "type": userType==UserType.user?"normal":"consultant",
    "email": email,
    "nationality": nationality,
    "id_number": idNumber,
    "license_number": licenseNumber,
    "registration_type": Utils.getRegistrationTypeString(registerType: registrationType),
    "password":password,
    "password_confirmation":passwordConfirmation,
    "lang":lang,
    "serial_number":serialNumber,
    "phone":phone,
    "first_name":firstName,
    "last_name":lastName,
    "des":des,
    "image":image,


  };
}

class UpdatePhoneRequestModel {
  UpdatePhoneRequestModel({
    required this.id,
    required this.image,
    required this.phone,
    required this.firstName,
    required this.lastName,
    required this.des,

  });

  int id;
  File image;
  String phone;
  String firstName;
  String des;
  String lastName;



  Map<String, dynamic> toJson() => {
    "id": id,
    "image":image,
    "phone":phone,
    "first_name":firstName,
    "last_name":lastName,
    "des":des,
  };
}

class UpdateLocationRequestModel {
  UpdateLocationRequestModel({
    required this.id,
    required this.addresses

  });

int id;
  List<RegisterCityModel> addresses;
  Map<String, dynamic> toJson() => {
    "id": id,
    "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),

  };
}
class UpdateUserLocationRequestModel {
  UpdateUserLocationRequestModel({
    required this.id,
    required this.addresses

  });

int id;
  List<RegisterUserCityModel> addresses;
  Map<String, dynamic> toJson() => {
    "id": id,
    "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),

  };
}
class RegisterRequestBodyModel {
  RegisterRequestBodyModel({
    required this.userType,
    required this.email,
    required this.nationality,
    required this.idNumber,
    required this.registrationType,
    required this.password,
    required this.passwordConfirmation,
    required this.image,
    required this.phone,
    required this.firstName,
    required this.lastName,
    required this.lang,
    required this.addresses

  });

  UserType userType;
  String email;
  String nationality;
  String idNumber;
  RegisterType registrationType;
  String password;
  String passwordConfirmation;
  File image;
  String phone;
  String firstName;
  String lastName;
  String lang;
  List<RegisterCityModel> addresses;


  Map<String, dynamic> toJson() => {
    "type": userType==UserType.user?"normal":"consultant",
    "email": email,
    "nationality": nationality,
    "id_number": idNumber,
    "registration_type": Utils.getRegistrationTypeString(registerType: registrationType),
    "password":password,
    "password_confirmation":passwordConfirmation,
    "image":image,
    "phone":phone,
    "first_name":firstName,
    "last_name":lastName,
    "lang":lang,
    "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),

  };
}



class RegisterUserCityModel {

  String longitude;
  String latitude;

  RegisterUserCityModel({

    required this.longitude,
    required this.latitude,
  });

  factory RegisterUserCityModel.fromJson(Map<String, dynamic> json) => RegisterUserCityModel(
    longitude: json["longitude"],
    latitude: json["latitude"],
  );

  Map<String, dynamic> toJson() => {
    "longitude": longitude,
    "latitude": latitude,
  };
}
class RegisterCityModel {
  int cityId;
  String longitude;
  String latitude;

  RegisterCityModel({
    required this.cityId,
    required this.longitude,
    required this.latitude,
  });

  factory RegisterCityModel.fromJson(Map<String, dynamic> json) => RegisterCityModel(
    cityId: json["city_id"],
    longitude: json["longitude"],
    latitude: json["latitude"],
  );

  Map<String, dynamic> toJson() => {
    "city_id": cityId,
    "longitude": longitude,
    "latitude": latitude,
  };
}

class SocialLoginAndRegisterRequestBodyModel {
  SocialLoginAndRegisterRequestBodyModel({
   required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.lang,
    required this.registrationType,
    required this.gender,
    required this.fcmToken,
  });

  String firstName;
  String lastName;
  String phone;
  String email;
  String password;
  String passwordConfirmation;
  String lang;
  String registrationType;
  String gender;
  String fcmToken;


  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "phone": phone,
    "email": email,
    "password": password,
    "password_confirmation": passwordConfirmation,
    "lang": lang,
    "registration_type": registrationType,
    "gender": gender,
    "fcm_token": fcmToken,
  };
}
