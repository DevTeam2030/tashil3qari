
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/providers/wishlist_provider.dart';

import '../app/utils.dart';
import '../components/loading_manager.dart';
import '../domain/controller/add_property_controller.dart';
import '../domain/controller/consultant_controller.dart';
import '../domain/model/models/add_property_model.dart';
import '../domain/model/models/comment_model.dart';
import '../domain/model/models/consultant_info_model.dart';
import '../domain/model/models/consultant_model.dart';
import '../domain/model/models/general_property_model.dart';
import '../domain/model/models/make_auction_model.dart';
import '../presentation/general/add_ad/add_ad_imports.dart';
import '../presentation/general/add_ad/widgets/widgetImports.dart';
import '../utilites/route_manager.dart';

class ConsultantProvider extends ChangeNotifier {
  final ConsultantController _api=ConsultantController();
bool isLoading=false;

  List<ConsultantCommentModel> allConsultantRates=[];

  List<ConsultantModel> allConsultants=[];
  List<ConsultantModel> filterConsultants=[];

  ConsultantInfoModel? consultantInfo;
  List<GeneralPropertyModel> consultantsAds=[];

  Future<void>getAgreementConsultants({required BuildContext context,bool? notify,required int agreementId})async{
    allConsultants=[];
    filterConsultants=[];
    isLoading=true;
    if(notify==true)notifyListeners();
    allConsultants=await _api.getAgreementConsultants(context: context,agreementId: agreementId,);
    filterConsultants=allConsultants;
    isLoading=false;
    notifyListeners();

  }



  Future<void>getConsultants({required BuildContext context,bool? notify,int? opportunityId, int? cityId })async{
    // allConsultants=[];
    // filterConsultants=[];
    if(allConsultants.isEmpty){
      isLoading=true;
      if(notify==true)notifyListeners();
    }
    var data=await _api.getConsultants(context: context,opportunityId: opportunityId,);
    if(cityId!=null)data=data.where((element) => element.cityId==cityId).toList();
    allConsultants=data;
    filterConsultants=allConsultants;
    isLoading=false;
    notifyListeners();
  }

  Future<void>searchConsultants({required String? name})async{
    // FocusScope.of(context).requestFocus( FocusNode());
    filterConsultants=name==null||name.isEmpty?allConsultants:
        allConsultants.where((element) => element.name.contains(name)||
            element.serialCode.contains(name)).toList();
    isLoading=false;
    notifyListeners();

  }
  Future<void>filterAllConsultants({required int? countryId,required int? cityId,required double? rate})async{

    filterConsultants= allConsultants.where((element) =>
        element.countryId==countryId&&
            element.cityId==cityId&&
            element.rate==rate
        ).toList();
    isLoading=false;
    notifyListeners();

  }


  Future<void>getConsultantInfo({required BuildContext context,bool? notify,required int consultantId})async{
   consultantInfo=null;
    isLoading=true;
    if(notify==true)notifyListeners();
    consultantInfo=await _api.getConsultantInfo(context: context,consultantId:consultantId );
    // ignore: use_build_context_synchronously
    consultantsAds=await _api.getConsultantsAds(context: context,consultantId: consultantId);
    allConsultantRates=await _api.getConsultantRates(context: context,consultantId: consultantId);
    isLoading=false;
    notifyListeners();
    if(consultantInfo==null)Navigator.pop(context);

  }

  Future<void>addConsultantRate({required BuildContext context,required int consultantId,required double rate,
    required String comment })async{
    if(Utils.checkIfUserLogin(context: context)==false)return;
    isLoading=true;
    notifyListeners();

    bool add=await _api.addConsultantRate(context: context,consultantId: consultantId,comment: comment,rate: rate);
    if(add) {
      allConsultantRates=await _api.getConsultantRates(context: context,consultantId: consultantId);
    }
    isLoading=false;
    notifyListeners();
  }

  Future<void>addConsultantReplyRate({required BuildContext context,required int rateId, required String comment ,
    required int consultantId})async{
    if(Utils.checkIfUserLogin(context: context)==false)return;
    isLoading=true;
    notifyListeners();

    bool add=await _api.addConsultantReplyRate(context: context,comment: comment,rateId: rateId);
    if(add) {
      allConsultantRates=await _api.getConsultantRates(context: context,consultantId: consultantId);
    }
    isLoading=false;
    notifyListeners();
  }

  Future<void>followConsultant({required BuildContext context,required  ConsultantInfoModel  consultant})async{
    if(Utils.checkIfUserLogin(context: context)==false)return;
    isLoading=true;
      notifyListeners();

    bool follow=await _api.followConsultant(context: context,consultantId: consultant.id);
    // if(follow) {
    //   if(consultantInfo!=null&&consultantInfo!.id==consultant.id)consultantInfo!.isFollow=true;
    // }
    consultantInfo=await _api.getConsultantInfo(context: context,consultantId:consultant.id );
    isLoading=false;
    notifyListeners();
  }

  Future<void>unFollowConsultant({required BuildContext context,required  ConsultantInfoModel  consultant})async{
    if(Utils.checkIfUserLogin(context: context)==false)return;
    isLoading=true;
      notifyListeners();

    bool follow=await _api.unFollowConsultant(context: context,consultantId: consultant.id);
    // if(follow) {
    //   if(consultantInfo!=null&&consultantInfo!.id==consultant.id)consultantInfo!.isFollow=false;
    // }
    consultantInfo=await _api.getConsultantInfo(context: context,consultantId:consultant.id );
    isLoading=false;
    notifyListeners();
  }

  Future<void>unWish({required BuildContext context,required GeneralPropertyModel  property})async{
    if(Utils.checkIsLogin()==false)return;
    isLoading=true;
    notifyListeners();
    bool unWished =await context.read<WishlistProvider>().unWishlist(context: context,adId: property.id);
    if(unWished)consultantsAds.firstWhere((element) => element.id==property.id,).wishlist=false;


    isLoading=false;
    notifyListeners();
  }
  Future<void>wish({required BuildContext context,required GeneralPropertyModel  property})async{
    if(Utils.checkIsLogin()==false)return;
    isLoading=true;
    notifyListeners();
    bool wishlist =await context.read<WishlistProvider>().wishlist(context: context,adId: property.id);
    if(wishlist)consultantsAds.firstWhere((element) => element.id==property.id,).wishlist=true;

    isLoading=false;
    notifyListeners();
  }



}
