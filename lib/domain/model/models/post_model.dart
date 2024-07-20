
class PostModel {
  int id;
  String post;
  String description;
  String image;
  String userName;
  String userType;
  String userEmail;
  String userPhone;
  String city;
  double userRate;
  int userId;

  String country;
  String timeAgo;
  String userImage;
  String userCity;
  bool isFollow;
  bool isAgreement;
  List<AgreementsConsultModel>consults;
  bool like;
  bool disLike;
  int likesCounter;
  int disLikesCounter;
  int? cityId;
  // likes_counter: 0, dis_likes_counter: 0, like: false, disLike: false
  PostModel({
    required this.id,
    required this.post,
    required this.image,
    required this.description,
    required this.userName,
    required this.userType,
    required this.userEmail,
    required this.userPhone,
    required this.city,
    required this.userId,
    required this.userRate,
    required this.country,
    required this.timeAgo,
    required this.userImage,
    required this.isFollow,
    required this.isAgreement,
    required this.consults,
    required this.userCity,
    required this.like,
    required this.disLike,
    required this.disLikesCounter,
    required this.likesCounter,
    required this.cityId,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    id: json["id"],
    post: json["post"]??'',
    image: json["image"]??'',
    description: json["description"]??'',
    userName: json["user_name"]??'',
    userType: json["user_type"]??'',
    userEmail: json["user_email"]??'',
    userPhone: json["user_phone"]??'',
    city: json["city"]??'',
    country: json["country"]??'',
    timeAgo: json["time_ago"]??'',
    userImage: json["user_image"]??'',
    isFollow: json["is_follow"]??false,
    isAgreement: json["is_agreement"]??false,
    userId: json["user_id"]??0,
    userRate: double.tryParse(json["user_rate"].toString())??0,
    consults: json["consults"]==null?[]:List<AgreementsConsultModel>.from(json["consults"].map((x) => AgreementsConsultModel.fromJson(x))),
    disLike: json["disLike"]??false,
    like: json["like"]??false,
    likesCounter: json["likes_counter"]??0,
    disLikesCounter: json["dis_likes_counter"]??0,
    cityId: json["city_id"],
    userCity: json["user_city"]??'',
  );

  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "post": post,
  //   "image": image,
  //   "user_name": userName,
  //   "user_type": userType,
  //   "user_email": userEmail,
  //   "user_phone": userPhone,
  //   "city": city,
  //   "country": country,
  //   "time_ago": timeAgo,
  //   "user_image": userImage,
  // };
}


class AgreementsConsultModel {
  String name;
  String image;
  String rate;
  int id;
  List<SubAgreementsConsultModel> subConsults;

  AgreementsConsultModel({
    required this.name,
    required this.image,
    required this.rate,
  required  this.id,
  required  this.subConsults,
  });

  factory AgreementsConsultModel.fromJson(Map<String, dynamic> json) => AgreementsConsultModel(
    id: json["id"],
    name: json["name"]??'',
    image: json["image"]??'',
    rate: json["rate"]??'0',
    subConsults: json["subConsults"]==null?[]:List<SubAgreementsConsultModel>.from(json["subConsults"].map((x) => SubAgreementsConsultModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "rate": rate,
    "subConsults": subConsults == null ? [] : List<dynamic>.from(subConsults!.map((x) => x.toJson())),
  };
}

class SubAgreementsConsultModel {
  String name;
  String image;
  String rate;


  SubAgreementsConsultModel({
    required this.name,
    required this.image,
    required this.rate,

  });

  factory SubAgreementsConsultModel.fromJson(Map<String, dynamic> json) => SubAgreementsConsultModel(
    name: json["name"]??'',
    image: json["image"]??'',
    rate: json["rate"]??'0',
    );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "rate": rate,
  };
}