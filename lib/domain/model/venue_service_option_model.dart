
class VenueServiceOptionModel {
  VenueServiceOptionModel({
    required this.id,
    required this.name,
    required this.duration,
    required this.price,
    required this.priceBeforeDiscount,
    required this.type,
    required this.currency,
    required this.advanced,

  });

  int id;
  String name;
  String duration;
  String price;
  String priceBeforeDiscount;
  String type;
  String currency;

  List<VenueServiceAdvancedOptionModel> advanced;

  factory VenueServiceOptionModel.fromJson(Map<String, dynamic> json) => VenueServiceOptionModel(
    id: json["id"],
    name: json["name"]??'',
    duration:json["duration"]??'',
    price: json["price"]??'',
    priceBeforeDiscount: json["price_before_discount"]??'',
    type: json["type"]??'',
    currency: json["currency"]??'',
     advanced: json["advanced"] == null ? [] : List<VenueServiceAdvancedOptionModel>.from(json["advanced"]!.map((x) => VenueServiceAdvancedOptionModel.fromJson(x))),

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "duration": duration,
    "price": price,
    "price_before_discount": priceBeforeDiscount,
    "type": type,
    // "advanced":  List<VenueServiceAdvancedOptionModel>.from(advanced.map((x) => x.toJson())),
  };
}



class VenueServiceAdvancedOptionModel {
  VenueServiceAdvancedOptionModel({
    required this.id,
    required this.name,
    required this.duration,
    required this.price,
    required this.priceBeforeDiscount,
    required this.type,
    required this.employeeId,
  });

  int id;
  String name;
  String duration;
  String price;
  String priceBeforeDiscount;
  String type;
  String employeeId;

  factory VenueServiceAdvancedOptionModel.fromJson(Map<String, dynamic> json) => VenueServiceAdvancedOptionModel(
    id: json["id"],
    name: json["name"],
    duration: json["duration"],
    price: json["price"],
    priceBeforeDiscount: json["price_before_discount"],
    type: json["type"],
    employeeId: json["employee_id"].toString().isEmpty?'0':json["employee_id"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "duration": duration,
    "price": price,
    "price_before_discount": priceBeforeDiscount,
    "type": type,
    "employee_id": employeeId,
  };
}
