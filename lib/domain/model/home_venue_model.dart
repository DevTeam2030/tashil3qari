
class HomeVenueModel {
  HomeVenueModel({
   required this.id,
    required this.name,
    required this.logo,
    required this.address,
    required this.type,
    required this.rate,
    required  this.rateCount,
    required  this.wishlist,
    required  this.distance,
  });

  int id;
  String name;
  String logo;
  String address;
  String type;
  String rate;
  String rateCount;
  String distance;
  bool wishlist;

  factory HomeVenueModel.fromJson(Map<String, dynamic> json) => HomeVenueModel(
    id: json["id"],
    name: json["name"]??'',
    logo: json["logo"]??'',
    address: json["address"]??'',
    type: json["type"]??'all',
    rate: json["rate"].toString(),
    rateCount: json["rate_count"].toString(),
    distance: json["distance"].toString(),
    wishlist: json["wishlist"]??false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logo": logo,
    "address": address,
    "type": type,
    "rate": rate,
    "rate_count": rateCount,
    "wishlist": wishlist,
    "distance": distance,
  };
}