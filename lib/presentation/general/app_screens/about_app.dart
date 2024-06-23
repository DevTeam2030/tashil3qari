// import 'package:kadytech/app/constants.dart';
// import 'package:kadytech/app/extentions.dart';
// import 'package:kadytech/app/utils.dart';
// import 'dart:io' show Platform;
// import 'package:kadytech/components/buttons/default_button.dart';
// import 'package:kadytech/components/default_app_bar.dart';
// import 'package:kadytech/components/sized_box_height.dart';
// import 'package:kadytech/utilites/color_manager.dart';
// import 'package:kadytech/utilites/font_manager.dart';
// import 'package:kadytech/utilites/string_manager.dart';
// import 'package:kadytech/utilites/values_manager.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
//
// class AboutAppScreen extends StatelessWidget {
//   const AboutAppScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorManager.white,
//       appBar: DefaultAppBar(title: StringManager.aboutTheApplication.tr(),showBackCart: false),
//       body: Container(
//         height: 1.0.sh,
//         width: 1.0.sw,
//         padding: const EdgeInsets.all(PaddingManager.p28),
//         child: Column(
//           children: [
//             SizedBox(
//               height: .65.sh,
//                 width:1.0.sw,
//                 child:SingleChildScrollView(child:
//                 HtmlWidget(
//                   Constants.settingModels.where((element) => element.key=='about').toList().first.value??'',
//                 textStyle: const TextStyle(fontFamily: FontContants.fontFamily),
//                   enableCaching: true,
//                   onTapUrl: (url)async{
//                   Utils.openUrlInBrowser(context: context,uri: url);
//                   return true;
//                   },
//                   // renderMode: RenderMode.column,
//                   webView: true,
//
//                 ),
//                 ),),
//
//             SizedBoxHeight( height: AppSize.s20.h,),
//
//             DefaultButton.filled(
//                 title: StringManager.rateTheAppOnTheOnlineStore.tr(),
//                 onTap: () {
//                   // Utils.launchReviewApp();
//               if (Platform.isAndroid) {
//
//                 Utils.openUrlInBrowser(uri: Constants.settingModels.where((element) => element.key=='andridAppLink').toList().first.value,context: context);
//               } else {
//                 Utils.openUrlInBrowser(uri: Constants.settingModels.where((element) => element.key=='iosAppLink').toList().first.value,context: context);
//               }
//
//             }),
//
//             SizedBoxHeight( height: AppSize.s20.h,),
//           ],
//         ),
//       ),
//     );
//   }
// }
