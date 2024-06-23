import 'package:flutter/material.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/presentation/notifications/notifications_screen.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import 'package:tashil_agary/utilites/route_manager.dart';

import '../app/utils.dart';

class NotifyIcon extends StatefulWidget {
  const NotifyIcon({super.key});

  @override
  State<NotifyIcon> createState() => _NotifyIconState();
}

class _NotifyIconState extends State<NotifyIcon> {
  @override
  Widget build(BuildContext context) {
    // var count = context.watch<NotifyCubit>().state.count;
    return InkWell(
        splashColor: ColorManager.white,
        highlightColor:ColorManager.white ,
        onTap: (){
          if(Utils.checkIsLogin())
            MyRoute().navigate(context: context, route: const NotificationsScreen());
        } ,
      child: Stack(
        children: [
          Image.asset(ImageManager.notifications,height: 22,width: 22,fit: BoxFit.fill,),
          ValueListenableBuilder(valueListenable: Constants.notificationsCounter,
              builder: (context, value, child) =>value>0? CircleAvatar(
                radius: 3,
                backgroundColor: ColorManager.red,
              ):AppSizeBox(width: 0),)

        ],
      ),
      // child: Badge(
      //   alignment: AlignmentDirectional.topStart,
      //   backgroundColor: ColorManager.red,
      //   padding: EdgeInsets.all(1),
      //   label: Text('1',style: TextStyle(color: ColorManager.white,fontSize: 10),),
      //   child:  Image.asset(ImageManager.notifications,),
      //
      //
      // ),
    );
  }
}


// class NotificationIconWidget extends StatefulWidget {
//   const NotificationIconWidget({Key? key}) : super(key: key);
//
//   @override
//   _NotificationIconWidgetState createState() => _NotificationIconWidgetState();
// }
//
// class _NotificationIconWidgetState extends State<NotifyIcon> {
//   @override
//   Widget build(BuildContext context) {
//     var count = context.watch<NotifyCubit>().state.count;
//     return  InkWell(
//       splashColor: MyColors.white,
//       highlightColor:MyColors.white ,
//       onTap: (){
//         Utils.checkIsLogin(context);
//         print('ffffffffffffff');
//       },
//       child: OpenContainer(
//         closedElevation: 0,
//         openElevation: 0,
//         closedColor: Colors.transparent,
//         openColor: Colors.white,
//         middleColor: Colors.transparent,
//         transitionDuration: const Duration(milliseconds: 100),
//         transitionType: ContainerTransitionType.fadeThrough,
//         openBuilder: (context, action) => Notifications(),
//
//         closedBuilder: (context, action) => NotifyIcon(),
//       ),
//     );
//   }
// }