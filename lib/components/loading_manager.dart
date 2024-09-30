import 'package:bot_toast/bot_toast.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/remember_password.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';


class LoadingDialog {
  widgetAlertDialog({required BuildContext context ,required Widget widget}){
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      alignment: Alignment.bottomCenter,
      builder: (BuildContext context) {
        return    widget;
      },
      animationType: DialogTransitionType.size,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }

  optionalAgreeAlertDialog({required BuildContext context ,required String title , String? agreementTitle ,
    required String message,Function? okClick,Function? cancelOnClick}){
    bool agree=false;
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,


      builder: (BuildContext context) {
        return    Center(
          child: Material(
            // borderRadius: BorderRadius.circular(RadiusManager.r18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(RadiusManager.r12),
              // side: const BorderSide(color: ColorManager.primary, width: 2,),
            ),
            child: StatefulBuilder(builder: (context, setState) => SizedBox(
              height: .3.sh,
              width: .8.sw,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(title:title,
                    titleSize: FontSize.s20, titleAlign: TextAlign.center,
                    titleColor: ColorManager.black.withOpacity(.5),
                    fontWeightType: FontWeightType.medium,
                    titleMaxLines: 1,),

                  const AppSizeBox(height: AppSize.s20),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal:PaddingManager.p20.w),
                    child: AppText(title:message,
                      titleSize: FontSize.s16, titleAlign: TextAlign.center,
                      titleHeight: 1.2,
                      titleColor: ColorManager.black.withOpacity(.5),
                      fontWeightType: FontWeightType.medium, titleMaxLines: 10,),
                  ),


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10.0),
                    child: CheckBoxWidget(
                      checkBoxValue: agree,
                      title: agreementTitle??'yesAgree'.tr(),
                      checkBoxFunction: (priceEnum){
                        agree=!agree;
                        setState(() {});
                      },
                    ),
                  ),
                  const AppSizeBox(height: AppSize.s10),


                  SizedBox(
                    height: AppSize.s60.h,
                    child: Row(
                      children: [
                        const AppSizeBox(width: AppSize.s20),
                        Expanded(
                            flex: 1,
                            child: AlertButton(title: 'ok'.tr(),
                              width: .6.sw,
                              color:agree? ColorManager.primary:ColorManager.grey,
                              // borderColor: ColorManager.grey,
                              onClick: (){
                                if(!agree)return;
                                if(okClick!=null) {
                                  okClick();
                                }else {
                                  Navigator.pop(context);
                                }
                              },)),
                        const AppSizeBox(width: AppSize.s20),
                        Expanded(
                            flex: 1,
                            child: AlertButton(
                                width: .6.sw,
                                color: ColorManager.white,
                                borderColor: ColorManager.grey,
                                titleColor: ColorManager.primary,
                                title: 'Cancel'.tr(),onClick:(){
                              if(cancelOnClick!=null) {
                                cancelOnClick();
                              }
                              else {
                                Navigator.pop(context);
                              }

                            })),
                        const AppSizeBox(width: AppSize.s20),
                      ],
                    ),
                  ),
                ],
              ),
            )),
          ),
        );
      },
      animationType: DialogTransitionType.size,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }
  optionalAlertDialog({required BuildContext context ,required String title ,
    required String message,Function? okClick,Function? cancelOnClick,String? btn1Title ,String? btn2Title}){
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,

      builder: (BuildContext context) {
        return    Center(
          child: Material(
            // borderRadius: BorderRadius.circular(RadiusManager.r18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(RadiusManager.r12),
              // side: const BorderSide(color: ColorManager.primary, width: 2,),
            ),
            child: SizedBox(
              height: .3.sh,
              width: .8.sw,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(title:title,
                    titleSize: FontSize.s20, titleAlign: TextAlign.center,
                    titleColor: ColorManager.black.withOpacity(.5),
                    fontWeightType: FontWeightType.medium,
                    titleMaxLines: 3,),

                  const AppSizeBox(height: AppSize.s20),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal:PaddingManager.p20.w),
                    child: AppText(title:message,
                      titleSize: FontSize.s16, titleAlign: TextAlign.center,
                      titleHeight: 1.2,
                      titleColor: ColorManager.black.withOpacity(.5),
                      fontWeightType: FontWeightType.medium, titleMaxLines: 10,),
                  ),

                  const AppSizeBox(height: AppSize.s20),


                  SizedBox(
                    height: AppSize.s60.h,
                    child: Row(
                      children: [
                        const AppSizeBox(width: AppSize.s20),
                        Expanded(
                            flex: 1,
                            child: AlertButton(title: btn1Title??'ok'.tr(),
                              width: .6.sw,
                              color: ColorManager.primary,
                              // borderColor: ColorManager.grey,
                              onClick: (){
                              if(okClick!=null) {
                                okClick();
                              }else {
                                Navigator.pop(context);
                              }
                            },)),
                        const AppSizeBox(width: AppSize.s20),
                        Expanded(
                            flex: 1,
                            child: AlertButton(
                                width: .6.sw,
                                color: ColorManager.white,
                                borderColor: ColorManager.grey,
                                titleColor: ColorManager.primary,
                                title: btn2Title??'Cancel'.tr(),onClick:(){
                              if(cancelOnClick!=null) {
                                cancelOnClick();
                              }
                              else {
                                Navigator.pop(context);
                              }

                            })),
                        const AppSizeBox(width: AppSize.s20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      animationType: DialogTransitionType.size,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }

  titleMessageAlert({required BuildContext context ,required String title ,
    required String message,Function? okClick,}){
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return    Center(
          child: Material(
            borderRadius: BorderRadius.circular(RadiusManager.r18),
            child: SizedBox(
              height: .3.sh,
              width: .8.sw,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(title:title,
                    titleSize: FontSize.s20, titleAlign: TextAlign.center,
                    titleColor: ColorManager.black.withOpacity(.5),
                    fontWeightType: FontWeightType.medium,
                   titleMaxLines: 1,),

                  const AppSizeBox(height: AppSize.s20),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal:PaddingManager.p20.w),
                    child: AppText(title:message,
                      titleSize: FontSize.s16, titleAlign: TextAlign.center,
                      titleHeight: 1.2,
                      titleColor: ColorManager.black.withOpacity(.5),
                      fontWeightType: FontWeightType.medium, titleMaxLines: 10,),
                  ),

                  const AppSizeBox(height: AppSize.s20),

                  SizedBox(
                    height: AppSize.s60.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AlertButton(
                            title: 'ok'.tr(),
                            color: ColorManager.primary,
                            onClick: ()=>okClick!=null? okClick():Navigator.pop(context),
                            width: .4.sw),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      animationType: DialogTransitionType.size,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }




  static showToastNotification(msg, {Color? color, Color? textColor, Alignment? alignment,int? durationTime}) {
    BotToast.showSimpleNotification(
        title: msg,
        align: alignment ?? Alignment.center,
        backgroundColor: color ?? ColorManager.black,
        titleStyle: TextStyle(color: textColor ?? ColorManager.white,fontSize: 12),
        duration:durationTime==null? Constants.splashDuration:Duration(seconds: durationTime),
        hideCloseButton: true,
        // closeIcon:  Icon(
        //   Icons.close,
        //   size: 25,
        //   color: ColorManager.white,
        // )
    );
  }

  static showSimpleToast(msg) {
    BotToast.showText(text: msg,
      duration: const Duration(seconds: 8),
      textStyle:  TextStyle(color: ColorManager.white,fontSize: FontSize.s16,
           fontWeight: FontWeightManager.regular),);
  }

  static void showSnackBar(String msg, BuildContext context, [Color? color]) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      // behavior: SnackBarBehavior.floating,
      content: Text(msg),
      backgroundColor: color ?? ColorManager.primary,
      duration: const Duration(milliseconds: 1500),
    ));
  }
}



class AlertButton extends StatelessWidget {
  final String title;
  final Function onClick;
  final double? width;
  final Color? color;
  final Color? borderColor;
  final Color? titleColor;
  const AlertButton({Key? key,required this.title,
    this.color,
    this.borderColor,
    this.titleColor,
    required this.onClick,required  this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width??1.0.sw,
      height: AppSize.s40.h,
      child: Center(
        child: TextButton(
          onPressed: ()=>onClick(),

          style:  ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(color??ColorManager.primaryWithOpacity),
              backgroundColor: MaterialStateProperty.all<Color>(color??ColorManager.primaryWithOpacity),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(RadiusManager.r8),
                      side: BorderSide(color:borderColor??(color??ColorManager.primaryWithOpacity))
                  )
              )
          ),
          child:       Center(
            child: AppText(title:title,
              titleSize: FontSize.s18, titleAlign: TextAlign.start,
              titleColor: titleColor??ColorManager.white,
              fontWeightType: FontWeightType.bold,
              titleMaxLines: 1,),
          ),
        ),
      ),
    );
  }
}