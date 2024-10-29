import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/components/app_bar.dart';
import 'package:tashil_agary/components/no_data_available.dart';
import 'package:tashil_agary/components/refresh_indicator_widget.dart';
import 'package:tashil_agary/components/screen_loading.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/presentation/notifications/consultant_notification_item.dart';
import 'package:tashil_agary/presentation/notifications/user_notification_item.dart';
import 'package:tashil_agary/providers/notifications_provider.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

import '../../domain/model/user_notification_model.dart';
import '../../utilites/font_manager.dart';
import '../../utilites/styles_manager.dart';
import 'notification_tab.dart';

class BuildUserNotifications extends StatefulWidget {
 final List<NotificationModel> notifications;
  const BuildUserNotifications({Key? key,required this.notifications}) : super(key: key);

  @override
  State<BuildUserNotifications> createState() => _BuildUserNotificationsState();
}

class _BuildUserNotificationsState extends State<BuildUserNotifications> {

  List<NotificationModel> todayList=[];
  List<NotificationModel> previousList=[];
@override
  void initState() {
    super.initState();

  }
  @override
  void dispose() {
    super.dispose();
    // scrollController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    todayList=widget.notifications.where((element) => element.date==DateTime.now()).toList();

    previousList=widget.notifications.where((element) => element.date!=DateTime.now()).toList();

    return  Container(
      height: 1.0.sh,
      width: 1.0.sw,
      // margin:  const EdgeInsets.symmetric(horizontal: PaddingManager.p16),
      padding: const EdgeInsets.only(top: 50),
      child:    CustomScrollView(
        // shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        slivers: [

          SliverList(
            delegate: SliverChildListDelegate([

              const  AppSizeBox(height: 10,),

              if(todayList.isNotEmpty)
              Row(
                children: [
                  AppText(title:'today'.tr(),
                    titleSize: FontSize.s16,
                    titleMaxLines: 1,
                    titleHeight: 1.2,
                    titleAlign: TextAlign.start,
                    titleColor: ColorManager.primary,
                    fontWeightType: FontWeightType.extraBold,),
                ],
              ),
            ]),
          ),







          if(todayList.isNotEmpty)
          SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return UserNotificationItem(isRead:true,
                      notification: todayList[index]);
                },
                childCount: todayList.length,
              )),

          if(previousList.isNotEmpty)
          SliverList(
            delegate: SliverChildListDelegate([

              const  AppSizeBox(height: 10,),
              Row(
                children: [
                  AppText(title:'Old notifications'.tr(),
                    titleSize: FontSize.s16,
                    titleMaxLines: 1,
                    titleHeight: 1.2,
                    titleAlign: TextAlign.start,
                    titleColor: ColorManager.primary,
                    fontWeightType: FontWeightType.extraBold,),
                ],
              ),
            ]),
          ),

          if(previousList.isNotEmpty)
          SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return UserNotificationItem(isRead: true,notification: previousList[index],);
                },
                childCount: previousList.length
              )),



        ],
      ),
    );
  }
}
