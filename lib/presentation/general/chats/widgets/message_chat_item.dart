// part of'widgets_imports.dart';
// class MessageChatItem extends StatelessWidget {
//   final DocumentSnapshot document;
//   final Function() onButtonTap;
//   final bool isOpportunity;
//   const MessageChatItem({Key? key,required this.document,required this.onButtonTap,required this.isOpportunity}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     // ValueKey key=ValueKey<int>(0);
//     Map<String, dynamic> data1 = document.data() as Map<String, dynamic>;
//     ChatMessageModel messageModel=ChatMessageModel.fromJson(data1);
//     bool meSender =messageModel.senderId == Constants.userDataModel!.id;
//     return Container(
//       constraints: BoxConstraints(
//         maxWidth: .7.sw,
//         minWidth: .2.sw,
//       ),
//       child: Column(
//         crossAxisAlignment: meSender?CrossAxisAlignment.start:CrossAxisAlignment.end,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: meSender?MainAxisAlignment.start:MainAxisAlignment.end,
//             children: [
//               Container(
//                 constraints: BoxConstraints(
//                   maxWidth: .7.sw,
//                   minWidth: .2.sw,
//                 ),
//                 padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p16, vertical: PaddingManager.p14),
//                 margin: const EdgeInsets.symmetric(vertical: 6),
//                 decoration: BoxDecoration(
//                   color: meSender?ColorManager.meChatColor:ColorManager.otherChatColor,
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(RadiusManager.r14),
//                     bottomRight: const Radius.circular(RadiusManager.r14),
//                     topLeft: meSender?Radius.circular(RadiusManager.r14):Radius.circular(0),
//                     topRight: meSender?Radius.circular(0):Radius.circular(RadiusManager.r14),
//                   )
//
//                 ),
//
//                 child:   Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     if(messageModel.messageType=='pdf')
//                       InkWell(
//                         onTap: ()async{
//                           UrlLauncherMethods.launchURL(url: messageModel.message);
//                           // Utils.downloadImage(context: context,
//                         },
//                         child: CircleAvatar(
//                             radius: 20,
//                             backgroundColor:ColorManager.white,
//                             child: Icon(Icons.file_download_outlined,size: 16,color: ColorManager.black,)
//                         ),
//                       ),
//                     if(messageModel.messageType=='pdf')Image.asset(ImageManager.pdfPng,height: 22,width: 22,),
//                     Flexible(
//                       child: AppText(
//                         title: messageModel.messageType=='pdf'?'pdfFile'.tr():messageModel.message,
//                         titleSize:FontSize.s12,
//                         titleMaxLines: 100,
//                         titleHeight: 1.3,
//                         titleAlign: TextAlign.start,
//                         titleColor: meSender?ColorManager.black:ColorManager.white,
//                         fontWeightType: FontWeightType.regular,
//                       ),
//                     ),
//
//
//                   ],
//                 ),
//               ),
//             ],
//           ),
//
//
//           if(messageModel.messageType=='pdf'&&!meSender)
//             const AppSizeBox(height: 8,),
//           if(messageModel.messageType=='pdf'
//               &&!meSender
//               &&messageModel.propertyId!=null&&messageModel.propertyId!>0
//               && messageModel.rejectPdf==null
//           )
//             Row(
//               mainAxisAlignment: meSender?MainAxisAlignment.start:MainAxisAlignment.end,
//               // mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 MyTextButton(title:'Make agreement'.tr(),
//                     size: Size( .3.sw,  40),
//                     radius: 10,
//                     fontWeightType: FontWeightType.bold,
//                     titleSize: FontSize.s14,
//                     primaryColor: ColorManager.primary,
//                     titleColor: ColorManager.white,
//                     onPressed: ()async{
//
//                       if(isOpportunity){
//                         SentOpportunityAgreementRequestModel model=SentOpportunityAgreementRequestModel(
//                             realEstateOpportunitieId: messageModel.propertyId!,
//                             agreementFile: messageModel.message,
//                             receiverUserId: messageModel.receiverId,
//                             senderUserId:messageModel.senderId
//                         );
//                         await  context.read<AgreementsProvider>().addOpportunityAgreement(context: context, model: model);
//                       }
//                         else{
//                         SentAgreementRequestModel model=SentAgreementRequestModel(
//                         propertyId: messageModel.propertyId!,
//                         agreementFile: messageModel.message,
//                         receiverUserId: messageModel.receiverId,
//                         senderUserId:messageModel.senderId
//                         );
//                         await context.read<AgreementsProvider>().addAgreement(context: context, model: model);
//                       }
//                       onButtonTap();
//                     }),
//
//                 AppSizeBox(width: 4,),
//
//                 MyTextButton(title:'reject'.tr(),
//                     size: Size( .3.sw,  40),
//                     radius: 10,
//                     fontWeightType: FontWeightType.bold,
//                     titleSize: FontSize.s14,
//                     primaryColor: ColorManager.primary2,
//                     titleColor: ColorManager.white,
//                     onPressed: ()async{
//                     await  context.read<ChatProvider>().updateRejectPdfInAllMessages(
//                           userId:messageModel.senderId, otherId:messageModel.receiverId,rejectPdf: true);
//                       onButtonTap();
//
//                     }),
//               ],
//             ),
//         ],
//       ),
//     );
//   }
// }
//
//
