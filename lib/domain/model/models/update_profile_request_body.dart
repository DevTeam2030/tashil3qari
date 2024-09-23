

class UpdateProfileRequestModel {
  UpdateProfileRequestModel({
   required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.des,
    required this.licenseNumber,
    required this.idNumber,
    required this.nationality,
    // required this.image,


  });

  String firstName;
  String lastName;
  String email;
  String phone;
  String des;
  String licenseNumber;
  String idNumber;
  String nationality;
  // File? image;


  Map<String, dynamic> toJson() => {
    "first_name":firstName,
    "last_name": lastName,
    "email": email,
    "phone": phone,
    "id_number": idNumber,
    "des": des,
    "license_number": licenseNumber,
    "nationality": nationality,
    // "image": image,
  };
}

