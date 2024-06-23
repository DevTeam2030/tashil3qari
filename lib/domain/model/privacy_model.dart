class PrivacyModel {
  PrivacyModel({
    required this.id,
    required this.title,
    required this.content,

  });

  int id;
  String title;
  String content;


  factory PrivacyModel.fromJson(Map<String, dynamic> json) => PrivacyModel(
    id: json["id"]??0,
    content: json["content"]??'',
    title: json["title"]??'',


  );


}