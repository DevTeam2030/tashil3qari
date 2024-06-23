import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/cache_helper.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/domain/controller/notifications_controller.dart';


import '../domain/controller/agreements_controller.dart';
import '../domain/model/models/agreements_model.dart';
import '../domain/model/user_notification_model.dart';
import 'chat_provider.dart';
import 'council_provider.dart';


class AgreementsProvider extends ChangeNotifier {
  final AgreementsController _api=AgreementsController();
  bool isLoading=false;
  List<AgreementModel> agreements=[];

  Future<void>getAgreements({required BuildContext context,required bool notify})async{
    isLoading=true;
    if(notify)notifyListeners();
    agreements=await _api.getAgreements(context: context,);
    isLoading=false;
    notifyListeners();
  }

  // Future<void>addAgreement({required BuildContext context,required SentAgreementRequestModel model})async{
  //
  //   isLoading=true;
  //   notifyListeners();
  //   bool added=await _api.addAgreement(context: context,model: model);
  //   context.read<ChatProvider>().updateRejectPdfInAllMessages(userId:model.senderUserId, otherId: model.receiverUserId,rejectPdf: false);
  //   isLoading=false;
  //   notifyListeners();
  // }
  //
  // Future<void>addOpportunityAgreement({required BuildContext context,required SentOpportunityAgreementRequestModel model})async{
  //
  //   isLoading=true;
  //   notifyListeners();
  //   bool added=await _api.addOpportunityAgreement(context: context,model: model);
  //   context.read<ChatProvider>().updateRejectPdfInAllMessages(userId:model.senderUserId,
  //       otherId: model.receiverUserId,rejectPdf: false);
  //   isLoading=false;
  //   notifyListeners();
  // }
  //
  //
  // Future<void>addConsultantAgreement({required BuildContext context,required AddConsultantAgreementRequestModel model})async{
  //
  //   isLoading=true;
  //   notifyListeners();
  //   bool added=await _api.addConsultantAgreement(context: context,model: model);
  //   if(added)   context.read<CouncilProvider>().getOpportunities(context: context,);
  //   isLoading=false;
  //   notifyListeners();
  // }






}
