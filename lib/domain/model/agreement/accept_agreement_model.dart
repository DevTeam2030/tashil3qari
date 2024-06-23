

class AcceptAgreementModel {
  String title;
  String description;
  double mount;
  int firstUserId;
  int secondUserId;
  String firstUserPercentage;
  String secondUserPercentage;

  AcceptAgreementModel({
    required this.title,
    required this.description,
    required this.mount,
    required this.firstUserId,
    required this.secondUserId,
    required this.firstUserPercentage,
    required this.secondUserPercentage,

  });


  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "mount": mount,
    "first_user_id": firstUserId,
    "second_user_id": secondUserId,
    "first_user_percentage": firstUserPercentage,
    "second_user_percentage": secondUserPercentage,


  };
}
