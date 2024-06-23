

class SubCategoryModel {
  int id;
  String name;
  String image;


  SubCategoryModel({
  required this.id,
  required this.name,
  required this.image,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) => SubCategoryModel(
  id: json["id"],
  name: json["name"]??'',
  image: json["image"]??'',

  );

  Map<String, dynamic> toJson() => {
  "id": id,
  "name": name,
  "image": image,
  };
  }
