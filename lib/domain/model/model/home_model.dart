

import 'package:tashil_agary/domain/model/model/home_main_category.dart';
import 'package:tashil_agary/domain/model/model/home_product.dart';

class HomeModel {
  List<HomeMainCategoryModel> categories;
  List<HomeProduct> popularProducts;
  List<HomeProduct> newProducts;

  HomeModel({
    required this.categories,
    required this.popularProducts,
    required this.newProducts,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    categories: List<HomeMainCategoryModel>.from(json["categories"].map((x) => HomeMainCategoryModel.fromJson(x))),
    popularProducts: List<HomeProduct>.from(json["popular_products"].map((x) => HomeProduct.fromJson(x))),
    newProducts: List<HomeProduct>.from(json["new_products"].map((x) => HomeProduct.fromJson(x))),
  );

  // Map<String, dynamic> toJson() => {
  //   "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  //   "popular_products": List<dynamic>.from(popularProducts.map((x) => x.toJson())),
  //   "new_products": List<dynamic>.from(newProducts.map((x) => x.toJson())),
  // };
}








