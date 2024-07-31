
class UserAdsModel {
  int id;
  String propertyTitle;
  String image;
  String country;
  int countryId;
  String city;
  int cityId;
  String propertyDescription;
  double rate;
  bool featured;
  bool wishlist;
  bool show;
  String price;
  String length;
  String width;
  String license;
  double longitude;
  double latitude;
  String category;
  String type;
  String roomsNo;
  String bathroomsNo;
  String kitchensNo;
  String propertySize;
  String floor;
  String currency;
  String currencyId;
  String adCreatedAt;
  String lastUpadte;
  bool auction;
  bool published;
  bool haveConsultant;
  int finishingTypeId;
  int catId;
  String finishingType;
  List<GalleryModel> gallery;
  String video;

  String receptionsNo;
  String apartmentsNo;
  String direction;
  String streetWidth;
  String storesNo;
  String buildingAge;
  UserAdsModel({
    required this.id,
    required this.propertyTitle,
    required this.image,
    required this.country,
    required this.countryId,
    required this.city,
    required this.cityId,
    required this.propertyDescription,
    required this.rate,
    required this.featured,
    required this.wishlist,
    required this.show,
    required this.price,
    required this.longitude,
    required this.latitude,
    required this.category,
    required this.type,
    required this.roomsNo,
    required this.bathroomsNo,
    required this.kitchensNo,
    required this.propertySize,
    required this.floor,
    required this.gallery,
    required this.currency,
    required this.adCreatedAt,
    required this.lastUpadte,
    required this.auction,
    required this.published,
    required this.length,
    required this.width,
    required this.license,
    required this.finishingTypeId,
    required this.catId,
    required this.finishingType,
    required this.currencyId,
    required this.video,
    required this.haveConsultant,
    required this.receptionsNo,
    required this.apartmentsNo,
    required this.direction,
    required this.streetWidth,
    required this.storesNo,
    required this.buildingAge,
  });

  factory UserAdsModel.fromJson(Map<String, dynamic> json) => UserAdsModel(
    id: json["id"],
    propertyTitle: json["property_title"]??'',
    image: json["image"]??'',
    country:json["country"]??'',
    countryId: json["country_id"]??0,
    finishingTypeId: json["finishing_type_id"]??0,
    finishingType: json["finishing_type"]??'',
    catId: json["cat_id"]??0,
    city: json["citiy"]??'',
    cityId: json["citiy_id"]??0,
    propertyDescription: json["property_description"]??'',
    rate: double.tryParse(json["rate"].toString())??0,
    featured: json["featured"]??false,
    wishlist: json["wishlist"]??false,
    show: json["show"]??false,
    price: json["price"]??'0',
    longitude: double.tryParse(json["longitude"])??0,
    latitude: double.tryParse(json["latitude"])??0,
    category: json["category"]??'',
    type:json["type"]??'',
    roomsNo: json["rooms_no"]??'0',
    bathroomsNo: json["bathrooms_no"]??'0',
    length: json["length"]??'0',
    width: json["width"]??'0',
    license: json["license"]??'',
    kitchensNo: json["kitchens_no"]??'0',
    propertySize: json["property_size"]??'0',
    floor: json["floor"]??'0',
    currency: json["currency"]??'',
    adCreatedAt: json["ad_created_at"]??'',
    lastUpadte: json["last_upadte"]??'',
    published: json["published"]??false,
    auction: json["auction"]??false,
    currencyId: json["currency_id"]??'0',
    video: json["video"]??'',
    haveConsultant: json["have_consultant"]??false,
    gallery:json["gallery"]==null?[]: List<GalleryModel>.from(json["gallery"].map((x) => GalleryModel.fromJson(x))),
    receptionsNo: json["receptions_no"]??'0',
    apartmentsNo: json["apartments_no"]??'0',
    direction: json["direction"]??'',
    streetWidth: json["street_width"]??'0',
    storesNo: json["stores_no"]??'0',
    buildingAge: json["building_age"]??'0',

  );

}

class GalleryModel {
  int id;
  String url;

  GalleryModel({
    required this.id,
    required this.url,
  });

  factory GalleryModel.fromJson(Map<String, dynamic> json) => GalleryModel(
    id: json["id"],
    url: json["url"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
  };
}