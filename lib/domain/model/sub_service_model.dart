class SubServiceModel {
  SubServiceModel({
    required this.name,
    required this.duration,
    required this.price,
  });

  String name;
  String duration;
  String price;

  factory SubServiceModel.fromJson(Map<String, dynamic> json) =>
      SubServiceModel(
        name: json["name"]??'',
        duration: json["duration"]??'',
        price: json["price"]??'',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "duration": duration,
        "price": price,
      };
}
