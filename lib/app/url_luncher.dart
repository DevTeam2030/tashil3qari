import 'package:easy_localization/easy_localization.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/loading_manager.dart';

class UrlLauncherMethods{


  static  void launchMapByLat({required LatLng location , bool isQueryText = false,}) async {
    // String googleUrl = 'comgooglemaps://?center=${location.latitude},${location.longitude}';
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=${location.latitude},${location.longitude}';


    if (!await launchUrl(Uri.parse(googleUrl))) throw 'Could not launch $googleUrl';
  }
  static  void launchMap({required String address, bool isQueryText = false,}) async {
    String googleUrl;
    if (!isQueryText) {
      googleUrl = address;
    } else {
      String query = Uri.encodeComponent(address);
      googleUrl = "https://www.google.com/maps/search/?api=1&query=$query";
    }

    if (!await launchUrl(Uri.parse(googleUrl))) throw 'Could not launch $googleUrl';
  }

  static  Future<void> makePhoneCall({required String phoneNo,}) async {
    if (!await launch('tel:$phoneNo')) throw 'Could not launch $phoneNo';

  }

  static launchURL({required String url}) async {
    try{
      if (!await launch(url))    LoadingDialog.showSimpleToast('errorTryAgainLater'.tr());
    }catch(e){
      LoadingDialog.showSimpleToast('errorTryAgainLater'.tr());

    }
  }
  static Future<void> whatsapp({required String phoneNo, String? countryCode,String? message }) async {
    final link = WhatsAppUnilink(
      phoneNumber: countryCode??''+phoneNo,
      text:message?? "",
    );
    try{
      if (!await launch('$link'))  LoadingDialog.showSimpleToast('errorTryAgainLater'.tr());
    }catch(e){
      LoadingDialog.showSimpleToast('errorTryAgainLater'.tr());

    }

  }

 static Future<void> sendingSMS({required String phoneNo,}) async {
    var url = Uri.parse("sms:$phoneNo");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      LoadingDialog.showSimpleToast('errorTryAgainLater'.tr());
    }

  }
  static sendEmail({required String email})async{
    // UrlLauncher.launch('mailto:elsayed.fahmy.ali@gmail.com');
    if ( !await launch(
      'mailto:$email',
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) throw 'Could not ent mail';
  }




}