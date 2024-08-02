

import 'dart:io';

class AddPropertyModel {
  String titleEn;
  String titleAr;
  int countryId;
  int cityId;
  int categoryId;
  bool forSale;
  String descriptionEn;
  String descriptionAr;
  double propertySize;
  double price;
  double longitude;
  double latitude;
  File image;
  List<File> gallery;
  File? video;
  int published;
  int currencyId;

  double length;
  double width;
  //----------

  // filter
  int roomsNo;
  int bathroomsNo;
  int kitchensNo;
  int floor;
  int finishingTypeId;

  double streetWidth;
String direction;
int receptionsNo;
int apartmentsNo;
int storesNo;
int buildingAge;
int floorsNo;


// receptions_no عدد الصالات
// apartments_no  عدد الشقق
// direction الواجهه
// street_width عرض الشارع
// stores_no عدد المحلات
// building_age عمر المبنى







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

    required this.streetWidth,
    required this.direction,
    required this.receptionsNo,
    required this.apartmentsNo,
    required this.storesNo,
    required this.buildingAge,
    required this.floorsNo

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
    "price":price,
    "finishing_type_id":finishingTypeId,
    "longitude":longitude,
    "latitude":latitude,
    "image":image,
    "gallery":gallery,
    "published":published,
    "currency_id":currencyId,
    "video":video,

    "rooms_no":roomsNo,
    "bathrooms_no":bathroomsNo,
    "kitchens_no":kitchensNo,
    "floor":floor,
    "property_size":propertySize,
    "length":length,
    "width":width,
"receptions_no":receptionsNo,
"apartments_no":apartmentsNo,
"direction":direction,
"street_width":streetWidth,
"stores_no":storesNo,
"building_age":buildingAge,
"floors_no":floorsNo,


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
   double streetWidth;
   String direction;
   int receptionsNo;
   int apartmentsNo;
   int storesNo;
   int buildingAge;
   int floorsNo;
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
    required this.streetWidth,
    required this.direction,
    required this.receptionsNo,
    required this.apartmentsNo,
    required this.storesNo,
    required this.buildingAge,
    required this.floorsNo

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
    "receptions_no":receptionsNo,
    "apartments_no":apartmentsNo,
    "direction":direction,
    "street_width":streetWidth,
    "stores_no":storesNo,
    "building_age":buildingAge,
    "floors_no":floorsNo,

  };
}







