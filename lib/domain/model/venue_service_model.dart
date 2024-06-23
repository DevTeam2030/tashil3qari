

import 'package:tashil_agary/domain/model/venue_service_option_model.dart';

class VenueServiceModel {
  VenueServiceModel({
    required this.id,
    required this.name,
    required this.duration,
    required this.price,
    required this.description,
    required this.catId,
   required this.options,
   required this.subService,
   required this.haveUpselling,
   required this.currency,
   // required this.isChecked,
  });

  int id;
  String name;
  String duration;
  String price;
  String description;
  String  currency;
  int catId;
  bool haveUpselling;
  // bool isChecked;
  List<VenueServiceOptionModel> options;
  List<VenueServiceModel> subService;

  factory VenueServiceModel.fromJson(Map<String, dynamic> json) => VenueServiceModel(
     currency: json["currency"]??'',
    id: json["id"],
    name: json["name"]??'',
    duration: json["duration"]??'',
    price: json["price"]??'0',
    description: json["description"]??'',
    catId: json["catId"]??0,
    // isChecked: false,
    haveUpselling: json["have_upselling"] ?? false,
    options: json["options"] == null ? [] : List<VenueServiceOptionModel>.from(json["options"]!.map((x) => VenueServiceOptionModel.fromJson(x))),
    subService: json["sub_service"] == null ? [] : List<VenueServiceModel>.from(json["sub_service"]!.map((x) => VenueServiceModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "duration": duration,
    "price": price,
    "description": description,
    "catId": catId,
    "have_upselling": haveUpselling,
    "options":  List<VenueServiceOptionModel>.from(options.map((x) => x.toJson())),
    "sub_service":  List<VenueServiceModel>.from(subService.map((x) => x.toJson())),
  };
}
