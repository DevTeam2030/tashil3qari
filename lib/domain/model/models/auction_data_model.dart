
import '../../../app/enums.dart';

class AuctionDataModel {
  String minimumAuction;
  String price;
  String currencyId;
  int userId;
  String currency;
  bool isLive;
  String endDurationDays;
  String endDurationHours;
  String endDurationMintues;
  int countAuctions;
  List<AuctionUserModel> auctionsUsers;
  List<String> gallery;
  bool wishlist;
  AuctionDataModel({
    required this.minimumAuction,
    required this.price,
    required this.currencyId,
    required this.currency,
    required this.isLive,
    required this.endDurationDays,
    required this.endDurationHours,
    required this.endDurationMintues,
    required this.countAuctions,
    required this.auctionsUsers,
    required this.gallery,
    required this.wishlist,
    required this.userId,
  });

  factory AuctionDataModel.fromJson(Map<String, dynamic> json) => AuctionDataModel(
    minimumAuction: json["minimum_auction"]??'',
    price: json["price"]??'',
    currencyId: json["currency_id"]??'',
    userId: int.tryParse(json["user_id"].toString())??0,
    currency: json["currency"]??'',
    isLive: json["is_live"]??false,
    endDurationDays: json["end_duration_days"]??'0',
    endDurationHours: json["end_duration_hours"]??'0',
    endDurationMintues: json["end_duration_mintues"]??'0',
    countAuctions: json["count_auctions"]??0,
    gallery:json["gallery"]==null?[]: List<String>.from(json["gallery"].map((x) => x)),
    wishlist: json["wishlist"]??false,
    auctionsUsers: List<AuctionUserModel>.from(json["auctions"].map((x) => AuctionUserModel.fromJson(x))),
  );


}

class AuctionUserModel {
  int userId;
  String userName;
  String userImage;
  String createdAt;
  String price;
  String currencyId;
  String currency;
  String userPhone;
  UserType userType;
  double userRate;

  AuctionUserModel({
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.createdAt,
    required this.price,
    required this.currencyId,
    required this.currency,
    required this.userType,
    required this.userRate,
    required this.userPhone,
  });

  factory AuctionUserModel.fromJson(Map<String, dynamic> json) => AuctionUserModel(
    userName: json["user_name"]??'',
    userImage: json["user_image"]??'',
    createdAt: json["created_at"]??'',
    price: json["price"]??'',
    currencyId: json["currency_id"]??'',
    currency: json["currency"]??'',
    userRate: double.tryParse(json["user_rate"].toString())??0,
    userPhone: json["user_phone"]??'',
    userId: int.tryParse(json["user_id"].toString())??0,
    userType: json["user_type"]=='normal'?UserType.user:UserType.consultant,
  );

  Map<String, dynamic> toJson() => {
    "user_name": userName,
    "user_image": userImage,
    "created_at": createdAt,
    "price": price,
    "currency_id": currencyId,
    "currency": currency,
  };
}
