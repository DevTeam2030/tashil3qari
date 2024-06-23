import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/app_bar.dart';
import 'package:tashil_agary/components/screen_loading.dart';
import 'package:tashil_agary/presentation/notifications/build_widget_notifications.dart';
import 'package:tashil_agary/providers/notifications_provider.dart';
import 'package:tashil_agary/utilites/color_manager.dart';

import '../../components/no_data_available.dart';
import 'notification_tab.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // final ScrollController scrollController=ScrollController();
  NotificationsTabType selectedTab=NotificationsTabType.all;
  bool isUser=true;
@override
  void initState() {
    super.initState();
    if(mounted){
      isUser= Constants.userDataModel!.isUser;
      context.read<NotificationsProvider>().getUserNotifications(context: context,notify: false);
    }
  }


  @override
  void dispose() {
    super.dispose();
    // scrollController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Notifications'.tr(),
        showNotificationIcon: false,  showLogo: false,
        showBackICon: true,
        titleColor: ColorManager.black,
        showDrawer: false,
      showDivider: true),
      body:  Consumer<NotificationsProvider>(
        builder: (context, provider, child) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ScreenLoading(
              isLoading: provider.isLoading,
              height: 1.0.sh,
              width: 1.0.sw,
              child:Stack(
                children: [


                  BuildWidgetNotifications(
                    isUser: isUser,
                    notifications:selectedTab==NotificationsTabType.all?
                    provider.userNotifications : selectedTab==NotificationsTabType.myAds?
                    provider.userNotifications.where((element) => element.type=='user').toList():
                    provider.userNotifications.where((element) => element.type=='consultant').toList()
                  ),


                  if(provider.userNotifications.isEmpty&& !provider.isLoading)
                        const Center(child: NoDataCurrentlyAvailable()),
                      


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:.0,vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        NotificationTab(title:'all'.tr() ,isSelected: selectedTab==NotificationsTabType.all,
                            onTap: ()=>setState(()=>selectedTab=NotificationsTabType.all)),

                        NotificationTab(title:'For my ads'.tr() ,isSelected: selectedTab==NotificationsTabType.myAds,
                            onTap: ()=>setState(()=>selectedTab=NotificationsTabType.myAds)),

                        if(Constants.userDataModel!.isUser!=false)
                        NotificationTab(title:'Real estate consultant'.tr() ,
                            isSelected: selectedTab==NotificationsTabType.realEstate,
                            onTap: ()=>setState(()=>selectedTab=NotificationsTabType.realEstate)),
                      ],
                    ),
                  ),
                ],
              )
          ),
        ),
      ),

    );
  }
}
