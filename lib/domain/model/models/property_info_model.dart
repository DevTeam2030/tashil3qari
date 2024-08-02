

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
  String finishingTypeId;
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

  String receptionsNo;
  String apartmentsNo;
  String direction;
  String streetWidth;
  String storesNo;
  String buildingAge;
  String floorsNo;



  // receptions_no: "2",
  // apartments_no: "0",
  // direction: "east",
  // street_width: "200.0",
  // stores_no: "0",
  // building_age: "1",


  PropertyInfoModel({
    required this.id,
    required this.receptionsNo,
    required this.apartmentsNo,
    required this.direction,
    required this.streetWidth,
    required this.storesNo,
    required this.buildingAge,
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
    required this.floorsNo,
  });

  factory PropertyInfoModel.fromJson(Map<String, dynamic> json) => PropertyInfoModel(
    id: json["id"],
    propertyTitle: json["property_title"]??'',
    image: json["image"]??'',
    country: json["country"]??'',
    countryId: json["country_id"],
    city: json["citiy"]??'',
    cityId: json["citiy_id"],
    propertyDescription: json["property_description"]??'',
    rate: double.tryParse(json["rate"].toString())??0,
    latitude: double.tryParse(json["latitude"].toString())??0,
    longitude: double.tryParse(json["longitude"].toString())??0,
    roomsNo: json["rooms_no"].toString().isNotEmpty&&json["rooms_no"]!=null?json["rooms_no"].toString():'0',
      bathroomsNo: json["bathrooms_no"].toString().isNotEmpty&&json["bathrooms_no"]!=null?json["bathrooms_no"].toString():'0',
      kitchensNo: json["kitchens_no"].toString().isNotEmpty&&json["kitchens_no"]!=null?json["kitchens_no"].toString():'0',
      propertySize: json["property_size"].toString().isNotEmpty&&json["property_size"]!=null?json["property_size"].toString():'0',
      floor: json["floor"].toString().isNotEmpty&&json["floor"]!=null?json["floor"].toString():'0',
      finishingType: json["finishing_type"].toString().isNotEmpty&&json["finishing_type"]!=null?json["finishing_type"].toString():'',
      finishingTypeId: json["finishing_type_id"].toString().isNotEmpty&&json["finishing_type_id"]!=null?json["finishing_type_id"].toString():'0',
      receptionsNo: json["receptions_no"].toString().isNotEmpty&&json["receptions_no"]!=null?json["receptions_no"].toString():'0',
      apartmentsNo: json["apartments_no"].toString().isNotEmpty&&json["apartments_no"]!=null?json["apartments_no"].toString():'0',
      direction: json["direction"].toString().isNotEmpty&&json["direction"]!=null?json["direction"].toString():'',
      streetWidth: json["street_width"].toString().isNotEmpty&&json["street_width"]!=null?json["street_width"].toString():'0',
      storesNo: json["stores_no"].toString().isNotEmpty&&json["stores_no"]!=null?json["stores_no"].toString():'0',
      buildingAge: json["building_age"].toString().isNotEmpty&&json["building_age"]!=null?json["building_age"].toString():'0',
      floorsNo: json["floors_no"].toString().isNotEmpty&&json["floors_no"]!=null?json["floors_no"].toString():'0',


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
