import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/app_bar.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

import '../../../components/screen_loading.dart';
import '../../../providers/auth_provider.dart';


class NotificationsSettingsScreen extends StatelessWidget {
  const NotificationsSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(title: 'Notification'.tr()),
      body:   Consumer<AuthProvider>(
          builder: (context, provider, child) =>  ScreenLoading(
              isLoading: provider.isLoading,
              height: 1.0.sh,
              width: 1.0.sw,
              child:    Container(
                  margin: const EdgeInsets.symmetric(horizontal: MarginManager.m20),
                  height: 1.0.sh,
                  width: 1.0.sw,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const AppSizeBox(height: AppSize.s30),
                      AppText(title: 'AppNotification'.tr(),
                        titleSize: FontSize.s18,
                        titleMaxLines: 1,
                        titleAlign: TextAlign.start,
                        titleColor: ColorManager.primary,
                        fontWeightType: FontWeightType.bold,
                      ),
                      const AppSizeBox(height: AppSize.s18,),
                      AppText(title: 'Styloo only sends notifications about appointments you have booked'.tr(),
                        titleSize: FontSize.s14,
                        titleMaxLines: 4,
                        titleHeight: 1.3,
                        titleAlign: TextAlign.start,
                        titleColor: ColorManager.text,
                        fontWeightType: FontWeightType.regular,
                      ),
                      const AppSizeBox(height: AppSize.s10,),
                      const Divider(
                        height: 2,
                        thickness: 1.2,
                        color: ColorManager.starGryColor,
                      ),



                      // NotificationSettingItem(
                      //   onChanged: (v){
                      //     provider.updateNotificationsStatus(context: context,
                      //         notificationsSettingRequestModel: NotificationsSettingRequestModel(
                      //           textMarketingNotifications:Constants.userDataModel!.textMarketingNotifications?1:0 ,
                      //           emailNotifications: v?1:0,
                      //           emailMarketingNotifications:Constants.userDataModel!.emailMarketingNotifications?1:0
                      //         ));
                      //   },
                      //   title: 'Text message appointment notifications'.tr(),
                      //   des: 'Receive text based on your senders settings'.tr(),
                      //   value: Constants.userDataModel!.emailNotifications,
                      // ),
                      //
                      // NotificationSettingItem(
                      //   onChanged: (v){
                      //     provider.updateNotificationsStatus(context: context,
                      //         notificationsSettingRequestModel: NotificationsSettingRequestModel(
                      //             textMarketingNotifications:Constants.userDataModel!.textMarketingNotifications?1:0 ,
                      //             emailNotifications: Constants.userDataModel!.emailNotifications?1:0,
                      //             emailMarketingNotifications:v?1:0
                      //         ));
                      //   },
                      //   title: 'Email marketing notifications'.tr(),
                      //   des: 'Receive offers and news via email'.tr(),
                      //   value: Constants.userDataModel!.emailMarketingNotifications,
                      // ),
                      //
                      // NotificationSettingItem(
                      //   onChanged: (v){
                      //     provider.updateNotificationsStatus(context: context,
                      //         notificationsSettingRequestModel: NotificationsSettingRequestModel(
                      //             textMarketingNotifications:v?1:0 ,
                      //             emailNotifications: Constants.userDataModel!.emailMarketingNotifications?1:0,
                      //             emailMarketingNotifications:Constants.userDataModel!.emailMarketingNotifications?1:0
                      //         ));
                      //   },
                      //   title: 'Text message marketing notifications'.tr(),
                      //   des: 'If you opted out previously by texting  STOP please reply with START to opt back in'.tr(),
                      //   value: Constants.userDataModel!.textMarketingNotifications,
                      // ),






                    ],
                  )
              )
          )
      )

    );
  }
}



