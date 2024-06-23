


class AgreementDetailsModel {
  int id;
  String title;
  String pdfFile;
  String description;
  String firstUser;
  String firstUserId;
  String firstUserSerialNumber;
  String secondUser;
  String secondUserId;
  String secondUserSerialNumber;
  String firstUserPercentage;
  String secondUserPercentage;
  String firstUserImage;
  String secondUserImage;
  String mount;
  String code;
  List<AgreementDetailsConsultModel> firstConsults;
  List<AgreementDetailsConsultModel> secondConsults;

  AgreementDetailsModel({
    required this.id,
    required this.title,
    required this.pdfFile,
    required this.description,
    required this.firstUser,
    required this.firstUserId,
    required this.firstUserSerialNumber,
    required this.secondUser,
    required this.secondUserId,
    required this.secondUserSerialNumber,
    required this.firstUserPercentage,
    required this.secondUserPercentage,
    required this.mount,
    required this.code,
    required this.firstConsults,
    required this.secondConsults,
    required this.firstUserImage,
    required this.secondUserImage,
  });

  factory AgreementDetailsModel.fromJson(Map<String, dynamic> json) => AgreementDetailsModel(
    id: json["id"],
    title: json["title"]??'',
    pdfFile: json["pdf_file"]??'',
    description: json["description"]??'',
    firstUser: json["first_user"]??'',
    firstUserId: json["first_user_id"]??'',
    firstUserSerialNumber: json["first_user_serial_number"]??'',
    secondUser: json["second_user"]??'',
    secondUserId: json["second_user_id"]??'',
    secondUserSerialNumber: json["second_user_serial_number"]??'',
    firstUserImage: json["first_user_image"]??'',
    secondUserImage: json["second_user_image"]??'',
    firstUserPercentage: json["first_user_percentage"]??'0',
    secondUserPercentage: json["second_user_percentage"]??'0',
    mount: json["mount"]??'0',
    code: json["code"]??'',
    firstConsults: List<AgreementDetailsConsultModel>.from(json["FirstConsults"].map((x) => AgreementDetailsConsultModel.fromJson(x))),
    secondConsults: List<AgreementDetailsConsultModel>.from(json["secondConsults"].map((x) => AgreementDetailsConsultModel.fromJson(x))),
  );

}

class AgreementDetailsConsultModel {
  int id;
  String firstUser;
  String firstUserId;
  String firstUserSerialNumber;
  String secondUser;
  String secondUserId;
  String secondUserSerialNumber;
  String firstUserPercentage;
  String secondUserPercentage;

  AgreementDetailsConsultModel({
    required this.id,
    required this.firstUser,
    required this.firstUserId,
    required this.firstUserSerialNumber,
    required this.secondUser,
    required this.secondUserId,
    required this.secondUserSerialNumber,
    required this.firstUserPercentage,
    required this.secondUserPercentage,
  });

  factory AgreementDetailsConsultModel.fromJson(Map<String, dynamic> json) => AgreementDetailsConsultModel(
    id: json["id"],
    firstUser: json["first_user"]??'',
    firstUserId: json["first_user_id"]??'',
    firstUserSerialNumber: json["first_user_serial_number"]??'',
    secondUser: json["second_user"]??'',
    secondUserId: json["second_user_id"]??'',
    secondUserSerialNumber: json["second_user_serial_number"]??'',
    firstUserPercentage: json["first_user_percentage"]??'',
    secondUserPercentage: json["second_user_percentage"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_user": firstUser,
    "first_user_id": firstUserId,
    "first_user_serial_number": firstUserSerialNumber,
    "second_user": secondUser,
    "second_user_id": secondUserId,
    "second_user_serial_number": secondUserSerialNumber,
    "first_user_percentage": firstUserPercentage,
    "second_user_percentage": secondUserPercentage,
  };
}
