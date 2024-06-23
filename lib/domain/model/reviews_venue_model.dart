


  import 'model/review_model.dart';

class ReviewsVenueModel {
  ReviewsVenueModel({
  required this.sum,
  required this.count,
  required this.countOne,
  required this.countTwo,
  required this.countThree,
  required this.countFour,
  required this.countFive,
  required this.review,
  });

  int sum;
  int count;
  int countOne;
  int countTwo;
  int countThree;
  int countFour;
  int countFive;
  List<ReviewModel> review;

  factory ReviewsVenueModel.fromJson(Map<String, dynamic> json) => ReviewsVenueModel(
  sum: json["sum"]??0,
  count: json["count"]??0,
  countOne: json["count_one"]??0,
  countTwo: json["count_two"]??0,
  countThree: json["count_three"]??0,
  countFour: json["count_four"]??0,
  countFive: json["count_five"]??0,
  review: json["review"]==null?[]:List<ReviewModel>.from(json["review"].map((x) => ReviewModel.fromJson(x))),
  );

  // Map<String, dynamic> toJson() => {
  // "sum": sum,
  // "count": count,
  // "count_one": countOne,
  // "count_two": countTwo,
  // "count_three": countThree,
  // "count_four": countFour,
  // "count_five": countFive,
  // "review": List<dynamic>.from(review.map((x) => x.toJson())),
  // };
  }


