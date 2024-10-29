import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import '../../../components/NotifyIcon.dart';
import '../app/enums.dart';
import '../app/utils.dart';
import '../presentation/general/chats/all_chat/all_chat.dart';
import '../presentation/general/chats/model/chat_message_model.dart';
import '../providers/chat_agreement_provider.dart';
import '../utilites/color_manager.dart';
import '../utilites/font_manager.dart';
import '../utilites/route_manager.dart';
import 'package:badges/badges.dart' as badge;

import '../utilites/styles_manager.dart';
import '../utilites/values_manager.dart';

class ChatNotifyIcon extends StatelessWidget {
  const ChatNotifyIcon({super.key});

  @override
  Widget build(BuildContext context) {
    // var count = context.watch<NotifyCubit>().state.count;
    return Row(
      children: [
        SizedBox(
          width: 30,height: 30,
          child: Constants.userDataModel!=null?
          Consumer<ChatAgreementDataProvider>(
              builder: (context, provider, child) => StreamBuilder<List<ChatMessageModel>>(
                  stream: provider.getChatMessagesForUserId(userId: Constants.userDataModel!.id, ),
                  builder: (context, snapshot) {
                    int count =0;
                    if(snapshot.hasData){
                      int userId= Constants.userDataModel!.id;
                      // int unreadMessages=!meSender?widget.messageModel.receiverUnreadMessage:widget.messageModel.senderUnreadMessage;
                      var myMessage = snapshot.data!.where((element) => element.receiverId==userId,).toList();
                      count = myMessage.fold(0, (previousValue, element) => previousValue+element.receiverUnreadMessage);
                     
                    }
                    return InkWell(
                      onTap: (){
                        if(Utils.checkIsLogin())
                          MyRoute().navigate(context: context, route:const AllChatScreen(),);

                      },

                      child:count>0? badge.Badge(
                        badgeStyle: badge.BadgeStyle(
                          badgeColor: ColorManager.red,
                        ),
                        position: badge.BadgePosition.topEnd(end: 10,top: 0),
                        // padding: EdgeInsets.symmetric(horizontal: 1),
                        badgeContent:   AppText(
                          title:count.toString(),
                          titleSize: FontSize.s10,
                          titleMaxLines: 3,
                          titleColor: ColorManager.white,
                          titleAlign: TextAlign.start,
                          fontWeightType: FontWeightType.bold,),
                        child: Image.asset(ImageManager.chat,height: 30),
                      ):Image.asset(ImageManager.chat,height: 50),);

                  }
              )):Image.asset(ImageManager.chat,height: 50),
        ),

        const AppSizeBox(width: 2,),
        NotifyIcon(),
        const AppSizeBox(width: 2,),
      ],
    );
  }
}

