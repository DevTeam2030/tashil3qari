

class SocialLoginRequestBodyModel {
  SocialLoginRequestBodyModel({
   required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.lang,
    required this.registrationType,
    required this.gender,
    required this.brithDate,
  });

  String firstName;
  String lastName;
  String phone;
  String email;
  String lang;
  String registrationType;
  String gender;
  String brithDate;


  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "phone": phone,
    "email": email,
    "lang": lang,
    "registration_type": registrationType,
    "gender": gender,
    "brith_date": brithDate,
  };
}
