
class HomeCatogeryModel {
  int id;
  String name;

  HomeCatogeryModel({
    required this.id,
    required this.name,
  });

  factory HomeCatogeryModel.fromJson(Map<String, dynamic> json) => HomeCatogeryModel(
    id: json["id"],
    name: json["name"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
