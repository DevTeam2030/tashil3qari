
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/providers/profile_provider.dart';

import '../components/loading_manager.dart';
import '../domain/controller/add_property_controller.dart';
import '../domain/model/models/add_property_model.dart';
import '../domain/model/models/make_auction_model.dart';
import '../presentation/general/add_ad/add_ad_imports.dart';
import '../presentation/general/add_ad/widgets/widgetImports.dart';
import '../utilites/route_manager.dart';

class AddPropertyProvider extends ChangeNotifier {
  final AddPropertyController _api=AddPropertyController();
bool isLoading=false;




  Future<void>editProperty({required BuildContext context, required EditPropertyModel model,})async{
    isLoading=true;
    notifyListeners();
    bool isEdit=await _api.editProperty(context: context,model: model);
    isLoading=false;
    notifyListeners();
   if(isEdit)  context.read<ProfileProvider>().getUserAds(context: context, notify: true);
  }

  Future<bool>deleteVideo({required BuildContext context, required int propertyId,})async{
    isLoading=true;
    notifyListeners();
    bool isDeleted=await _api.deleteVideo(context: context,propertyId: propertyId);
    isLoading=false;
    notifyListeners();
   if(isDeleted)  context.read<ProfileProvider>().getUserAds(context: context, notify: true);
   return isDeleted;
  }

  Future<void>addPropertyWithLicense({required BuildContext context, required AddPropertyModel model,
    required String license})async{
    isLoading=true;
    notifyListeners();
    Map<String,dynamic> map=model.toJson();
    map['license_option_id']=1;
    map['license']=license;
    int? propertyId=await _api.addProperty(context: context,map: map,addBid: true);
    isLoading=false;
    notifyListeners();
    // if(propertyId!=null) {
    //   MyRoute().navigate(context: context, route: IfAddAdBidScreen(propertyId: propertyId,));
    //   LoadingDialog().widgetAlertDialog(context:Constants.navigatorAppKey.currentContext!,
    //       widget:  AdSuccesWidget(title: 'requirementsMessage'.tr(),
    //         message: 'requirementsMessage1'.tr(),));
    // }
  }

  Future<void>addPropertyAndExtractLicense({required BuildContext context, required AddPropertyModel model})async{
    isLoading=true;
    notifyListeners();
    Map<String,dynamic> map=model.toJson();
    map['license_option_id']=2;
    int? propertyId=await _api.addProperty(context: context,map: map,addBid: true);
    isLoading=false;
    notifyListeners();

  }

  Future<void>addPropertyAndAddConsultant({required BuildContext context, required AddPropertyModel model,
    required int consultantId})async{
    isLoading=true;
    notifyListeners();
    Map<String,dynamic> map=model.toJson();
    map['license_option_id']=3;
    map['consultant_id']=consultantId;
    int? propertyId=await _api.addProperty(context: context,map: map,addBid: true);
    isLoading=false;
    notifyListeners();

  }


  Future<void>saveWithoutPublish({required BuildContext context, required AddPropertyModel model,})async{
    isLoading=true;
    notifyListeners();
    Map<String,dynamic> map=model.toJson();
    int? propertyId=await _api.addProperty(context: context,map: map,addBid: false);
    isLoading=false;
    notifyListeners();

  }


  Future<void>makeAuction({required BuildContext context, required MakeAuctionModel model,required bool isPropertyFeatured})async{
    isLoading=true;
    notifyListeners();
    await _api.makeAuction(context: context,model: model,isPropertyFeatured: isPropertyFeatured);
    isLoading=false;
    notifyListeners();

  }
  Future<void>makeAdFeatured({required BuildContext context, required MakeAdFeaturedModel model})async{
    isLoading=true;
    notifyListeners();
    await _api.makeAdFeatured(context: context,model: model);
    isLoading=false;
    notifyListeners();

  }

  Future<void>addUnPublishedPropertyToPublish({required BuildContext context, required Map<String ,dynamic> body,})async{
    isLoading=true;
    notifyListeners();
    int? propertyId=await _api.addUnPublishedPropertyToPublish(context: context,map: body,);
    isLoading=false;
    notifyListeners();
  }

  Future<bool>deleteImageFromAd({required BuildContext context, required int imageId})async{
    isLoading=true;
    notifyListeners();
    bool isDeleted=await _api.deleteImageFromAd(context: context,imageId: imageId,);
    isLoading=false;
    notifyListeners();
    return isDeleted;
  }

}
