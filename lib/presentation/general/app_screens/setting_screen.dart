import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/components/app_bar.dart';
import 'package:tashil_agary/components/app_store_links_bottom_sheet.dart';
import 'package:tashil_agary/components/check_icon.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/presentation/general/app_screens/notification_setting_screen.dart';
import 'package:tashil_agary/presentation/general/app_screens/privacy_policy.dart';
import 'package:tashil_agary/presentation/general/app_screens/social_login_screen.dart';
import 'package:tashil_agary/presentation/general/app_screens/terms_of_service_screen.dart';
import 'package:tashil_agary/presentation/general/app_screens/terms_of_use_screen.dart';
import 'package:tashil_agary/presentation/drawer/drawer_item.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/route_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Setting'.tr()),
      body:  SizedBox(
        height: 1.0.sh,
        width: 1.0.sw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const AppSizeBox(height: AppSize.s20),


            // DrawerItem(title: 'NotificationSetting'.tr(),
            //     onTap: (){
            //       if(Utils.checkIfUserLogin(context: context))  MyRoute().navigate(context: context, route: const NotificationsSettingsScreen());
            //     }),

            // DrawerItem(title: 'ChangePassword'.tr(),
            //     onTap: (){
            //       if(Utils.checkIfUserLogin(context: context))  MyRoute().navigate(context: context, route: const ChangePasswordScreen());
            //       if(Utils.checkIfUserLogin(context: context))  MyRoute().navigate(context: context, route: const SocialLoginScreen());
            //     }),
            // DrawerItem(title: 'SocialLogins'.tr(),
            //       onTap: (){
            //            if(Utils.checkIfUserLogin(context: context))  MyRoute().navigate(context: context, route: const SocialLoginScreen());
            //       }),
            // DrawerItem(title: 'ForPartners'.tr(),onTap:()=>Utils.showModalBottomSheetApp(widget: const AppStoreLinksBottomSheet()),),
            // DrawerItem(title: 'PrivacyPolicy'.tr(),onTap: ()=>MyRoute().navigate(context: context, route: const PrivacyPolicyScreen())),
            // DrawerItem(title: 'TermsOfService'.tr(),onTap: ()=>MyRoute().navigate(context: context, route: const TermsOfServiceScreen())),
            // DrawerItem(title: 'TermsOfUse'.tr(),onTap: ()=>MyRoute().navigate(context: context, route: const TermsOfUseScreen())),
            // DrawerItem(title:Constants.isLogin?'LogOut'.tr(): 'LogIn',onTap: ()=>Utils.logOut(context), isLastItem: true),

          ],
        )
      )
    );
  }
}



