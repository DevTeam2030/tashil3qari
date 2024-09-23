
class FollowingUserModel {
  FollowingUserModel({
    required this.id,
    required this.name,
    required this.image,
  });

  int id;
  String name;
  String image;

  factory FollowingUserModel.fromJson(Map<String, dynamic> json) => FollowingUserModel(
    id: json["id"],
    name: json["name"]??'',
    image: json["image"]??'',
  );


}
