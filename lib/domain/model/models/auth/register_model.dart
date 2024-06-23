
import 'package:tashil_agary/app/enums.dart';

class RegisterModel {
  int id;
  String email;
  String phone;
  UserType type;

  RegisterModel({
    required this.id,
    required this.email,
    required this.phone,
    required this.type,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    id: json["id"],
    email: json["email"]??'',
    phone: json["phone"]??'',
    type: json["type"]=='consultant'?UserType.consultant:UserType.user
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "phone": phone,
    "type": type==UserType.user?'normal':'consultant',
  };
}
