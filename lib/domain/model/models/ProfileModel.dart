

class ProfileModel {
  int id;
  String firstName;
  String lastName;
  String type;
  String email;
  String phone;
  String image;
  String licenseNumber;
  String idNumber;
  String nationality;
  String nationalityId;
  String des;
  int adsNo;
  int followersNo;
  int follwingNo;
  bool documented;

  ProfileModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.type,
    required this.email,
    required this.phone,
    required this.image,
    required this.licenseNumber,
    required this.idNumber,
    required this.nationality,
    required this.nationalityId,
    required this.adsNo,
    required this.followersNo,
    required this.follwingNo,
    required this.documented,
    required this.des,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    id: json["id"],
    firstName: json["first_name"]??'',
    lastName: json["last_name"]??'',
    type: json["type"]??'',
    email: json["email"]??'',
    phone: json["phone"]??'',
    image: json["image"]??'',
    des: json["des"]??'',
    documented: json["documented"]??false,
    licenseNumber: json["license_number"]??'',
    idNumber: json["id_number"]??'',
    nationality: json["nationality"]??'',
    nationalityId: json["nationality_id"].toString(),
    adsNo: int.tryParse(json["ads_no"].toString())??0,
    followersNo: int.tryParse(json["followers_no"].toString())??0,
    follwingNo: int.tryParse(json["follwing_no"].toString())??0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "type": type,
    "email": email,
    "phone": phone,
    "image": image,
    "license_number": licenseNumber,
    "id_number": idNumber,
    "nationality": nationality,
    "nationality_id": nationalityId,
    "ads_no": adsNo,
    "followers_no": followersNo,
    "follwing_no": follwingNo,
  };
}
