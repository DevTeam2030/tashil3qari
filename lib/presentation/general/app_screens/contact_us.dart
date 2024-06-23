// import 'package:kadytech/app/constants.dart';
// import 'package:kadytech/app/enums.dart';
// import 'package:kadytech/app/utils.dart';
// import 'package:kadytech/app/utils.dart';
// import 'package:kadytech/components/contact_us_element.dart';
// import 'package:kadytech/components/default_app_bar.dart';
// import 'package:kadytech/data/providers/chat_provider.dart';
// import 'package:kadytech/utilites/loading_manager.dart';
// import 'package:kadytech/components/screen_loading.dart';
// import 'package:kadytech/data/providers/user_provider.dart';
// import 'package:kadytech/domain/models/user_model.dart';
// import 'package:kadytech/presentation/auth/login/login_imports.dart';
// import 'package:kadytech/utilites/color_manager.dart';
// import 'package:kadytech/utilites/image_manager.dart';
// import 'package:kadytech/utilites/route_manager.dart';
// import 'package:kadytech/utilites/string_manager.dart';
// import 'package:kadytech/utilites/values_manager.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';
//
// class ContactUsScreen extends StatefulWidget {
//   const ContactUsScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ContactUsScreen> createState() => _ContactUsScreenState();
// }
//
// class _ContactUsScreenState extends State<ContactUsScreen> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<ChatProvider>().isLoading=false;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: ColorManager.white,
//         appBar: DefaultAppBar(title: StringManager.connectWithUs.tr(),showBackCart: false),
//         body: Consumer<UserProvider>(
//
//           builder: (context, userProvider, child) => ScreenLoading(
//             isLoading: userProvider.isLoading||context.watch<ChatProvider>().isLoading,
//             child: Padding(
//               padding: const EdgeInsets.all(PaddingManager.p28),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     ContactUsElement(
//                       onTap: (){
//                         // printData(UserModel().userId);
//                         // return;
//                         context.read<ChatProvider>().setConnectServer2();
//                         return;
//                         if(Constants.settingModels.isEmpty)return;
//                         Utils.launchWhatsApp(phone: Constants.settingModels.where((element) => element.key=='whatsapp').toList().first.value,
//                             context: context);
//                       },
//                       title: StringManager.liveChat.tr(),
//                       image: ImageManager.phoneHome,
//                       icon: const Icon(FontAwesomeIcons.whatsapp,size: AppSize.s50,color: ColorManager.whatsapp,),
//                     ),
//
//                     // if(false)
//                     ContactUsElement(
//                       onTap: (){
//                         if (UserModel().userId.isEmpty ){
//                           LoadingDialog().showWarningAnimatedDialog(context: context,
//                               msg: StringManager.sorryYouHaveToLogInFirstInOrderTo.tr(),
//                               alertType: AlertType.warning,
//                               isOptionAlert: true,
//                               mainActionFunction: (){
//                                 Navigator.pop(context);
//                                 MyRoute().navigateAndRemove(context: context,
//                                     route: const LoginScreen());
//                               },
//                               mainActionTitle: StringManager.login.tr());
//
//                         }else {
//
//
//                           context.read<ChatProvider>().setConnectServer();
//                           // userProvider.getOnlineAgent(context: context);
//                           // Navigator.pushNamed(context, Routes.chatScreen);
//                         }
//                       },
//                       title: StringManager.liveChat.tr(),
//                       image: ImageManager.phoneHome,
//                       icon: const Icon(FontAwesomeIcons.whatsapp,size: AppSize.s50,color: ColorManager.whatsapp,),
//                     ),
//
//                     ContactUsElement(
//                       onTap: (){
//                        if(Constants.settingModels.isEmpty)return;
//                         Utils.makePhoneCall(phoneNumber:
//                         Constants.settingModels.where((element) => element.key=='phoneForCall').toList().first.value,
//                             context: context);
//                       },
//                       title: StringManager.callUs.tr(),
//                       image: ImageManager.phoneHome,
//                     ),
//                     ContactUsElement(
//                       onTap: (){
//                         if(Constants.settingModels.isEmpty)return;
//                         Utils.sendEmail(
//                             email:  Constants.settingModels.where((element) => element.key=='email').toList().first.value,
//                             context: context);
//                       },
//                       title: StringManager.email.tr(),
//                       image: ImageManager.emailHome,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ));
//   }
// }
//
