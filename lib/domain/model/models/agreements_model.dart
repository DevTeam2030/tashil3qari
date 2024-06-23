


import 'dart:io';

class AddConsultantAgreementRequestModel {
  int mainConsultantId;
  int subConsultantId;
  int realEstateOpportunityId;
  double mainConsultantRate;
  double subConsultantRate;



  AddConsultantAgreementRequestModel({
    required this.mainConsultantId,
    required this.subConsultantId,
    required this.realEstateOpportunityId,
    required this.mainConsultantRate,
    required this.subConsultantRate,
  });



  Map<String, dynamic> toJson() => {
    "main_consultant_id": mainConsultantId,
    "sub_consultant_id": subConsultantId,
    "real_estate_opportunity_id": realEstateOpportunityId,
    "main_consultant_rate": mainConsultantRate,
    "sub_consultant_rate": subConsultantRate,

  };
}

class SentAgreementRequestModel {
  int senderUserId;
  int receiverUserId;
  int propertyId;
  String agreementFile;

  SentAgreementRequestModel({
    required this.senderUserId,
    required this.receiverUserId,
    required this.propertyId,
    required this.agreementFile,
  });



  Map<String, dynamic> toJson() => {
    "sender_user_id": senderUserId,
    "receiver_user_id": receiverUserId,
    "property_id": propertyId,
    "agreement_file": agreementFile,
  };
}

class SentOpportunityAgreementRequestModel {
  int senderUserId;
  int receiverUserId;
  int realEstateOpportunitieId  ;
  String agreementFile;

  SentOpportunityAgreementRequestModel({
    required this.senderUserId,
    required this.receiverUserId,
    required this.realEstateOpportunitieId,
    required this.agreementFile,
  });



  Map<String, dynamic> toJson() => {
    "sender_user_id": senderUserId,
    "receiver_user_id": receiverUserId,
    "real_estate_opportunitie_id": realEstateOpportunitieId,
    "agreement_file": agreementFile,
  };
}

class PdfRequestModel {
  int senderUserId;
  int receiverUserId;
  int propertyId;
  File agreementFile;

  PdfRequestModel({
    required this.senderUserId,
    required this.receiverUserId,
    required this.propertyId,
    required this.agreementFile,
  });



  Map<String, dynamic> toJson() => {
    "sender_user_id": senderUserId,
    "receiver_user_id": receiverUserId,
    "property_id": propertyId,
    "file": agreementFile,
  };
}



class AgreementModel {
  int id;
  String senderUserId;
  String senderName;
  String receiverUserId;
  String receiverName;
  String propertyId;
  String realEstateOpportunitieId;
  String agreementFile;


  AgreementModel({
    required this.id,
    required this.senderUserId,
    required this.senderName,
    required this.receiverUserId,
    required this.receiverName,
    required this.propertyId,
    required this.agreementFile,
    required this.realEstateOpportunitieId,
  });

  factory AgreementModel.fromJson(Map<String, dynamic> json) => AgreementModel(
    id: json["id"],
    senderUserId: json["sender_user_id"]??'',
    senderName: json["sender_name"]??'',
    receiverUserId: json["receiver_user_id"]??'',
    receiverName: json["receiver_name"]??'',
    propertyId: json["property_id"]??'',
    realEstateOpportunitieId: json["real_estate_opportunitie_id"]??'',
    agreementFile: json["agreement_file"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sender_user_id": senderUserId,
    "sender_name": senderName,
    "receiver_user_id": receiverUserId,
    "receiver_name": receiverName,
    "property_id": propertyId,
    "agreement_file": agreementFile,
  };
}
