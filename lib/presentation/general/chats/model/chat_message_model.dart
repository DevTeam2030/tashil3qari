

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../app/enums.dart';

class ChatMessageModel {
  int receiverId;
  int receiverUnreadMessage;
  String receiverName;
  String receiverImage;
  String receiverType;
  int senderId;
  String senderName;
  String senderImage;
  String senderType;
  int senderUnreadMessage;
  Timestamp timestamp;
  String message;
  String messageType;
  int? propertyId;
  bool isOpportunity;
  bool? rejectPdf;





  ChatMessageModel({
    required this.receiverId,
    required this.receiverUnreadMessage,
    required this.receiverName,
    required this.receiverImage,
    required this.receiverType,
    required this.senderId,
    required this.senderName,
    required this.senderImage,
    required this.senderType,
    required this.senderUnreadMessage,
    required this.timestamp,
    required this.message,
    required this.messageType,
    required this.propertyId,
    required this.rejectPdf,
    required this.isOpportunity,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) => ChatMessageModel(
    receiverId: json["receiverId"],
    receiverName: json["receiverName"]??'',
    receiverImage: json["receiverImage"]??'',
    receiverType: json["receiverType"]??'',
    senderId: json["senderId"],
    senderName: json["senderName"]??'',
    senderImage: json["senderImage"]??'',
    senderType: json["senderType"]??'',
    timestamp: json["timestamp"],
    message: json["message"]??'',
    messageType: json["messageType"]??'',
    propertyId: json["propertyId"]??0,
    senderUnreadMessage: json["senderUnreadMessage"]??0,
    receiverUnreadMessage: json["receiverUnreadMessage"]??0,
    rejectPdf: json["rejectPdf"],
    isOpportunity: json["isOpportunity"]??false,
  );


  Map<String, dynamic> toJson() => {
    "receiverId": receiverId,
    "receiverName": receiverName,
    "receiverImage": receiverImage,
    "receiverType": receiverType,
    "senderId": senderId,
    "senderImage": senderImage,
    "senderName": senderName,
    "senderType": senderType,
    "timestamp": timestamp,
    "message": message,
    "messageType": messageType,
    "propertyId": propertyId,
    "rejectPdf": rejectPdf,
    "senderUnreadMessage": senderUnreadMessage,
    "receiverUnreadMessage": receiverUnreadMessage,
    "isOpportunity": isOpportunity,
  };
}

class ChatAgreementMessageModel {
  int receiverId;
  int receiverUnreadMessage;
  String receiverName;
  String receiverImage;
  // UserType receiverType;
  int senderId;
  String senderName;
  String senderImage;
  // UserType senderType;
  int senderUnreadMessage;
  Timestamp timestamp;
  String message;
  ChatAgreementMessageType messageType;






  ChatAgreementMessageModel({
    required this.receiverId,
    required this.receiverUnreadMessage,
    required this.receiverName,
    required this.receiverImage,
    // required this.receiverType,
    required this.senderId,
    required this.senderName,
    required this.senderImage,
    // required this.senderType,
    required this.senderUnreadMessage,
    required this.timestamp,
    required this.message,
    required this.messageType,

  });

  factory ChatAgreementMessageModel.fromJson(Map<String, dynamic> json) => ChatAgreementMessageModel(
    receiverId: json["receiverId"],
    receiverName: json["receiverName"]??'',
    receiverImage: json["receiverImage"]??'',

    senderId: json["senderId"],
    senderName: json["senderName"]??'',
    senderImage: json["senderImage"]??'',
    // senderType: (json["senderType"]??'')=='consultant'?UserType.consultant:UserType.user,
    // receiverType: (json["receiverType"]??'')=='consultant'?UserType.consultant:UserType.user,
    timestamp: json["timestamp"],
    message: json["message"]??'',
    messageType: (json["messageType"]??'')=='agreement'?ChatAgreementMessageType.agreement:ChatAgreementMessageType.text,
    senderUnreadMessage: json["senderUnreadMessage"]??0,
    receiverUnreadMessage: json["receiverUnreadMessage"]??0,
  );


  Map<String, dynamic> toJson() => {
    "receiverId": receiverId,
    "receiverName": receiverName,
    "receiverImage": receiverImage,
    "senderId": senderId,
    "senderImage": senderImage,
    "senderName": senderName,
    // "senderType": senderType==UserType.consultant?'consultant':'normal',
    // "receiverType": receiverType==UserType.consultant?'consultant':'normal',
    "timestamp": timestamp,
    "message": message,
    "messageType": messageType==ChatAgreementMessageType.agreement?'agreement':'text',
    "senderUnreadMessage": senderUnreadMessage,
    "receiverUnreadMessage": receiverUnreadMessage,

  };
}


class ChatAgreementModel {
  int agreementCreateId;
  int firstPersonId;
  int secondPersonId;
  double firstPersonPercentage;
  double secondPersonPercentage;
  double totalCommission;
  String  agreementTitle;
  String  agreementDetails;
  String  refusedReason;






  ChatAgreementModel({
    required this.agreementCreateId,
    required this.firstPersonId,
    required this.secondPersonId,
    required this.totalCommission,
    required this.firstPersonPercentage,
    required this.secondPersonPercentage,
    required this.agreementTitle,
    required this.agreementDetails,
    required this.refusedReason,

  });

  factory ChatAgreementModel.fromJson(Map<String, dynamic> json) => ChatAgreementModel(
    agreementCreateId: json["agreementCreateId"],
    firstPersonId: json["firstPersonId"],
    secondPersonId: json["secondPersonId"],
    totalCommission: json["totalCommission"],
    firstPersonPercentage: json["firstPersonPercentage"],
    secondPersonPercentage: json["secondPersonPercentage"],
    agreementTitle: json["agreementTitle"],
    agreementDetails: json["agreementDetails"],
    refusedReason: json["refusedReason"],
  );


  Map<String, dynamic> toJson() => {
    "agreementCreateId": agreementCreateId,
    "firstPersonId": firstPersonId,
    "secondPersonId": secondPersonId,
    "firstPersonPercentage": firstPersonPercentage,
    "secondPersonPercentage": secondPersonPercentage,
    "totalCommission": totalCommission,
    "agreementTitle": agreementTitle,
    "agreementDetails": agreementDetails,
    "refusedReason": refusedReason,
  };
}