

class AddConsultantAgreementModel {
  int agreementId;
  int firstUserId;
  int secondUserId;
  String firstUserPercentage;
  String secondUserPercentage;

  AddConsultantAgreementModel({
  required this.agreementId,
  required this.firstUserId,
  required this.secondUserId,
  required this.firstUserPercentage,
  required this.secondUserPercentage,
  });

  Map<String, dynamic> toJson() => {
  "agreement_id": agreementId,
  "first_user_id": firstUserId,
  "second_user_id": secondUserId,
  "first_user_percentage": firstUserPercentage,
  "second_user_percentage": secondUserPercentage,
  };
  }
