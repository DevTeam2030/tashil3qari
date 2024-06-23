// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:tashil_agary/app/contants.dart';
// import 'package:tashil_agary/providers/notifications_provider.dart';
//
// import '../app/utils.dart';
// import '../presentation/general/chats/model/chat_message_model.dart';
//
//
// class ChatProvider extends ChangeNotifier {
//   // final NotificationsController _api=NotificationsController();
//
//   bool isLoading=false;
//   final FirebaseFirestore firestore=FirebaseFirestore.instance;
//
//   createUSer({required int userId,required String name,required String email,required String image,required String type}){
//     firestore.collection('users').doc('$userId').set({
//       'user_id':userId,
//       'name':name,
//       'email':email,
//       'image':image,
//       'type':type,
//     },SetOptions(merge: true));
//
//
//   }
//
// Future<void>sentMessagePdf({required BuildContext context, required ChatMessageModel chatMessageModel,})async {
//   File? pdfFile = await Utils.getAttachmentFile(FileType.any);
//   if (pdfFile == null) return;
//   // Upload PDF to Firebase Storage
//   final String pdfFileName = pdfFile.path.split('/').last;
//   Reference storageRef = FirebaseStorage.instance.ref().child('pdfs/$pdfFileName');
//   UploadTask uploadTask = storageRef.putFile(pdfFile);
//   TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
//   String pdfUrl = await taskSnapshot.ref.getDownloadURL();
//   chatMessageModel.message=pdfUrl;
//   chatMessageModel.messageType='pdf';
//    sentMessage(chatMessageModel: chatMessageModel, context: context);
// }
//
// Future<void>sentMessage({required ChatMessageModel chatMessageModel,required BuildContext context})async{
//
//   List<int>ids=[chatMessageModel.senderId,chatMessageModel.receiverId];
//   print(chatMessageModel.toJson());
//   ids.sort();
//   String chatRoomId=ids.join('_');
//   await firestore.collection('chat_rooms').doc(chatRoomId).collection('messages').add(chatMessageModel.toJson());
//   // ignore: use_build_context_synchronously
//   context.read<NotificationsProvider>().sendNotification(context: context,
//       userId: chatMessageModel.receiverId,
//       title: chatMessageModel.senderName, body: chatMessageModel.message);
//
//
// }
//
// Stream<QuerySnapshot>getMessages({required int userId,required int otherId}) {
//   List<int>ids = [userId, otherId];
//   ids.sort();
//   String chatRoomId = ids.join('_');
//
//   var data= firestore.collection('chat_rooms').doc(chatRoomId).collection(
//       'messages').orderBy('timestamp', descending: false).snapshots();
//   return data;
// }
//
//   Future<void> updatePropertyIdInAllMessages({required int userId,required int otherId,required int propertyId,required bool isOpportunity}) async {
//     try {
//       if(propertyId==0)return;
//       List<int>ids = [userId, otherId];
//       ids.sort();
//       String chatRoomId = ids.join('_');
//       // Get all messages in the chat room
//       QuerySnapshot messagesSnapshot = await firestore
//           .collection('chat_rooms')
//           .doc(chatRoomId)
//           .collection('messages')
//           .get();
//
//       // Update senderId for each message
//       for (DocumentSnapshot messageDoc in messagesSnapshot.docs) {
//
//         ChatMessageModel message=  ChatMessageModel.fromJson(messageDoc.data() as Map<String, dynamic>);
//
//         await messageDoc.reference.update({'propertyId': propertyId});
//         await messageDoc.reference.update({'isOpportunity': isOpportunity});
//         bool meSender = message.senderId== Constants.userDataModel!.id;
//         meSender?
//         await messageDoc.reference.update({'senderUnreadMessage': 0}):
//         await messageDoc.reference.update({'receiverUnreadMessage': 0});
//       }
//
//       print('propertyId updated for all messages in the chat room.');
//     } catch (error) {
//       print('Error updating propertyId: $error');
//     }
//   }
//
//   Future<void> updateRejectPdfInAllMessages({required int userId,required int otherId,required bool rejectPdf}) async {
//     try {
//
//       List<int>ids = [userId, otherId];
//       ids.sort();
//       String chatRoomId = ids.join('_');
//       // Get all messages in the chat room
//       QuerySnapshot messagesSnapshot = await firestore
//           .collection('chat_rooms')
//           .doc(chatRoomId)
//           .collection('messages')
//           .get();
//
//       // Update senderId for each message
//       for (DocumentSnapshot messageDoc in messagesSnapshot.docs) {
//         await messageDoc.reference.update({'rejectPdf': rejectPdf});
//       }
//
//       print('propertyId updated for all messages in the chat room.');
//     } catch (error) {
//       print('Error updating propertyId: $error');
//     }
//   }
//   Stream<QuerySnapshot> getChatMessagesForUserId1({required int userId}) {
//
//     List<ChatMessageModel>messages=[];
//     var data= FirebaseFirestore.instance
//         .collectionGroup('messages')
//         .where('senderId', isEqualTo: userId)
//         .orderBy('timestamp', descending: false)
//         .snapshots();
//
//     return data;
//   }
//
//   Stream<List<ChatMessageModel>> getChatMessagesForUserId({required int userId}) {
//     print('ffffffffffffffffffffffffffffffffffffffffffff');
//
//     List<ChatMessageModel>allMessages=[];
//     var data= FirebaseFirestore.instance
//         .collectionGroup('messages')
//         // .where('receiverId', isEqualTo: userId)
//         .orderBy('timestamp', descending: true)
//         .snapshots()
//         .map((snapshot) {
//       List<ChatMessageModel>messages=[];
//       var items = snapshot.docs.map((doc) => ChatMessageModel.fromJson(doc.data())).toList();
//       // messages.addAll(items);
//       List<String>rooms=[];
//       for(var item in items){
//         if(item.senderId==userId||item.receiverId==userId){
//           int senderId=item.senderId;
//           int receiverId=item.receiverId;
//           List<int>ids = [senderId, receiverId];
//           ids.sort();
//           String chatRoomId = ids.join('_');
//
//
//           if(!rooms.contains(chatRoomId)){
//             rooms.add(chatRoomId);
//             messages.add(item);
//           }else{
//             int count =0;
//             for(var msg in messages){
//               int senderId=msg.senderId;
//               int receiverId=msg.receiverId;
//               List<int>ids = [senderId, receiverId];
//               ids.sort();
//               String chatRoomId1 = ids.join('_');
//               if(chatRoomId==chatRoomId1){
//                 msg.senderUnreadMessage+=item.senderUnreadMessage;
//                 msg.receiverUnreadMessage+=item.receiverUnreadMessage;
//               }
//       }
//           }
//
//         }
//
//       }
//
//
//       items=messages;
//       return items;
//     });
//
//
//     return data;
//   }
//  // resetReceiverUnreadMessage() async{
//  //    int userId=Constants.userDataModel!.id;
//  //    try {
//  //      // Query messages where receiverId is equal to userId
//  //      QuerySnapshot messagesSnapshot =  firestore
//  //          .collectionGroup('messages')
//  //          .where('receiverId', isEqualTo: userId)
//  //          .orderBy('timestamp', descending: true)
//  //          .get() as QuerySnapshot<Object?>;
//  //
//  //      // Update propertyId for each message
//  //      for (DocumentSnapshot messageDoc in messagesSnapshot.docs) {
//  //        await messageDoc.reference.update({'receiverUnreadMessage': 0});
//  //      }
//  //
//  //      print('propertyId updated for all messages where receiverId is $userId');
//  //    } catch (error) {
//  //      print('Error updating propertyId: $error');
//  //    }
//  //
//  //
//  //  }
//
//
//   Future<void> deleteMessagesInChatRoom({required int userId,required int otherId,}) async {
//
//     try {
//       List<int>ids = [userId, otherId];
//       ids.sort();
//       String chatRoomId = ids.join('_');
//       QuerySnapshot messagesSnapshot = await firestore
//           .collection('chat_rooms')
//           .doc(chatRoomId)
//           .collection('messages')
//           .get();
//
//       // حذف كل مستند رسالة
//       for (DocumentSnapshot messageDoc in messagesSnapshot.docs) {
//         await messageDoc.reference.delete();
//       }
//
//       Navigator.pop(Constants.navigatorAppKey.currentState!.context);
//       print('تم حذف جميع الرسائل في غرفة الدردشة.');
//     } catch (error) {
//       print('خطأ: $error');
//     }
//   }
//
//
//
//
// }
