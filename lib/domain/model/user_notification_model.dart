
class NotificationModel {
  int id;
  String image;
  String propertyId;

  String notTitle;
  String message;
  DateTime date;
  String type;
  String status;
  String userPhone;
  int userId;
  String userName;
  String userImage;
  String notType;










  NotificationModel({
    required this.id,
    required this.image,
    required this.propertyId,
    required this.notTitle,
    required this.message,
    required this.date,
    required this.type,
    required this.status,
    required this.userPhone,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.notType,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    id: json["id"],
    image: json["image"]??'',
    propertyId: json["property_id"]??'',
    notTitle: json["not_title"]??'',
    message: json["message"]??'',
    date: DateTime.tryParse(json["date"])??DateTime.now(),
    type: json["type"]??'',
    status: json["status"]??'',
    userPhone: json["user_phone"]??'',
    userId: int.tryParse(json["user_id"].toString())??0,
    userName: json["user_name"]??'',
    userImage: json["user_image"]??'',
    notType  : json["not_type"]??'',

  );


}






