
class CancelReasonModel {
  CancelReasonModel({
    required this.id,
    required this.title,
  });

  int id;
  String title;

  factory CancelReasonModel.fromJson(Map<String, dynamic> json) => CancelReasonModel(
    id: json["id"],
    title: json["title"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };
}
