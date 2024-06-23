import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/cach_image.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

import '../../components/buttons/text_button.dart';
import '../../components/call_icon.dart';
import '../../domain/model/user_notification_model.dart';
import '../../providers/notifications_provider.dart';
import '../../utilites/route_manager.dart';
import '../general/ad/ad_imports.dart';

class ConsultantNotificationItem extends StatelessWidget {
  final bool isRead ;
  final NotificationModel notification;
  const ConsultantNotificationItem({Key? key,required this.isRead,required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        int? propertyId=int.tryParse(notification.propertyId);
        if(notification.type=='consultant'&&propertyId!=null){
          MyRoute().navigate(context: context, route:  AdScreen(propertyId:propertyId,notificationId: notification.id,));
        }
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                            Flexible(
                              child: AppText(title:notification.notTitle,
                              titleSize: FontSize.s16,
                              titleMaxLines: 2,
                              titleHeight: 1.2,
                              titleAlign: TextAlign.start,
                              titleColor: ColorManager.icons,
                              fontWeightType: FontWeightType.extraBold,),
                            ),

                          if(notification.type=='consultant')
                            Row(

                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CallIcon(phoneNo: notification.userPhone),


                                const AppSizeBox(width: 8,),
                                if(notification.userId!=0)
                                ChatIcon(receiverType: UserType.consultant,
                                receiverName: notification.userName,
                                propertyId: int.tryParse(notification.propertyId),
                                receiverImage: notification.userImage,
                                receiverId: notification.userId),

                              ],
                            )
                        ],
                      ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            title:notification.date.toString(),
                            titleSize:FontSize.s8,
                            titleMaxLines: 2,
                            titleHeight: 1.2,
                            titleAlign: TextAlign.start,
                            titleColor: ColorManager.notificationsBody,
                            fontWeightType:FontWeightType.regular,),


                        ],
                      ),
                      const AppSizeBox(height: AppSize.s4,),
                      if(notification.type=='consultant')
                      SizedBox(
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            MyTextButton(title: 'Accept'.tr(),
                                size: Size( .24.sw,  30),
                                fontWeightType: FontWeightType.regular,
                                titleSize: FontSize.s12,
                                radius: RadiusManager.r6,
                                primaryColor: ColorManager.primary,
                                titleColor: ColorManager.white,
                                onPressed: (){
                              int? id=int.tryParse(notification.propertyId);
                              print(id.toString() +'dddddddddddddddd');
                              print(notification.userId.toString() +'dddddddddddddddd');
                              print(notification.notType +'dddddddddddddddd');

                            if(notification.notType=='agreement'&&id!=null&&notification.userId!=0){
                              context.read<NotificationsProvider>().acceptAgreement(
                                  context: context,
                                  isAccept: true,
                                  consultantId: notification.userId,
                                  agreementId: id);
                            }else if(notification.notType=='property'&&id!=null){
                              context.read<NotificationsProvider>().acceptProperty(
                                  context: context,
                                  notificationId: notification.id,
                                  propertyId: id);
                            }else{}



                                }),

                            const AppSizeBox(width: 6,),
                            MyTextButton(title: 'reject'.tr(),
                                size: Size( .24.sw,  30),
                                fontWeightType: FontWeightType.regular,
                                titleSize: FontSize.s12,
                                radius: RadiusManager.r6,
                                primaryColor: ColorManager.reject,
                                titleColor: ColorManager.white,
                                onPressed: (){
                                  int? id=int.tryParse(notification.propertyId);
                                  if(notification.notType=='agreement'&&id!=null&&notification.userId!=0){
                                    context.read<NotificationsProvider>().acceptAgreement(
                                        context: context,
                                        isAccept: false,
                                        consultantId: notification.userId,
                                        agreementId: id);
                                  }else if(notification.notType=='property'&&id!=null){
                                    context.read<NotificationsProvider>().refuseProperty(
                                        context: context,
                                        notificationId: notification.id,propertyId: id);
                                  }else{}
                                }),
                          ],
                        ),
                      )

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



