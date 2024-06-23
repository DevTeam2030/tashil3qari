
class ConsultantInfoModel {
  int id;
  String firstName;
  String lastName;
  String type;
  String email;
  String des;
  String phone;
  String image;
  String licenseNumber;
  String idNumber;
  String nationality;
  int adsNo;
  double rate;
  String city;
  String country;
  int followersNo;
  int followingNo;
  bool isFollow;


  ConsultantInfoModel({
    required this.id,
    required this.des,
    required this.firstName,
    required this.lastName,
    required this.type,
    required this.email,
    required this.phone,
    required this.image,
    required this.licenseNumber,
    required this.idNumber,
    required this.nationality,
    required this.adsNo,
    required this.country,
    required this.city,
    required this.followersNo,
    required this.followingNo,
    required this.rate,
    required this.isFollow,
  });

  factory ConsultantInfoModel.fromJson(Map<String, dynamic> json) => ConsultantInfoModel(
    id: json["id"],
    des: json["des"]??'',
    firstName: json["first_name"]??'',
    lastName: json["last_name"]??'',
    type: json["type"]??'',
    email: json["email"]??'',
    phone: json["phone"]??'',
    image: json["image"]??'',
    licenseNumber: json["license_number"]??'',
    idNumber: json["id_number"]??'',
    nationality: json["nationality"]??'',
    adsNo: json["ads_no"]??0,
    city: json["city"]??'',
    country: json["country"]??'',
    followersNo: json["followers_no"]??0,
    followingNo: json["follwing_no"]??0,
    isFollow: json["is_follow"]??false,
    rate: double.tryParse(json["rate"].toString())??0,
  );

}
