

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
    // required this.description,

  });

  int id;
  String name;
  // String description;


  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json["id"],
    name: json["name"]??'',
    // description: json["description"],
 );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name??'',
    // "description": description,

  };
}
