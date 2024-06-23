
class FinishingTypesModel {
  int id;
  String name;

  FinishingTypesModel({
    required this.id,
    required this.name,
  });

  factory FinishingTypesModel.fromJson(Map<String, dynamic> json) => FinishingTypesModel(
    id: json["id"],
    name: json["name"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}



class AuctionDurationsModel {
  int id;
  String name;

  AuctionDurationsModel({
    required this.id,
    required this.name,
  });

  factory AuctionDurationsModel.fromJson(Map<String, dynamic> json) => AuctionDurationsModel(
    id: json["id"],
    name: json["name"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
class ReasonModel {
  int id;
  String name;

  ReasonModel({
    required this.id,
    required this.name,
  });

  factory ReasonModel.fromJson(Map<String, dynamic> json) => ReasonModel(
    id: json["id"],
    name: json["name"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
class CurrencyModel {
  int id;
  String name;

  CurrencyModel({
    required this.id,
    required this.name,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
    id: json["id"],
    name: json["name"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class FeaturedPlansModel {
  int id;
  String name;
  String price;
  String currencyId;
  String currency;

  FeaturedPlansModel({
    required this.id,
    required this.name,
    required this.price,
    required this.currencyId,
    required this.currency,
  });

  factory FeaturedPlansModel.fromJson(Map<String, dynamic> json) => FeaturedPlansModel(
    id: json["id"],
    name: json["name"]??'',
    price: json["price"].toString(),
    currencyId: json["currency_id"].toString(),
    currency: json["currency"]??'',
  );


}
