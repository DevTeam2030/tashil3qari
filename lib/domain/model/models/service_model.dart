


class ServiceModel {
  int id;
  String name;
  String description;
  String image;

  ServiceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
    id: json["id"],
    name: json["name"]??'',
    description: json["description"]??'',
    image: json["image"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
  };
}
