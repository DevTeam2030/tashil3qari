
class AuctionDataModel {
  String minimumAuction;
  String price;
  String currencyId;
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
  });

  factory AuctionDataModel.fromJson(Map<String, dynamic> json) => AuctionDataModel(
    minimumAuction: json["minimum_auction"]??'',
    price: json["price"]??'',
    currencyId: json["currency_id"]??'',
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
  String userName;
  String userImage;
  String createdAt;
  String price;
  String currencyId;
  String currency;

  AuctionUserModel({
    required this.userName,
    required this.userImage,
    required this.createdAt,
    required this.price,
    required this.currencyId,
    required this.currency,
  });

  factory AuctionUserModel.fromJson(Map<String, dynamic> json) => AuctionUserModel(
    userName: json["user_name"]??'',
    userImage: json["user_image"]??'',
    createdAt: json["created_at"]??'',
    price: json["price"]??'',
    currencyId: json["currency_id"]??'',
    currency: json["currency"]??'',
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
