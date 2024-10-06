import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/app_bar.dart';
import 'package:tashil_agary/components/screen_loading.dart';
import 'package:tashil_agary/providers/home_provider.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

import '../../../app/contants.dart';
import '../../../components/text_field/general_appbar_logo.dart';



class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  void initState() {
    super.initState();
    // if(mounted) context.read<HomeProvider>().getPrivacyPolicy(context: context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GeneralAppBar(title: 'PrivacyPolicy'.tr(),showChatNotify: false,showDivider: false),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p20,vertical: PaddingManager.p20),
          height: 1.0.sh,
          width: 1.0.sw,
          child: SingleChildScrollView(
            child: HtmlWidget(
              Constants.settingModel.policyPrivacy,
              textStyle:  TextStyle(fontFamily: GoogleFonts.tajawal().fontFamily),
              // enableCaching: true,
              onTapUrl: (url)async{
                // Utils.openUrlInBrowser(context: context,uri: url);
                return true;
              },
              // renderMode: RenderMode.column,
              // webView: true,


            ),
          ),
        ),
    );
  }
}