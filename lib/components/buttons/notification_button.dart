import 'package:badges/badges.dart' as badge;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/presentation/notifications/notifications_screen.dart';
import 'package:tashil_agary/providers/notifications_provider.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/route_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class NotificationsButton extends StatelessWidget {
  final Color? backGroundColor;
  const NotificationsButton({Key? key,this.backGroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 38,
      decoration:Utils.returnIconsDecoration(),
      child: InkWell(
        onTap: (){
          // if(!Utils.checkIfUserLogin(context: context))return;
          MyRoute().navigate(context: context, route: const NotificationsScreen());
        },
        child:Consumer<NotificationsProvider>(
          builder: (context, provider, child) =>
              provider.countUnreadNotification>0?
              badge.Badge(
                badgeColor: ColorManager.redShade700,
            position: badge.BadgePosition.topEnd(),
            // padding: EdgeInsets.symmetric(horizontal: 1),
            badgeContent:   AppText(
              title:provider.countUnreadNotification.toString(),
              titleSize: FontSize.s10,
              titleMaxLines: 3,
              titleColor: ColorManager.white,
              titleAlign: TextAlign.start,
              fontWeightType: FontWeightType.bold,),
                child: const Icon(Icons.notifications,
                    color: ColorManager.primary,size: AppSize.s25),
          ):
              const Icon(Icons.notifications,
                  color: ColorManager.primary,size: AppSize.s25),
        ),

      ),
    );
  }
}
