


class ServiceModel {
  int id;
  String name;
  String description;
  String image;
  bool isSoon;

  ServiceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.isSoon,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
    id: json["id"],
    name: json["name"]??'',
    description: json["description"]??'',
    image: json["image"]??'',
    isSoon: json["is_soon"].toString()=='1'||json["is_soon"].toString()=='true'?true:false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
  };
}
