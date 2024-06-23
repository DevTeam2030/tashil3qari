import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/components/buttons/back_button.dart';
import 'package:tashil_agary/components/buttons/drawer_button.dart';
import 'package:tashil_agary/components/buttons/notification_button.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

PreferredSize CustomAppBar({
  required  String title,
    Color? titleColor,
  bool? showBackICon,
  bool? showDivider,
  bool? showDrawer,
   Function? onBackTap,
   Function? onDrawerTap,
  double? fontSize,
  bool? showLogo,
  Widget? appBarWidget,
  bool? showNotificationIcon,
}){
  return PreferredSize(
    preferredSize: Size.fromHeight(
        showLogo==false&&appBarWidget==null&&showDivider==false?AppSize.s70.h:
        AppSize.s80.h),


    child: Padding(
      padding: returnPadding(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if(showBackICon==true) BackAppBarButton(onBackTap: onBackTap)
              else if (showDrawer==true) DrawerAppBarButton(onTap: onDrawerTap)
              else const AppSizeBox(width: 0,),

              if(showLogo==true)
                Image.asset(ImageManager.logoPNG_1,height: 70.0.h,width: 70,)
              else if(appBarWidget!=null)
                appBarWidget
              else
              AppText(title:title, titleSize: fontSize??FontSize.s24,
                titleMaxLines: 2,
                titleAlign: TextAlign.center,
                titleColor: titleColor??ColorManager.appBarTitle,
                fontWeightType: FontWeightType.medium,),


              showNotificationIcon==false?const AppSizeBox(width: 0,):
              const NotificationsButton()

              // showNotificationIcon==false?const AppSizeBox(width: 0,):
              // Padding(
              //   padding:Constants.isArabic?const EdgeInsets.only(left: PaddingManager.p4):
              //   const EdgeInsets.only(right: PaddingManager.p4),
              //   child: const NotificationsButton(),
              // ),

            ],
          ),
          if(  showLogo==false&&appBarWidget==null)
            const AppSizeBox(height: AppSize.s10,),
          if(showDivider==true)
            const Divider(color: ColorManager.divider,thickness: 1,),
        ],
      ),
    ),
  );
}
