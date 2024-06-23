


  class VenueReviewsModel {
    VenueReviewsModel({
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
  List<Review> review;

  factory VenueReviewsModel.fromJson(Map<String, dynamic> json) => VenueReviewsModel(
  sum: json["sum"],
  count: json["count"],
  countOne: json["count_one"],
  countTwo: json["count_two"],
  countThree: json["count_three"],
  countFour: json["count_four"],
  countFive: json["count_five"],
  review: List<Review>.from(json["review"].map((x) => Review.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
  "sum": sum,
  "count": count,
  "count_one": countOne,
  "count_two": countTwo,
  "count_three": countThree,
  "count_four": countFour,
  "count_five": countFive,
  "review": List<dynamic>.from(review.map((x) => x.toJson())),
  };
  }

  class Review {
  Review({
  required this.name,
  required this.image,
  required this.rate,
  required this.comment,
  });

  String name;
  String image;
  String rate;
  String comment;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
  name: json["name"],
  image: json["image"],
  rate: json["rate"],
  comment: json["comment"],
  );

  Map<String, dynamic> toJson() => {
  "name": name,
  "image": image,
  "rate": rate,
  "comment": comment,
  };
  }

  class Schedules {
  Schedules({
  required this.mondayFrom,
  required this.mondayTo,
  required this.tuesdayFrom,
  required this.tuesdayTo,
  required this.wednesdayFrom,
  required this.wednesdayTo,
  required this.thursdayFrom,
  required this.thursdayTo,
  this.saturdayFrom,
  this.saturdayTo,
  required this.sundayFrom,
  required this.sundayTo,
  });

  String mondayFrom;
  String mondayTo;
  String tuesdayFrom;
  String tuesdayTo;
  String wednesdayFrom;
  String wednesdayTo;
  String thursdayFrom;
  String thursdayTo;
  dynamic saturdayFrom;
  dynamic saturdayTo;
  String sundayFrom;
  String sundayTo;

  factory Schedules.fromJson(Map<String, dynamic> json) => Schedules(
  mondayFrom: json["monday_from"],
  mondayTo: json["monday_to"],
  tuesdayFrom: json["tuesday_from"],
  tuesdayTo: json["tuesday_to"],
  wednesdayFrom: json["wednesday_from"],
  wednesdayTo: json["wednesday_to"],
  thursdayFrom: json["thursday_from"],
  thursdayTo: json["thursday_to"],
  saturdayFrom: json["saturday_from"],
  saturdayTo: json["saturday_to"],
  sundayFrom: json["sunday_from"],
  sundayTo: json["sunday_to"],
  );

  Map<String, dynamic> toJson() => {
  "monday_from": mondayFrom,
  "monday_to": mondayTo,
  "tuesday_from": tuesdayFrom,
  "tuesday_to": tuesdayTo,
  "wednesday_from": wednesdayFrom,
  "wednesday_to": wednesdayTo,
  "thursday_from": thursdayFrom,
  "thursday_to": thursdayTo,
  "saturday_from": saturdayFrom,
  "saturday_to": saturdayTo,
  "sunday_from": sundayFrom,
  "sunday_to": sundayTo,
  };
  }




