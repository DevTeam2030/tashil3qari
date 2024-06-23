import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/app_bar.dart';
import 'package:tashil_agary/components/screen_loading.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/components/social_login_row.dart';
import 'package:tashil_agary/providers/auth_provider.dart';
import 'package:tashil_agary/providers/social_login_provider.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class SocialLoginScreen extends StatefulWidget {
  const SocialLoginScreen({Key? key}) : super(key: key);

  @override
  State<SocialLoginScreen> createState() => _SocialLoginScreenState();
}

class _SocialLoginScreenState extends State<SocialLoginScreen> {
@override
  void initState() {
    super.initState();
    if(mounted)context.read<SocialLoginProvider>().getSocialLoginList(context: context, notify: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'SocialLogins'.tr()),
      body:  Consumer<SocialLoginProvider>(
        builder: (context, provider, child) => ScreenLoading(
          isLoading: provider.isLoading,
          child:   Container(
              margin: const EdgeInsets.symmetric(horizontal: MarginManager.m20),
              height: 1.0.sh,
              width: 1.0.sw,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const AppSizeBox(height: AppSize.s20,),
                  SocialLoginRow(
                      title: 'facebook'.tr(),
                      image: ImageManager.facebook,
                      isConnected: provider.socialLoginModel.facebook,
                      onTap: (){
                        if(provider.socialLoginModel.facebook){
                          if(!checkEmails(provider: provider))return;
                          provider.unActiveSocialAccounts(context: context,registerType: RegisterType.facebook);
                        }else{
                          provider.loginSocialByFacebook(context: context,);
                        }
                      }),

                  const AppSizeBox(height: AppSize.s10,),

                  SocialLoginRow(
                      title: 'gmail'.tr(),
                        image: ImageManager.gmail,
                        isConnected: provider.socialLoginModel.google,
                        onTap: (){
                          if(Platform.isAndroid){
                            if(provider.socialLoginModel.google){
                              if(!checkEmails(provider: provider))return;
                              provider.unActiveSocialAccounts(context: context,registerType: RegisterType.google);
                            }else{
                              provider.loginSocialByGoogle(context: context,);
                            }



                          }
                        }),

                  const AppSizeBox(height: AppSize.s10,),
                  SocialLoginRow(
                      title: 'apple'.tr(),
                        isLastItem: true,
                        image: ImageManager.apple,
                        isConnected: provider.socialLoginModel.apple,
                        onTap: (){
                          if(Platform.isIOS){
                            if(provider.socialLoginModel.apple){
                              if(!checkEmails(provider: provider))return;
                              provider.unActiveSocialAccounts(context: context,registerType: RegisterType.apple);
                            }else{
                              provider.loginSocialByApple(context: context,);
                            }
                          }
                        }),

                ],
              )
          )
        ),
      )

    );
  }
 bool checkEmails({required SocialLoginProvider provider}){
    int emails=0;
    if(provider.socialLoginModel.google)emails+=1;
    if(provider.socialLoginModel.facebook)emails+=1;
    if(provider.socialLoginModel.apple)emails+=1;
    if(provider.socialLoginModel.email)emails+=1;

    return emails>=2;

  }
}


