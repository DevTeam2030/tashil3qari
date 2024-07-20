
class HomeCatogeryModel {
  int id;
  String name;
  List<HomeCategoryOptionModel> options;

  HomeCatogeryModel({
    required this.id,
    required this.name,
    required this.options,
  });

  factory HomeCatogeryModel.fromJson(Map<String, dynamic> json) => HomeCatogeryModel(
    id: json["id"],
    name: json["name"]??'',
    options: List<HomeCategoryOptionModel>.from(json["options"].map((x) => HomeCategoryOptionModel.fromJson(x))),
  );


}


class HomeCategoryOptionModel {
  int id;
  String name;
  String type;

  HomeCategoryOptionModel({
    required this.id,
    required this.name,
    required this.type,
  });

  factory HomeCategoryOptionModel.fromJson(Map<String, dynamic> json) => HomeCategoryOptionModel(
    id: json["id"],
    name: json["name"]??'',
    type: json["type"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
  };
}
