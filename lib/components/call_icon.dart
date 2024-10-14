
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../app/contants.dart';
import '../app/enums.dart';
import '../app/url_luncher.dart';
import '../app/utils.dart';
import '../presentation/general/chats/chat/chat.dart';
import '../presentation/general/chats/chat/chat_agreement.dart';
import '../utilites/image_manager.dart';
import '../utilites/route_manager.dart';
import 'loading_manager.dart';

class CallIcon extends StatelessWidget {
  final String phoneNo;
  const CallIcon({super.key,required this.phoneNo});

  @override
  Widget build(BuildContext context) {
    return   InkWell(
        onTap: () => UrlLauncherMethods.makePhoneCall(phoneNo: phoneNo),
        child: SvgPicture.asset(ImageManager.callSvg,height: 25,width: 25));
  }
}
class ChatIcon extends StatelessWidget {
  final int receiverId;
  final int? propertyId;
  final String receiverName,receiverImage;
  final UserType receiverType;
  final bool isOpportunity;
  const ChatIcon({super.key,required this.receiverId,required this.receiverName,
    required this.receiverImage,required this.receiverType,required this.propertyId,this.isOpportunity=false});

  @override
  Widget build(BuildContext context) {
    return   InkWell(
        onTap: () {
          if(Utils.checkIfUserLogin(context: context)) {

            if(receiverId==Constants.userDataModel!.id){
              LoadingDialog.showSimpleToast('YouCantMessageYourself'.tr());

            }else{
                MyRoute().navigate(context: context, route: ChatAgreementScreen(
                  receiverId: receiverId,
                  receiverName: receiverName,
                  receiverImage: receiverImage,
                  receiverType: receiverType,
                ));
          }

        }
        },
        // onTap: () => MyRoute().navigate(context: context, route: ChatScreen(
        //   receiverId: receiverId,
        //   receiverName: receiverName,
        //   receiverImage: receiverImage,
        //   receiverType: receiverType,
        // )),
        child: SvgPicture.asset(ImageManager.chatSvg,height: 25,width: 25));
  }
}
