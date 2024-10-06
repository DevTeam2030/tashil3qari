import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

import '../../../components/text_field/general_appbar_logo.dart';

class TermsOfUseScreen extends StatefulWidget {
  const TermsOfUseScreen({Key? key}) : super(key: key);

  @override
  State<TermsOfUseScreen> createState() => _TermsOfUseScreenState();
}

class _TermsOfUseScreenState extends State<TermsOfUseScreen> {
  @override
  void initState() {
    super.initState();
    // if(mounted) context.read<HomeProvider>().getTermsOfUse(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GeneralAppBar(title: 'Terms and Conditions'.tr(),showChatNotify: false,showDivider: false),
        body:  Container(
          padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p20,vertical: PaddingManager.p20),
          height: 1.0.sh,
          width: 1.0.sw,
          child: SingleChildScrollView(
            child: HtmlWidget(
              Constants.settingModel.terms,
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
