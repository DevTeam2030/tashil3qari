import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/screen_loading.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import '../../../../app/contants.dart';
import '../../../../app/enums.dart';
import '../../../../components/text_field/text_field_imports.dart';
import '../../../../providers/chat_agreement_provider.dart';
import '../../../../utilites/font_manager.dart';
import '../../../../utilites/styles_manager.dart';
import '../../../../utilites/values_manager.dart';
import '../model/chat_message_model.dart';
import '../widgets/widgets_imports.dart';


class ChatAgreementScreen extends StatefulWidget {
  final int receiverId;
  final String receiverName,receiverImage;
  final UserType receiverType;
  const ChatAgreementScreen({Key? key,required this.receiverId,required this.receiverName,required this.receiverImage,
    required this.receiverType,}) : super(key: key);

  @override
  State<ChatAgreementScreen> createState() => _ChatAgreementScreenState();
}

class _ChatAgreementScreenState extends State<ChatAgreementScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController messageController = TextEditingController();
  ScrollController messageScrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    context.read<ChatAgreementDataProvider>().isLoading=false;
    context.read<ChatAgreementDataProvider>().isLoadingAgreement=false;
    context.read<ChatAgreementDataProvider>().checkIfHaveOpenAgreement(receiverId: widget.receiverId,);
    context.read<ChatAgreementDataProvider>().updateSeenMessages(userId:  Constants.userDataModel!.id, otherId: widget.receiverId,);
  }
  @override
  void dispose() {
    messageController.dispose();
    messageScrollController.dispose();
    super.dispose();

  }
bool isJumpBefor=false;
  scrollJump([int? duration]) {
    if(isJumpBefor)return;
    Future.delayed( Duration(milliseconds: duration??50), () {
      if (messageScrollController.hasClients) {
        isJumpBefor=true;
        messageScrollController.jumpTo(
          messageScrollController.position.maxScrollExtent,
        );
      }


    });}
  @override
  Widget build(BuildContext context) {
    return  Consumer<ChatAgreementDataProvider>(
        builder: (context, provider, child) =>  Scaffold(
            appBar: ChatAppBar(
                receiverName: widget.receiverName,
                receiverImage: widget.receiverImage,
                receiverType: widget.receiverType,
                receiverId:widget.receiverId,
              showAgreementButton: !provider.haveAgreementInChat,
            ),
            body:ScreenLoading(
              isLoading: provider.isLoading,
              child: Container(
                height: 1.0.sh,
                width: 1.0.sw,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Stack(
                  children: [
                    Container(
                      width: 1.0.sw,
                      height: 1.0.sh,
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 24),
                      child: StreamBuilder<QuerySnapshot>(
                          stream: provider.getMessages(userId: Constants.userDataModel!.id, otherId: widget.receiverId),
                          builder: (context, snapshot) {
                            if(snapshot.hasError){
                              return Center(
                                child:AppText(title:'An error occurred in retrieving data'.tr(),
                                  titleSize:FontSize.s12,
                                  titleMaxLines: 100,
                                  titleHeight: 1.3,
                                  titleAlign: TextAlign.center,
                                  titleColor: ColorManager.black,
                                  fontWeightType: FontWeightType.regular,
                                ),
                              );
                            }
                            if(snapshot.hasData){
                              scrollJump();
                              return ListView.builder(
                                // var message=snapshot.data!.docs
                                itemCount: snapshot.data!.docs.length,
                                controller:messageScrollController,
                                padding: const EdgeInsets.only(bottom: 70),
                                itemBuilder: (_,index){
                                  Map<String, dynamic> data1 = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                                  ChatAgreementMessageModel messageModel=ChatAgreementMessageModel.fromJson(data1);


                                  return AgreementChatItem(message: messageModel, onButtonTap: ()=>setState(() {}),);
                                },
                              );
                            }else{
                              return const Center(child: CircularProgressIndicator());
                            }
                          }
                      ),

                      // child:ListView.builder(
                      //   // var message=snapshot.data!.docs
                      //   itemCount: 1,
                      //   controller:messageScrollController,
                      //   padding: const EdgeInsets.only(bottom: 70),
                      //   itemBuilder: (_,index){
                      //
                      //     return AgreementChatItem(index: 0,);
                      //   },
                      // )
                    ),


                    Align(
                      alignment: Alignment.bottomCenter,
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          SizedBox(
                            width: .8.sw,
                            height: 70,
                            child:  DefaultTextFormField(
                                controller: messageController,
                                hintTitle: 'writeMessage'.tr(),
                                labelTitle: 'writeMessage'.tr(),
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.text,
                                hintFontSize: FontSize.s12,
                                hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                textSize: FontSize.s12,
                                fillColor: ColorManager.textGrey,
                                borderColor: ColorManager.textGrey,
                                // borderRadius: RadiusManager.r10,
                                // prefixIcon: InkWell(
                                //     onTap: ()async{
                                //       // var user= Constants.userDataModel!;
                                //       // ChatMessageModel message=ChatMessageModel(
                                //       //     message: messageController.text,
                                //       //     senderId:user.id ,
                                //       //     senderName: user.firstName,
                                //       //     senderImage:user.image ,
                                //       //     senderType:  user.type==UserType.user?'normal':"consultant",
                                //       //     receiverId: widget.receiverId,
                                //       //     receiverName: widget.receiverName,
                                //       //     receiverImage: widget.receiverImage,
                                //       //     receiverType: widget.receiverType ==UserType.user?'normal':"consultant",
                                //       //     timestamp: Timestamp.now(),
                                //       //     propertyId:propertyId,
                                //       //     messageType: 'pdf',
                                //       //   rejectPdf: null,
                                //       //   receiverUnreadMessage: 1,
                                //       //   senderUnreadMessage: 0,
                                //       //   isOpportunity: widget.isOpportunity
                                //       // );
                                //       // provider.sentMessagePdf(chatMessageModel: message, context: context);
                                //
                                //     },
                                //     child: const Icon(Icons.attachment,color: ColorManager.primary,size: AppSize.s20,)),

                                // prefixIcon: InkWell(
                                //     onTap: (){
                                //       // Utils.fi
                                //     },
                                //     child: SvgPicture.asset(ImageManager.fileSvg,)),
                                validator: (v) {}),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: InkWell(
                              onTap: () {

                                if(messageController.text.isNotEmpty){
                                  var user= Constants.userDataModel!;
                                  ChatAgreementMessageModel messageModel=ChatAgreementMessageModel(
                                    receiverName: widget.receiverName,
                                    receiverId: widget.receiverId,
                                    receiverImage: widget.receiverImage,
                                    senderId:user.id ,
                                    senderName: '${user.firstName} ${user.lastName}',
                                    senderImage:user.image ,
                                    timestamp: Timestamp.now(),
                                    messageType: ChatAgreementMessageType.text,
                                    receiverUnreadMessage: 1,
                                    senderUnreadMessage: 0,
                                    message: messageController.text,
                                  );
                                  provider.sentMessage(context: context,model: messageModel);

                                  // ChatMessageModel message=ChatMessageModel(
                                  //     message: messageController.text,
                                  //     senderId:user.id ,
                                  //     senderName: user.firstName,
                                  //     senderImage:user.image ,
                                  //     senderType:  user.type==UserType.user?'normal':"consultant",
                                  //     receiverId: widget.receiverId,
                                  //     receiverName: widget.receiverName,
                                  //     receiverImage: widget.receiverImage,
                                  //     receiverType: widget.receiverType ==UserType.user?'normal':"consultant",
                                  //     timestamp: Timestamp.now(),
                                  //     messageType: 'text',
                                  //   propertyId: propertyId,
                                  //     rejectPdf: null,
                                  //     receiverUnreadMessage: 1,
                                  //     senderUnreadMessage: 0,
                                  //     isOpportunity: widget.isOpportunity
                                  // );
                                  // provider.sentMessage(chatMessageModel: message, context: context);
                                  // provider.sendMessage(context: context, message: messageController.text,receiverId: widget.receiverId);
                                  messageController.clear();
                                }
                              },
                              child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: ColorManager.primary,
                                  child: Icon(Icons.send,color: ColorManager.white,size: AppSize.s20,)),
                            ),
                          ),
                        ],
                      ),

                    ),

                  ],
                ),

              ),
            ))
    );
  }
}
