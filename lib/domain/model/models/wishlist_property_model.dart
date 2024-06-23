
class WishlistPropertyModel {
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
  double price;
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
  List<String> gallery;

  // "id": 3,
  // "property_id": 1,
  // "property_title": "House for sale",
  // "image": "http://estate.smartbox.com.sa/images/properties031243940_1701944309893.webp",
  // "country": "Saudi Arabia",
  // "country_id": 1,
  // "citiy": "Riyadh",
  // "citiy_id": 102,
  // "property_description": "",
  // "rate": 4,
  // "wishlist": true
  WishlistPropertyModel({
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
  });

  factory WishlistPropertyModel.fromJson(Map<String, dynamic> json) => WishlistPropertyModel(
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
    price: double.tryParse(json["price"]??'0')??0,
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
