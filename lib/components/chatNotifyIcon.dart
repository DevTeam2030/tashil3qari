import 'package:flutter/material.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import '../../../components/NotifyIcon.dart';
import '../app/utils.dart';
import '../presentation/general/chats/all_chat/all_chat.dart';
import '../utilites/route_manager.dart';


class ChatNotifyIcon extends StatelessWidget {
  const ChatNotifyIcon({super.key});

  @override
  Widget build(BuildContext context) {
    // var count = context.watch<NotifyCubit>().state.count;
    return Row(
      children: [
        InkWell(
            onTap: (){
              if(Utils.checkIsLogin())
      MyRoute().navigate(context: context, route:const AllChatScreen(),);
              
    },

            child: Image.asset(ImageManager.chat,height: 50)),
        const AppSizeBox(width: 2,),
        NotifyIcon(),
        const AppSizeBox(width: 2,),
      ],
    );
  }
}

