

import 'package:tashil_agary/domain/model/models/auction_data_model.dart';

import '../../../app/enums.dart';

class PropertyInfoModel {
  int id;
  String propertyTitle;
  String image;
  String country;
  int countryId;
  String city;
  int cityId;
  int catId;
  String propertyDescription;
  double rate;
  double latitude;
  double longitude;
  String roomsNo;
  String bathroomsNo;
  String kitchensNo;
  String propertySize;
  String floor;
  String finishingType;
  int finishingTypeId;
  List<String> gallery;
  bool wishlist;
  bool featured;
  String type;
  double price;
  String currency;

  String address;
  String adCreatedAt;
  String timeAgo;
  String lastUpadte;
  String length;
  String width;
  String adNo;
  String license;
  int viewNo;
  int userId;
  String userName;
  String userImage;
  double userRate;
  UserType userType;
  String userEmail;
  String userPhone;
  String userLicenseNumber;
  bool isLive;
  String minimumAuction;
  String endDurationDays;
  String endDurationHours;
  String endDurationMintues;
  String video;
  int countAuctions;
  bool isAuction;
  List<AuctionUserModel> auctionsUsers;




  PropertyInfoModel({
    required this.id,
    required this.propertyTitle,
    required this.isAuction,
    required this.image,
    required this.country,
    required this.countryId,
    required this.city,
    required this.cityId,
    required this.propertyDescription,
    required this.rate,
    required this.latitude,
    required this.longitude,
    required this.roomsNo,
    required this.bathroomsNo,
    required this.kitchensNo,
    required this.propertySize,
    required this.floor,
    required this.finishingType,
    required this.finishingTypeId,
    required this.gallery,
    required this.wishlist,
    required this.featured,
    required this.type,
    required this.price,
    required this.currency,
    required this.address,
    required this.adCreatedAt,
    required this.timeAgo,
    required this.lastUpadte,
    required this.length,
    required this.width,
    required this.adNo,
    required this.license,
    required this.viewNo,
    required this.userId,
    required this.userImage,
    required this.userName,
    required this.userType,
    required this.userEmail,
    required this.userRate,
    required this.userPhone,
    required this.userLicenseNumber,
    required this.catId,
    required this.isLive,
    required this.endDurationDays,
    required this.endDurationHours,
    required this.endDurationMintues,
    required this.countAuctions,
    required this.auctionsUsers,
    required this.minimumAuction,
    required this.video,
  });

  factory PropertyInfoModel.fromJson(Map<String, dynamic> json) => PropertyInfoModel(
    id: json["id"],
    propertyTitle: json["property_title"],
    image: json["image"]??'',
    country: json["country"]??'',
    countryId: json["country_id"],
    city: json["citiy"]??'',
    cityId: json["citiy_id"],
    propertyDescription: json["property_description"]??'',
    rate: double.tryParse(json["rate"].toString())??0,
    latitude: double.tryParse(json["latitude"].toString())??0,
    longitude: double.tryParse(json["longitude"].toString())??0,
    roomsNo: json["rooms_no"]??'0',
    bathroomsNo: json["bathrooms_no"]??'0',
    kitchensNo: json["kitchens_no"]??'0',
    propertySize: json["property_size"]??'0',
    floor: json["floor"]??'0',
    finishingType: json["finishing_type"]??'',
    finishingTypeId: json["finishing_type_id"],
    gallery: List<String>.from(json["gallery"].map((x) => x)),
    wishlist: json["wishlist"]??false,
    featured: json["featured"]??false,
    type: json["type"]??'',
    price: double.tryParse(json["price"]??'0')??0,
    currency: json["currency"]??'',
    catId: json["cat_id"]??0,



    address: json["address"]??'',
    adCreatedAt: json["ad_created_at"]??'',
    timeAgo: json["time_ago"]??'',
    lastUpadte: json["last_upadte"]??''??'',
    length: json["length"]??'',
    width: json["width"]??'',
    adNo: json["ad_no"].toString(),
    license: json["license"]??'',
    viewNo: int.tryParse(json["view_no"].toString())??0,
      userId: int.tryParse(json["user_id"].toString())??0,
    userName: json["user_name"]??'',
    userImage: json["user_image"]??'',
    userType: json["user_type"]=='normal'?UserType.user:UserType.consultant,
    userRate: double.tryParse(json["user_rate"].toString())??0,
    userEmail: json["user_email"]??'',
    userPhone: json["user_phone"]??'',
    userLicenseNumber: json["user_license_number"]??'',

    isLive: json["is_live"]??false,
    isAuction: json["is_auction"]??false,
    minimumAuction: json["minimum_auction"]??'0',
    endDurationDays: json["end_duration_days"]??'0',
    endDurationHours: json["end_duration_hours"]??'0',
    endDurationMintues: json["end_duration_mintues"]??'0',
    countAuctions: json["count_auctions"]??0,
    video: json["video"]??0,
    auctionsUsers: json["auctions"]==null?[]:List<AuctionUserModel>.from(json["auctions"].map((x) => AuctionUserModel.fromJson(x))),

  );

  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "property_title": propertyTitle,
  //   "image": image,
  //   "country": country,
  //   "country_id": countryId,
  //   "citiy": city,
  //   "citiy_id": cityId,
  //   "property_description": propertyDescription,
  //   "rate": rate,
  //   "latitude": latitude,
  //   "longitude": longitude,
  //   "rooms_no": roomsNo,
  //   "bathrooms_no": bathroomsNo,
  //   "kitchens_no": kitchensNo,
  //   "property_size": propertySize,
  //   "floor": floor,
  //   "finishing_type": finishingType,
  //   "finishing_type_id": finishingTypeId,
  //   "gallery": List<dynamic>.from(gallery.map((x) => x)),
  //   "wishlist": wishlist,
  //   "featured": featured,
  //   "type": type,
  // };
}
