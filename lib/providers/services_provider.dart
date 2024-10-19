import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/cache_helper.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/domain/controller/notifications_controller.dart';
import 'package:tashil_agary/domain/model/models/service_model.dart';


import '../domain/controller/agreements_controller.dart';
import '../domain/controller/services_controller.dart';
import '../domain/model/models/agreements_model.dart';
import '../domain/model/user_notification_model.dart';
import 'chat_provider.dart';
import 'council_provider.dart';


class ServicesProvider extends ChangeNotifier {
  final ServicesController _api=ServicesController();
  bool isLoading=false;
  List<ServiceModel> services=[];

  Future<void>getServices({required BuildContext context,required bool notify})async{
    if(services.isEmpty) {
      isLoading=true;
      if(notify)notifyListeners();
    }

    services=await _api.getServices(context: context,);
    isLoading=false;
    notifyListeners();
  }







}
