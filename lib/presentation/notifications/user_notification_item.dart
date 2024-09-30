import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/cach_image.dart';
import 'package:tashil_agary/components/size_box_height.dart';

import 'package:tashil_agary/utilites/calender_manager.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

import '../../components/buttons/text_button.dart';
import '../../domain/model/user_notification_model.dart';
import '../../utilites/route_manager.dart';
import '../general/ad/ad_imports.dart';

class UserNotificationItem extends StatelessWidget {
  final bool isRead ;
  final NotificationModel notification ;
  const UserNotificationItem({Key? key,required this.isRead,required this.notification,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        int? propertyId=int.tryParse(notification.propertyId);
        if(propertyId==null)return;
         MyRoute().navigate(context: context, route:  AdScreen(propertyId:propertyId,));
      },
      child: Container(
        width: 1.0..sw,
        margin:  const EdgeInsets.symmetric(vertical: PaddingManager.p6, horizontal: 0),
        padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p14, vertical: PaddingManager.p12),

        decoration: BoxDecoration(
          color: ColorManager.textGrey,
          // shadowColor: ColorManager.black.withOpacity(.7),
          // elevation: .4,
          boxShadow: Constants.kCArtBoxShadow,
          borderRadius: BorderRadius.circular(RadiusManager.r10),
        ),
        child: Stack(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CachedImage(
                  url:notification.image,
                  height: 65,width: 60,
                  fit: BoxFit.cover,
                  boxShape: BoxShape.circle,
                ),
                const AppSizeBox(width: 8,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(title:notification.notTitle,
                        titleSize: FontSize.s16,
                        titleMaxLines: 1,
                        titleHeight: 1.2,
                        titleAlign: TextAlign.start,
                        titleColor: ColorManager.icons,
                        fontWeightType: FontWeightType.extraBold,),
                      const AppSizeBox(height: AppSize.s4,),

                      AppText(
                        title:notification.message,
                        titleSize: FontSize.s12,
                        titleMaxLines: 2,
                        titleHeight: 1.2,
                        titleAlign: TextAlign.start,
                        titleColor: ColorManager.notificationsBody,
                        fontWeightType: FontWeightType.medium,),
                      const AppSizeBox(height: AppSize.s4,),
                      AppText(
                        title:notification.date.toString(),
                        titleSize: FontSize.s12,
                        titleMaxLines: 2,
                        titleHeight: 1.2,
                        titleAlign: TextAlign.start,
                        titleColor: ColorManager.notificationsBody,
                        fontWeightType:FontWeightType.medium,),

                    ],
                  ),
                ),
              ],
            ),

            // if(isRead&&isRealEstate==false)
            //   Padding(
            //     padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 4),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.end,
            //       children: [
            //         CircleAvatar(
            //           radius: 4,
            //           backgroundColor: ColorManager.primary.withOpacity(.4),
            //         ),
            //       ],
            //     ),
            //   ),


          ],
        ),
      ),
    );
  }
}



