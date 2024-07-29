
class ConsultantCommentModel {
  int id;
  String userName;
  String userId;
  String rate;
  String comment;
  List<ConsultantReplyModel> replies;

  ConsultantCommentModel({
    required this.id,
    required this.userName,
    required this.userId,
    required this.rate,
    required this.comment,
    required this.replies,
  });

  factory ConsultantCommentModel.fromJson(Map<String, dynamic> json) => ConsultantCommentModel(
    id: json["id"],
    userName: json["user_name"],
    userId: json["user_id"],
    rate: json["rate"],
    comment: json["comment"],
    replies: List<ConsultantReplyModel>.from(json["replies"].map((x) => ConsultantReplyModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_name": userName,
    "user_id": userId,
    "rate": rate,
    "comment": comment,
    "replies": List<dynamic>.from(replies.map((x) => x.toJson())),
  };
}

class ConsultantReplyModel {
  String comment;

  ConsultantReplyModel({
    required this.comment,
  });

  factory ConsultantReplyModel.fromJson(Map<String, dynamic> json) => ConsultantReplyModel(
    comment: json["comment"],
  );

  Map<String, dynamic> toJson() => {
    "comment": comment,
  };
}
