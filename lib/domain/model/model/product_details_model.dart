
import 'package:tashil_agary/domain/model/model/review_model.dart';

import 'options_model.dart';

class ProductDetailsModel {
  int id;
  String name;
  String des;
  String image;
  double price;
  double salePrice;
  double reviewAverage;
  double reviewFive;
  double reviewFour;
  double reviewThree;
  double reviewTwo;
  double reviewOne;
  int reviewCount;
  bool isFavourite;
  bool showTime;
  bool showDate;
  List<ReviewModel> reviews;
  List<OptionsModel> options;



  // review_five: 0,
  // review_four: 0,
  // review_three: 0,
  // review_two: 0,
  // review_one: 0,

  ProductDetailsModel({
    required this.id,
    required this.name,
    required this.des,
    required this.image,
    required this.price,
    required this.salePrice,
    required this.reviewAverage,
    required this.reviewCount,
    required this.isFavourite,
    required this.reviews,
    required this.reviewFive,
    required this.reviewFour,
    required this.reviewThree,
    required this.reviewTwo,
    required this.reviewOne,
    required this.showDate,
    required this.showTime,
    required this.options,


  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => ProductDetailsModel(
    id: json["id"],
    name: json["name"]??'',
    des: json["des"]??'',
    image: json["image"]??'',
    price: double.tryParse(json["price"].toString())??0,
      salePrice: double.tryParse(json["sale_price"].toString())??0,
    reviewAverage: double.tryParse(json["review_average"].toString())??0,
    reviewFive: double.tryParse(json["review_five"].toString())??0,
    reviewFour: double.tryParse(json["review_four"].toString())??0,
    reviewThree: double.tryParse(json["review_three"].toString())??0,
    reviewTwo: double.tryParse(json["review_two"].toString())??0,
    reviewOne: double.tryParse(json["review_one"].toString())??0,
    reviewCount: int.tryParse(json["review_count"].toString())??0,
    isFavourite: json["isfavourite"]??false,
    showDate: json["show_date"]??false,
    showTime: json["show_time"]??false,
    reviews: List<ReviewModel>.from(json["reviews"].map((x) => ReviewModel.fromJson(x))),
    options: List<OptionsModel>.from(json["options"].map((x) => OptionsModel.fromJson(x))),
  );

  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "name": name,
  //   "des": des,
  //   "image": image,
  //   "price": price,
  //   "sale_price": salePrice,
  //   "review_average": reviewAverage,
  //   "review_count": reviewCount,
  //   "isfavourite": isFavourite,
  //   "reviews": List<dynamic>.from(reviews.map((x) => x)),
  // };
}
