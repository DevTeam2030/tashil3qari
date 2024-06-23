import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/screen_loading.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import '../../../../app/contants.dart';
import '../../../../app/enums.dart';
import '../../../../components/text_field/general_appbar_logo.dart';
import '../../../../providers/chat_agreement_provider.dart';
import '../../../../providers/chat_provider.dart';
import '../../../../utilites/font_manager.dart';
import '../../../../utilites/route_manager.dart';
import '../../../../utilites/styles_manager.dart';
import '../../../notifications/notification_tab.dart';
import '../chat/chat.dart';
import '../chat/chat_agreement.dart';
import '../model/chat_message_model.dart';
import '../widgets/widgets_imports.dart';



class AllChatScreen extends StatefulWidget {
  const AllChatScreen({Key? key}) : super(key: key);

  @override
  State<AllChatScreen> createState() => _AllChatScreenState();
}

class _AllChatScreenState extends State<AllChatScreen> {
  ChatType selectedType=ChatType.all;
  @override
  void initState() {
    super.initState();
    // if(mounted)context.read<ChatProvider>().getChatMessagesForUserId(userId: Constants.userDataModel!.id);
  }
  @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: GeneralAppBar(title: 'Conversations'.tr(),showChatNotify: false),
        body: Consumer<ChatAgreementDataProvider>(
            builder: (context, provider, child) =>ScreenLoading(
              isLoading: provider.isLoading,
              child: Container(
                height: 1.0.sh,
                width: 1.0.sw,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                // child:ListView.builder(
                //   itemCount: provider.messages.length,
                //   // controller: chatData.messageScrollController,
                //   padding: const EdgeInsets.only(bottom: 70),
                //   itemBuilder: (_,index){
                //     return OneChatItem(messageModel: provider.messages[index],);
                //   },
                // ),
                child: StreamBuilder<List<ChatMessageModel>>(
                    stream: provider.getChatMessagesForUserId(userId: Constants.userDataModel!.id, ),
                    builder: (context, snapshot) {
                      if(snapshot.hasError){
                        print(snapshot.error);
                        return Center(
                          child:AppText(
                            title:'An error occurred in retrieving data'.tr(),
                            titleSize:FontSize.s12,
                            titleMaxLines: 100,
                            titleHeight: 1.3,
                            titleAlign: TextAlign.center,
                            titleColor: ColorManager.black,
                            fontWeightType: FontWeightType.regular,
                          ),
                        );
                      }
                      if(!snapshot.hasData){
                        return Center(
                          child:AppText(title:'There are no previous conversations'.tr(),
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
                        return snapshot.data!.isEmpty?
                        Center(
                          child:AppText(title:'There are no previous conversations'.tr(),
                            titleSize:FontSize.s12,
                            titleMaxLines: 100,
                            titleHeight: 1.3,
                            titleAlign: TextAlign.center,
                            titleColor: ColorManager.black,
                            fontWeightType: FontWeightType.regular,
                          ),
                        ):


                          ListView.builder(
                          itemCount: snapshot.data!.length,
                          // controller: chatData.messageScrollController,
                          padding: const EdgeInsets.only(bottom: 70),
                          itemBuilder: (_,index){
                            return OneChatItem(messageModel: snapshot.data![index],
                            onTap: ()async{
                              var message=snapshot.data![index];
                              bool meSender = message.senderId== Constants.userDataModel!.id;
                              var x=await  Navigator.push(context, MaterialPageRoute(builder: (context) =>   ChatAgreementScreen(
                                receiverType: message.receiverType=='normal'?UserType.user:UserType.consultant,
                                receiverImage: meSender?message.receiverImage:message.senderImage,
                                receiverName:  meSender?message.receiverName:message.senderName,
                                receiverId:  meSender?message.receiverId:message.senderId,

                              ),));
                              setState(() {});
                            },);
                          },
                        );
                      }else{
                        return const Center(child: CircularProgressIndicator());
                      }
                    }
                ),
                // child: CustomScrollView(
                //   // shrinkWrap: true,
                //   physics: const ClampingScrollPhysics(),
                //   slivers: [
                //
                //     SliverList(
                //       delegate: SliverChildListDelegate([
                //
                //         Padding(
                //           padding: const EdgeInsets.symmetric(horizontal:.0,vertical: 10),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceAround,
                //             children: [
                //               NotificationTab(title:'all'.tr() ,isSelected: selectedType==ChatType.all,
                //                   onTap: ()=>setState(()=>selectedType=ChatType.all)),
                //
                //               NotificationTab(title:'For my ads'.tr() ,isSelected: selectedType==ChatType.myAds,
                //                   onTap: ()=>setState(()=>selectedType=ChatType.myAds)),
                //
                //                 NotificationTab(title:'Real estate consultant'.tr() ,
                //                     isSelected: selectedType==ChatType.realState,
                //                     onTap: ()=>setState(()=>selectedType=ChatType.realState)),
                //             ],
                //           ),
                //         ),
                //
                //         Padding(
                //           padding: const EdgeInsets.symmetric(
                //               horizontal: 10.0, vertical: 10),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Row(
                //                 children: [
                //                   AppText(
                //                       title:'AllConversations'.tr(),
                //                       titleAlign: TextAlign.start,
                //                       titleMaxLines: 1,
                //                       fontWeightType: FontWeightType.extraBold,
                //                       titleSize: FontSize.s16,
                //                       titleColor: ColorManager.primary),
                //
                //                 ],
                //               ),
                //
                //             ],
                //           ),
                //         ),
                //
                //
                //
                //         // if (provider.userWishList.isEmpty&&provider.isLoading==false)
                //         //   Padding(
                //         //     padding:  EdgeInsets.only(top:.2.sh),
                //         //     child: AppText(
                //         //         title: 'NoDataCurrentlyAvailable'.tr(),
                //         //         titleAlign: TextAlign.center,
                //         //         titleMaxLines: 1,
                //         //         fontWeightType: FontWeightType.extraBold,
                //         //         titleSize: FontSize.s16,
                //         //         titleColor: ColorManager.black),
                //         //   ),
                //
                //       ]),
                //     ),
                //
                //
                //
                //
                //
                //       SliverList(
                //           delegate: SliverChildBuilderDelegate(
                //                 (BuildContext context, int index) {
                //               return OneChatItem(index: index,);
                //             },
                //             childCount: 20
                //           ))
                //
                //
                //
                //   ],
                // ),


              ),
            )
        ));
  }
}
