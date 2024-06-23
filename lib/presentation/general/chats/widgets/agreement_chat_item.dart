part of'widgets_imports.dart';
class AgreementChatItem extends StatelessWidget {
  final ChatAgreementMessageModel message ;
  final Function() onButtonTap;
  const AgreementChatItem({Key? key,required this.message,required this.onButtonTap,}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    bool meSender =message.senderId == Constants.userDataModel!.id;
  
    return Container(
      constraints: BoxConstraints(
        maxWidth: .7.sw,
        minWidth: .2.sw,
      ),
      child: Column(
        crossAxisAlignment: meSender?CrossAxisAlignment.start:CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: meSender?MainAxisAlignment.start:MainAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: .7.sw,
                  minWidth: .2.sw,
                ),
                padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p16, vertical: PaddingManager.p14),
                margin: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: meSender?ColorManager.meChatColor:ColorManager.otherChatColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft:const Radius.circular(RadiusManager.r14),
                    bottomRight: const Radius.circular(RadiusManager.r14),
                    topLeft: meSender?const Radius.circular(RadiusManager.r14):const Radius.circular(0),
                    topRight: meSender?const Radius.circular(0):const Radius.circular(RadiusManager.r14),
                  )

                ),

                child:   Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [


                    Flexible(
                      child: AppText(
                        title:message.message,
                        titleSize:FontSize.s12,
                        titleMaxLines: 100,
                        titleHeight: 1.3,
                        titleAlign: TextAlign.start,
                        titleColor: meSender?ColorManager.black:ColorManager.white,
                        fontWeightType: FontWeightType.regular,
                      ),
                    ),


                  ],
                ),
              ),
            ],
          ),



          Row(
            mainAxisAlignment: meSender?MainAxisAlignment.start:MainAxisAlignment.end,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppText(
                title:message.timestamp.toDate().toString().substring(0,16),
                titleSize:FontSize.s12,
                titleMaxLines: 100,
                titleHeight: 1.3,
                titleAlign:  meSender?TextAlign.start:TextAlign.end,
                // titleAlign: TextAlign.start,
                titleColor: ColorManager.grey,
                fontWeightType: FontWeightType.regular,
              ),
            ],
          ),
            // const AppSizeBox(height: 4,),
          if(message.messageType==ChatAgreementMessageType.agreement)
            Row(
              mainAxisAlignment: meSender?MainAxisAlignment.start:MainAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 35,
                  child: MyTextButton(title:'see'.tr(),
                      size: Size( .22.sw, 35),
                      radius: 10,
                      fontWeightType: FontWeightType.bold,
                      titleSize: FontSize.s14,
                      primaryColor:ColorManager.primary,
                      titleColor: ColorManager.white,
                      onPressed: ()async{
                        var messages=await context.read<ChatAgreementDataProvider>().geRoomAgreement(
                            receiverId: meSender?message.receiverId:message.senderId);
                        ChatAgreementModel? prevAgreementData;
                        if(messages.isEmpty)return;
                        if(messages.isNotEmpty)prevAgreementData=messages.first;

                        bool meAgreementCreator=prevAgreementData!.agreementCreateId==Constants.userDataModel!.id;
                        // ignore: use_build_context_synchronously
                        MyRoute().navigate(context: context, route: MakeAgreementScreen(
                          previousConsults: [],
                        receiverName: meSender?message.receiverName:message.senderName,
                        receiverImage: meSender?message.receiverImage:message.senderImage,
                          receiverId: meSender?message.receiverId:message.senderId,
                        previousAgreement: prevAgreementData,
                         makeAgreementAction:
                         meAgreementCreator?MakeAgreementActon.edit:MakeAgreementActon.refuseOrAccept,

                        ),);

                      }),
                ),
              ],
            ),
        ],
      ),
    );
  }
}


