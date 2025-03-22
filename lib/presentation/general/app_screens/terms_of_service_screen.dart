import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/app_bar.dart';
import 'package:tashil_agary/components/screen_loading.dart';
import 'package:tashil_agary/utilites/values_manager.dart';
import '../../../providers/home_map_provider.dart';

class TermsOfServiceScreen extends StatefulWidget {
  const TermsOfServiceScreen({Key? key}) : super(key: key);

  @override
  State<TermsOfServiceScreen> createState() => _TermsOfServiceScreenState();
}

class _TermsOfServiceScreenState extends State<TermsOfServiceScreen> {
  @override
  void initState() {
    super.initState();
    // if(mounted) context.read<HomeProvider>().getTermsService(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'termsOfService'.tr()),
        body:  Consumer<HomeMapProvider>(
          builder: (context, provider, child) => ScreenLoading(
            isLoading: provider.isLoading,
            height: 1.0.sh,
            width: 1.0.sw,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p20,vertical: PaddingManager.p20),
              height: 1.0.sh,
              width: 1.0.sw,
              child: SingleChildScrollView(
                child: HtmlWidget(
                  'provider.termsServiceModel.content',
                  textStyle:  TextStyle(fontFamily: GoogleFonts.tajawal().fontFamily),
                  enableCaching: true,
                  onTapUrl: (url)async{
                    // Utils.openUrlInBrowser(context: context,uri: url);
                    return true;
                  },
                  // renderMode: RenderMode.column,
                  // webView: true,


                ),
              ),
            ),
          ),
        )
    );
  }
}
