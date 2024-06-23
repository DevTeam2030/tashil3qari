
class ReviewModel {
  String name;
  String image;
  double rate;
  String comment;
  String date;

  ReviewModel({
    required this.name,
    required this.image,
    required this.rate,
    required this.comment,
    required this.date,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    name: json["name"]??'',
    image: json["image"]??"",
    rate: double.tryParse(json["rate"].toString())??0,
    comment: json["comment"]??'',
    date: json["date"]??'',
  );

}



