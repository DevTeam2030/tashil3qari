

import 'package:tashil_agary/domain/model/model/sub_category.dart';

class HomeMainCategoryModel {
  int id;
  String name;
  String image;
  String background;
  int countSubCats;
  List<SubCategoryModel> subCategories;


  HomeMainCategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.background,
    required this.countSubCats,
    required this.subCategories,
  });

  factory HomeMainCategoryModel.fromJson(Map<String, dynamic> json) => HomeMainCategoryModel(
    id: json["id"],
    name: json["name"]??'',
    image: json["image"]??'',
    background: json["background"]??'',
    countSubCats: json["countSubCats"]??0,
    subCategories: List<SubCategoryModel>.from(json["subCats"].map((x) => SubCategoryModel.fromJson(x))),
  );

  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "name": name,
  //   "image": image,
  //   "background": background,
  //   "countSubCats": countSubCats,
  // };
}