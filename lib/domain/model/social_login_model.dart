
class SocialLoginModel {
  SocialLoginModel({
    required this.email,
    required this.google,
    required this.apple,
    required this.facebook,
  });

  bool email;
  bool google;
  bool apple;
  bool facebook;

  factory SocialLoginModel.fromJson(Map<String, dynamic> json) => SocialLoginModel(
    email: json["email"],
    google: json["google"],
    apple: json["apple"],
    facebook: json["facebook"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "google": google,
    "apple": apple,
    "facebook": facebook,
  };
}

