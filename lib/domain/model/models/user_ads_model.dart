
class UserAdsModel {
  int id;
  String propertyTitle;
  String image;
  String country;
  int countryId;
  String city;
  int cityId;
  int userId;
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
  bool monthly;
  String roomsNo;
  String bathroomsNo;
  String kitchensNo;
  String propertySize;
  String floor;
  String floorsNo;
  String currency;
  String currencyId;
  String adCreatedAt;
  String lastUpadte;
  bool auction;
  bool published;
  bool haveConsultant;
  String finishingTypeId;
  int catId;
  String finishingType;
  List<GalleryModel> gallery;
  String video;

  String receptionsNo;
  String apartmentsNo;
  List<String> direction;
  String streetWidth;
  String storesNo;
  String buildingAge;
  bool feminine;

  bool annex;
  bool carEntrance;
  bool elevator;
  bool  airConditioners;
  bool waterAvailability;
  bool electricityAvailability;
  bool swimmingPool;
  bool  footballField;
  bool  volleyballCourt;
  bool  amusementPark;
  bool familySection;
  bool isAuctionBefore;

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
    required this.floorsNo,
    required this.feminine,
    required this.monthly,
    required this.annex,required this.carEntrance,
    required this.elevator,required this.airConditioners,
    required this.waterAvailability,required this.volleyballCourt,
    required this.swimmingPool,required this.footballField,
    required this.amusementPark,required this.familySection,
    required this.electricityAvailability,
    required this.userId,
    required this.isAuctionBefore,


  });

  factory UserAdsModel.fromJson(Map<String, dynamic> json) => UserAdsModel(
    id: json["id"],
    propertyTitle: json["property_title"]??'',
    image: json["image"]??'',
    country:json["country"]??'',
    countryId: json["country_id"]??0,

    catId: json["cat_id"]??0,
    city: json["citiy"]??'',
    cityId: json["citiy_id"]??0,
    propertyDescription: json["property_description"]??'',
    rate: double.tryParse(json["rate"].toString())??0,
    featured: json["featured"]??false,
    wishlist: json["wishlist"]??false,
    roomsNo: json["rooms_no"].toString().isNotEmpty&&json["rooms_no"]!=null?json["rooms_no"].toString():'0',
    bathroomsNo: json["bathrooms_no"].toString().isNotEmpty&&json["bathrooms_no"]!=null?json["bathrooms_no"].toString():'0',
    kitchensNo: json["kitchens_no"].toString().isNotEmpty&&json["kitchens_no"]!=null?json["kitchens_no"].toString():'0',
    propertySize: json["property_size"].toString().isNotEmpty&&json["property_size"]!=null?json["property_size"].toString():'0',
    floor: json["floor"].toString().isNotEmpty&&json["floor"]!=null?json["floor"].toString():'0',
    finishingType: json["finishing_type"].toString().isNotEmpty&&json["finishing_type"]!=null?json["finishing_type"].toString():'',
    finishingTypeId: json["finishing_type_id"].toString().isNotEmpty&&json["finishing_type_id"]!=null?json["finishing_type_id"].toString():'0',
    receptionsNo: json["receptions_no"].toString().isNotEmpty&&json["receptions_no"]!=null?json["receptions_no"].toString():'0',
    apartmentsNo: json["apartments_no"].toString().isNotEmpty&&json["apartments_no"]!=null?json["apartments_no"].toString():'0',
    // direction: json["direction"].toString().isNotEmpty&&json["direction"]!=null?json["direction"].toString():'',
    direction:json["direction"]==null?[]: List<String>.from(json["direction"].map((x) => x)),
    streetWidth: json["street_width"].toString().isNotEmpty&&json["street_width"]!=null?json["street_width"].toString():'0',
    storesNo: json["stores_no"].toString().isNotEmpty&&json["stores_no"]!=null?json["stores_no"].toString():'0',
    buildingAge: json["building_age"].toString().isNotEmpty&&json["building_age"]!=null?json["building_age"].toString():'0',
    floorsNo: json["floors_no"].toString().isNotEmpty&&json["floors_no"]!=null?json["floors_no"].toString():'0',
    feminine: json["feminine"].toString()=='true'||json["feminine"].toString()=='1'?true:false,
    show: json["show"]??false,
    price: json["price"]??'0',
    longitude: double.tryParse(json["longitude"])??0,
    latitude: double.tryParse(json["latitude"])??0,
    category: json["category"]??'',
    type:json["type"]??'',
    length: json["length"]??'0',
    userId: json["user_id"]??0,
    width: json["width"]??'0',
    license: json["license"]??'',
    currency: json["currency"]??'',
    adCreatedAt: json["ad_created_at"]??'',
    lastUpadte: json["last_upadte"]??'',
    published: json["published"]??false,
    isAuctionBefore: json["is_auction_before"]??false,
    auction: json["auction"]??false,
    currencyId: json["currency_id"]??'0',
    video: json["video"]??'',
    haveConsultant: json["have_consultant"]??false,
    monthly: json["monthly"].toString()=='1'||json["monthly"].toString()=='true'?true:false,
    gallery:json["gallery"]==null?[]: List<GalleryModel>.from(json["gallery"].map((x) => GalleryModel.fromJson(x))),


    annex: json["annex"].toString()=='true'||json["annex"].toString()=='1'?true:false,
    carEntrance: json["car_entrance"].toString()=='true'||json["car_entrance"].toString()=='1'?true:false,
    elevator: json["elevator"].toString()=='true'||json["elevator"].toString()=='1'?true:false,
    airConditioners: json["air_conditioners"].toString()=='true'||json["air_conditioners"].toString()=='1'?true:false,
    waterAvailability: json["water_availability"].toString()=='true'||json["water_availability"].toString()=='1'?true:false,
    electricityAvailability: json["electricity_availability"].toString()=='true'||json["electricity_availability"].toString()=='1'?true:false,
    swimmingPool: json["swimming_pool"].toString()=='true'||json["swimming_pool"].toString()=='1'?true:false,
    footballField: json["football_field"].toString()=='true'||json["football_field"].toString()=='1'?true:false,
    volleyballCourt: json["volleyball_court"].toString()=='true'||json["volleyball_court"].toString()=='1'?true:false,
    amusementPark: json["amusement_park"].toString()=='true'||json["amusement_park"].toString()=='1'?true:false,
    familySection: json["family_section"].toString()=='true'||json["family_section"].toString()=='1'?true:false,


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