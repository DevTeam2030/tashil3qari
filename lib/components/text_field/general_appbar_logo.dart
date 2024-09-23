import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/route_manager.dart';
import '../../app/enums.dart';
import '../../utilites/color_manager.dart';
import '../../utilites/font_manager.dart';
import '../../utilites/styles_manager.dart';
import '../buttons/back_button.dart';
import '../buttons/text_button.dart';
import '../chatNotifyIcon.dart';


class GeneralAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
 final bool showBack;
 final bool showChatNotify;
 final bool showDivider,showHomeButton,showMapIcon;
  const GeneralAppBar({
    Key? key,
    required this.title,
    this.showBack=true,
    this.showChatNotify=true,
    this.showDivider=true,
    this.showMapIcon=false,
    this.showHomeButton=false,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [


        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              showBack?
              showHomeButton? MyTextButton(title: 'Main'.tr(),
                  size: Size( .25.sw,  38),
                  radius: 8,
                  fontWeightType: FontWeightType.medium,
                  titleSize: FontSize.s14,
                  primaryColor: ColorManager.primary,
                  titleColor: ColorManager.white,
                  onPressed: ()=>Navigator.pop(context)):
              BackAppBarButton():AppSizeBox(width: 0),

              AppText(
                  title: title,
                  titleAlign: TextAlign.center,
                  titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
                  titleSize: FontSize.s14,titleColor: ColorManager.black),


             Row(
               children: [
                 if(showMapIcon)
                 InkWell(
                     onTap: ()=>gotoIntro(context: context),
                     child: Icon(Icons.map,size: 20,color: ColorManager.black,)),
                 if(showMapIcon)
                 const AppSizeBox(width: 6,),
                 if(showChatNotify)
                   const ChatNotifyIcon()
                 else const AppSizeBox(height: 1,width: 40,)
               ],
             )

            ],
          ),
        ),


         Divider(color: showDivider?ColorManager.divider:ColorManager.white,thickness: 2),




      ],



    );
  }

  @override
  Size get preferredSize =>  Size.fromHeight(70);
}
