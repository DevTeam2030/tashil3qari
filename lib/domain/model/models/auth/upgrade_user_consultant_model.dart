// upgrade_user_consultant_model

import '../register_request_body.dart';

class UpgradeUserConsultantModel {
  String licenseNumber;
  String serialNumber;
  String des;
  List<RegisterCityModel> addresses;

  UpgradeUserConsultantModel({
    required this.licenseNumber,
    required this.serialNumber,
    required this.des,
    required this.addresses,
  });



  Map<String, dynamic> toJson() => {
    "license_number": licenseNumber,
    "serial_number": serialNumber,
    "des": des,
    "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),

  };
}


