
class GeneralPropertyModel {
  int id;
  String propertyTitle;
  String image;
  String country;
  int countryId;
  String city;
  int cityId;
  String propertyDescription;
  double rate;
  bool wishlist;
  String price;
  String currency;
  String category;
  String type;
  bool featured;
  bool show;
  double longitude;
  double latitude;
  String roomsNo;
  String bathroomsNo;
  String kitchensNo;
  String propertySize;
  String floor;
  String endDuration;
  bool isAuction;
  // String endDurationDays;
  // String endDurationHours;
  List<String> gallery;

  GeneralPropertyModel({
    required this.id,
    required this.propertyTitle,
    required this.image,
    required this.country,
    required this.countryId,
    required this.city,
    required this.cityId,
    required this.propertyDescription,
    required this.rate,
    required this.wishlist,
    required this.price,
    required this.currency,
    required this.latitude,
    required this.longitude,
    required this.show,
    required this.featured,
    required this.type,
    required this.category,
    required this.roomsNo,
    required this.bathroomsNo,
    required this.kitchensNo,
    required this.propertySize,
    required this.floor,
    required this.gallery,
    required this.endDuration,
    required this.isAuction,
  });

  factory GeneralPropertyModel.fromJson(Map<String, dynamic> json) => GeneralPropertyModel(
    id: json["id"],
    propertyTitle: json["property_title"]??'',
    image: json["image"]??'',
    country: json["country"]??'',
    countryId: json["country_id"]??0,
    city: json["citiy"]??'',
    cityId: json["citiy_id"]??0,
    propertyDescription: json["property_description"]??'',
    rate: double.tryParse(json["rate"].toString())??0,
    wishlist: json["wishlist"]??false,
    price: json["price"].toString(),
    latitude: double.tryParse(json["latitude"]??'0')??0,
    longitude: double.tryParse(json["longitude"]??'0')??0,
    featured: json["featured"]??false,
    show: json["show"]??false,
    type: json["type"]??'',
    category: json["category"]??'',
    currency: json["currency"]??'',
    roomsNo: json["rooms_no"]??'0',
    bathroomsNo: json["bathrooms_no"]??'0',
    kitchensNo: json["kitchens_no"]??'0',
    propertySize: json["property_size"]??'0',
    floor: json["floor"]??'0',
    endDuration: json["end_duration"]??'',
    isAuction: json["is_auction"]??false,
    gallery: json["gallery"]==null?[]:List<String>.from(json["gallery"].map((x) => x)),
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
  //   "wishlist": wishlist,
  //   "price": price,
  // };
}
