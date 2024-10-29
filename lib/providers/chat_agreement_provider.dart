import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/providers/notifications_provider.dart';

import '../app/enums.dart';
import '../components/loading_manager.dart';
import '../domain/controller/agreements_controller.dart';
import '../domain/model/agreement/accept_agreement_model.dart';
import '../domain/model/agreement/add_consultant_agreement_model.dart';
import '../presentation/general/chats/model/chat_message_model.dart';
import 'council_provider.dart';


class ChatAgreementDataProvider extends ChangeNotifier {
  final AgreementsController _api=AgreementsController();
String agreementCollectionName='agreements_rooms';
String agreementSubCollectionName='agreements';
bool haveAgreementInChat=false;
String chatCollectionName='chat_agreements_rooms';
String chatSubCollectionName='messages';
  bool isLoading=false;
  bool isLoadingAgreement=false;
  final FirebaseFirestore firestore=FirebaseFirestore.instance;


  Future<void> updateSeenMessages({required int userId,required int otherId,}) async {
    try {
      List<int>ids = [userId, otherId];
      ids.sort();
      String chatRoomId = ids.join('_');
      // Get all messages in the chat room
      QuerySnapshot messagesSnapshot = await firestore
          .collection(chatCollectionName)
          .doc(chatRoomId)
          .collection(chatSubCollectionName)
          .get();

      // Update senderId for each message
      for (DocumentSnapshot messageDoc in messagesSnapshot.docs) {

        ChatMessageModel message=  ChatMessageModel.fromJson(messageDoc.data() as Map<String, dynamic>);
        bool meSender = message.senderId== Constants.userDataModel!.id;
        meSender?
        await messageDoc.reference.update({'senderUnreadMessage': 0}):
        await messageDoc.reference.update({'receiverUnreadMessage': 0});
      }


      print('propertyId updated for all messages in the chat room.');
    } catch (error) {
      print('Error updating propertyId: $error');
    }

     isLoading=false;
    notifyListeners();
  
  }


  Future<void> cancelAgreementInFireBase({required int userId,required int otherId,required BuildContext context,required bool isCancel}) async {
    try {
      List<int>ids = [userId, otherId];
      ids.sort();
      String chatRoomId = ids.join('_');
      // Get all messages in the chat room
      QuerySnapshot messagesSnapshot = await firestore
          .collection(chatCollectionName)
          .doc(chatRoomId)
          .collection(chatSubCollectionName)
          .get();

      // Update senderId for each message
      for (DocumentSnapshot messageDoc in messagesSnapshot.docs) {
        await messageDoc.reference.update({'messageType': 'text'});
      }
      Navigator.pop(context);
      if(isCancel==true)
      LoadingDialog.showSimpleToast('agreement has been cancelled'.tr());
      checkIfHaveOpenAgreement(receiverId: userId==Constants.userDataModel!.id?otherId:userId);
      print('propertyId updated for all messageType');
    } catch (error) {
      print('Error updating propertyId: $error');
    }
    isLoadingAgreement=false;
    notifyListeners();
  }



Future<void>sentMessage({required ChatAgreementMessageModel model,required BuildContext context})async{

  List<int>ids=[model.senderId,model.receiverId];
  ids.sort();
  String chatRoomId=ids.join('_');
  await firestore.collection(chatCollectionName).doc(chatRoomId).collection(chatSubCollectionName).add(model.toJson());
  BuildContext ctx=Constants.navigatorAppKey.currentState!.context;
  // ignore: use_build_context_synchronously
  ctx.read<NotificationsProvider>().sendNotification(context: ctx,
      userId: model.receiverId,
      title: model.senderName, body: model.message);
  checkIfHaveOpenAgreement(receiverId: model.senderId==Constants.userDataModel!.id?model.receiverId:model.senderId);


}

Stream<QuerySnapshot>getMessages({required int userId,required int otherId}) {
  List<int>ids = [userId, otherId];
  ids.sort();
  String chatRoomId = ids.join('_');

  var data= firestore.collection(chatCollectionName).doc(chatRoomId).collection(
      chatSubCollectionName).orderBy('timestamp', descending: false).snapshots();
  checkIfHaveOpenAgreement(receiverId: userId==Constants.userDataModel!.id?otherId:userId);
  isLoading=false;
  // notifyListeners();

  return data;
}


Future<void>makeAgreementInFireBase({required ChatAgreementModel chatAgreementModel,
  required ChatAgreementMessageModel messageModel,required BuildContext context})async{
  isLoadingAgreement=true;
  notifyListeners();

  List<int>ids=[chatAgreementModel.firstPersonId,chatAgreementModel.secondPersonId];
  ids.sort();
  String chatRoomId=ids.join('_');


  QuerySnapshot messagesSnapshot = await firestore
      .collection(agreementCollectionName)
      .doc(chatRoomId)
      .collection(agreementSubCollectionName)
      .get();
  if(messagesSnapshot.docs.isEmpty){
    await firestore.collection(agreementCollectionName).doc(chatRoomId).
    collection(agreementSubCollectionName).add(chatAgreementModel.toJson());
  }
  else{
    await firestore.collection(agreementCollectionName).doc(chatRoomId).collection(agreementSubCollectionName).
    doc(messagesSnapshot.docs.first.id).update(chatAgreementModel.toJson());
  }


  //----------- to delete previous argeements message and convert it to text message
  QuerySnapshot messagesSnapshotMessages =  await firestore.collection(chatCollectionName).doc(chatRoomId).collection(chatSubCollectionName)
      .get();
  for (DocumentSnapshot messageDoc in messagesSnapshotMessages.docs) {
    await messageDoc.reference.update({'messageType': 'text'});
  }

//----  to sent message by new agreement data
  sentMessage(model: messageModel, context: context);


  // ignore: use_build_context_synchronously
  context.read<NotificationsProvider>().sendNotification(context: context,
      userId: chatAgreementModel.firstPersonId==Constants.userDataModel!.id?chatAgreementModel.secondPersonId:chatAgreementModel.firstPersonId,
      title: '${Constants.userDataModel!.firstName} ${Constants.userDataModel!.lastName}',
      body: chatAgreementModel.agreementTitle);
  Navigator.pop(context);
  LoadingDialog.showSimpleToast('details have been sent successfully'.tr());

  isLoadingAgreement=false;
  notifyListeners();
}


Future<List<ChatAgreementModel>> geRoomAgreement({required int receiverId}) async{
  List<ChatAgreementModel>messages = [];
  List<int>ids=[Constants.userDataModel!.id,receiverId];
  ids.sort();
  String chatRoomId=ids.join('_');
  QuerySnapshot messagesSnapshot = await firestore
      .collection(agreementCollectionName)
      .doc(chatRoomId)
      .collection(agreementSubCollectionName)
      .get();

  if(messagesSnapshot.docs.isNotEmpty){
    messages.add(ChatAgreementModel.fromJson( messagesSnapshot.docs.last.data() as Map<String, dynamic>));
  }
  return messages;

}

  Future<void> checkIfHaveOpenAgreement({required int receiverId}) async{
    // isLoading=true;
    List<ChatAgreementMessageModel>messages = [];
    List<int>ids=[Constants.userDataModel!.id,receiverId];
    ids.sort();
    String chatRoomId=ids.join('_');
    QuerySnapshot messagesSnapshot = await firestore
        .collection(chatCollectionName)
        .doc(chatRoomId)
        .collection(chatSubCollectionName)
        .get();


    for(var message in messagesSnapshot.docs){
      messages.add(ChatAgreementMessageModel.fromJson( message.data() as Map<String, dynamic>));
    }

    haveAgreementInChat= messages.where((element) => element.messageType==ChatAgreementMessageType.agreement).toList().isNotEmpty;
    isLoading=false;
    notifyListeners();
  }
  //----------------------------------------------








  Future<void> updateRejectPdfInAllMessages({required int userId,required int otherId,required bool rejectPdf}) async {
    try {

      List<int>ids = [userId, otherId];
      ids.sort();
      String chatRoomId = ids.join('_');
      // Get all messages in the chat room
      QuerySnapshot messagesSnapshot = await firestore
          .collection('chat_rooms')
          .doc(chatRoomId)
          .collection('messages')
          .get();

      // Update senderId for each message
      for (DocumentSnapshot messageDoc in messagesSnapshot.docs) {
        await messageDoc.reference.update({'rejectPdf': rejectPdf});
      }

      print('propertyId updated for all messages in the chat room.');
    } catch (error) {
      print('Error updating propertyId: $error');
    }
  }
  Stream<QuerySnapshot> getChatMessagesForUserId1({required int userId}) {

    List<ChatMessageModel>messages=[];
    var data= FirebaseFirestore.instance
        .collectionGroup('messages')
        .where('senderId', isEqualTo: userId)
        .orderBy('timestamp', descending: false)
        .snapshots();

    return data;
  }

int unReadMessages=0;




  Stream<List<ChatMessageModel>> getUnreadChatMessages() {
    int userId=Constants.userDataModel!.id;
    var data= FirebaseFirestore.instance
        .collectionGroup(chatSubCollectionName)
        // .where('receiverId', isEqualTo: userId)
        .orderBy('timestamp', descending: true)

        .snapshots()
        .map((snapshot) {
      List<ChatMessageModel>messages=[];
      var items = snapshot.docs.map((doc) => ChatMessageModel.fromJson(doc.data())).toList();
      print('--------------- ${items.length} -----------');
      // messages.addAll(items);
      List<String>rooms=[];
      for(var item in items){
        if(item.senderId==userId||item.receiverId==userId){
          bool meSender = item.senderId== userId;
           int count=!meSender?item.receiverUnreadMessage:item.senderUnreadMessage;
           unReadMessages+=count;
           print('eeeeeeeeee${item.receiverUnreadMessage}');
           print('---------------- ${item.senderUnreadMessage}');
        }

      }


      items=messages;
      return items;
    });

    return data;
  }
  Stream<List<ChatMessageModel>> getChatMessagesForUserId({required int userId}) {
    List<ChatMessageModel>allMessages=[];
    var data= FirebaseFirestore.instance
        .collectionGroup(chatSubCollectionName)
        // .where('receiverId', isEqualTo: userId)
        .orderBy('timestamp', descending: true)

        .snapshots()
        .map((snapshot) {
      List<ChatMessageModel>messages=[];
      var items = snapshot.docs.map((doc) => ChatMessageModel.fromJson(doc.data())).toList();
      print('--------------- ${items.length} -----------');
      // messages.addAll(items);
      List<String>rooms=[];
      for(var item in items){
        if(item.senderId==userId||item.receiverId==userId){
          int senderId=item.senderId;
          int receiverId=item.receiverId;
          List<int>ids = [senderId, receiverId];
          ids.sort();
          String chatRoomId = ids.join('_');


          if(!rooms.contains(chatRoomId)){
            rooms.add(chatRoomId);
            messages.add(item);
          }else{
            int count =0;
            for(var msg in messages){
              int senderId=msg.senderId;
              int receiverId=msg.receiverId;
              List<int>ids = [senderId, receiverId];
              ids.sort();
              String chatRoomId1 = ids.join('_');
              if(chatRoomId==chatRoomId1){
                msg.senderUnreadMessage+=item.senderUnreadMessage;
                msg.receiverUnreadMessage+=item.receiverUnreadMessage;
              }
      }
          }

        }

      }


      items=messages;
      return items;
    });


    return data;
  }
 // resetReceiverUnreadMessage() async{
 //    int userId=Constants.userDataModel!.id;
 //    try {
 //      // Query messages where receiverId is equal to userId
 //      QuerySnapshot messagesSnapshot =  firestore
 //          .collectionGroup('messages')
 //          .where('receiverId', isEqualTo: userId)
 //          .orderBy('timestamp', descending: true)
 //          .get() as QuerySnapshot<Object?>;
 //
 //      // Update propertyId for each message
 //      for (DocumentSnapshot messageDoc in messagesSnapshot.docs) {
 //        await messageDoc.reference.update({'receiverUnreadMessage': 0});
 //      }
 //
 //      print('propertyId updated for all messages where receiverId is $userId');
 //    } catch (error) {
 //      print('Error updating propertyId: $error');
 //    }
 //
 //
 //  }


  Future<void> deleteMessagesInChatRoom({required int userId,required int otherId,}) async {

    try {
      List<int>ids = [userId, otherId];
      ids.sort();
      String chatRoomId = ids.join('_');
      QuerySnapshot messagesSnapshot = await firestore
          .collection(chatCollectionName)
          .doc(chatRoomId)
          .collection(chatSubCollectionName)
          .get();

      // حذف كل مستند رسالة
      for (DocumentSnapshot messageDoc in messagesSnapshot.docs) {
        await messageDoc.reference.delete();
      }

      Navigator.pop(Constants.navigatorAppKey.currentState!.context);
      print('تم حذف جميع الرسائل في غرفة الدردشة.');
    } catch (error) {
      print('خطأ: $error');
    }
  }

Future<void>acceptAgreement({required BuildContext context,required AcceptAgreementModel model})async{
  isLoadingAgreement=true;
  notifyListeners();
  bool data=await _api.acceptAgreement(context: context,model: model);
  // ignore: use_build_context_synchronously
  if(data)cancelAgreementInFireBase(userId: model.firstUserId, otherId: model.secondUserId, context: context, isCancel: false);

  isLoadingAgreement=false;
    notifyListeners();


}
  Future<void>addConsultantEstateAgreement({required BuildContext context,required AddConsultantAgreementModel model})async{

    isLoading=true;
    notifyListeners();
    bool added=await _api.addConsultantEstateAgreement(context: context,model: model);
    if(added)   context.read<CouncilProvider>().getOpportunities(context: context,);
    isLoading=false;
    notifyListeners();
  }


}
