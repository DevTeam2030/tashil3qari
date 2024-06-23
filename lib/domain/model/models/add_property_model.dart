

import 'dart:io';

class AddPropertyModel {
  String titleEn;
  String titleAr;
  String descriptionEn;
  String descriptionAr;
  int countryId;
  int cityId;

  int categoryId;
  bool forSale;
int roomsNo;
int bathroomsNo;
int kitchensNo;
int floor;
int finishingTypeId;
double propertySize;
double length;
double width;
double price;
double longitude;
double latitude;
File image;
List<File> gallery;
File? video;
int published;
int currencyId;

  AddPropertyModel({
    required this.titleEn,
    required this.titleAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.countryId,
    required this.cityId,
    required this.longitude,
    required this.latitude,
    required this.categoryId,
    required this.forSale,
    required this.roomsNo,
    required this.bathroomsNo,
    required this.kitchensNo,
    required this.floor,
    required this.propertySize,
    required this.length,
    required this.width,
    required this.price,
    required this.finishingTypeId,
    required this.image,
    required this.gallery,
    required this.published,
    required this.currencyId,
    required this.video,

  });
  Map<String, dynamic> toJson() => {
    "title_en": titleEn,
    "title_ar": titleAr,
    "description_en": descriptionEn,
    "description_ar": descriptionAr,
    "country_id": countryId,
    "city_id": cityId,
    "category_id": categoryId,
    "type": forSale?"sale":"rent",
    "rooms_no":roomsNo,
    "bathrooms_no":bathroomsNo,
    "kitchens_no":kitchensNo,
    "floor":floor,
    "property_size":propertySize,
    "length":length,
    "width":width,
    "price":price,
    "finishing_type_id":finishingTypeId,
    "longitude":longitude,
    "latitude":latitude,
    "image":image,
    "gallery":gallery,
    "published":published,
    "currency_id":currencyId,
    "video":video,

  };
}


class EditPropertyModel {
   int propertyId;
  String titleEn;
  String titleAr;
  String descriptionEn;
  String descriptionAr;
  int categoryId;
  int roomsNo;
  int bathroomsNo;
  int kitchensNo;
  int floor;
  int finishingTypeId;
  double propertySize;
  double length;
  double width;
  double price;
  bool forSale;
  File? image;
  List<File> gallery;
  File?video;
  int currencyId;
  String license;
   int countryId;
   int cityId;
   double longitude;
   double latitude;
  EditPropertyModel({
    required this.propertyId,
    required this.titleEn,
    required this.titleAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.categoryId,
    required this.forSale,
    required this.roomsNo,
    required this.bathroomsNo,
    required this.kitchensNo,
    required this.floor,
    required this.propertySize,
    required this.length,
    required this.width,
    required this.price,
    required this.finishingTypeId,
    required this.image,
    required this.gallery,
    required this.currencyId,
    required this.license,
    required this.countryId,
    required this.cityId,
    required this.longitude,
    required this.latitude,
    required this.video,

  });
  Map<String, dynamic> toJson() => {
    "property_id": propertyId,
    "title_en": titleEn,
    "title_ar": titleAr,
    "description_en": descriptionEn,
    "description_ar": descriptionAr,
    "category_id": categoryId,
    "type": forSale?"sale":"rent",
    "rooms_no":roomsNo,
    "bathrooms_no":bathroomsNo,
    "kitchens_no":kitchensNo,
    "floor":floor,
    "property_size":propertySize,
    "length":length,
    "width":width,
    "price":price,
    "finishing_type_id":finishingTypeId,
    "image":image,
    "gallery":gallery,
    "license":license,
    "currency_id":currencyId,
    "country_id": countryId,
    "city_id": cityId,
    "longitude":longitude,
    "latitude":latitude,
    "video":video,

  };
}
