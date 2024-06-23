
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/domain/controller/home_controller.dart';
import 'package:tashil_agary/domain/controller/one_category_controller.dart';
import 'package:tashil_agary/domain/controller/search_controller.dart';
import 'package:tashil_agary/domain/model/home_venue_model.dart';
import 'package:tashil_agary/domain/model/model/home_main_category.dart';
import 'package:tashil_agary/domain/model/model/home_model.dart';
import 'package:tashil_agary/domain/model/model/home_product.dart';
import 'package:tashil_agary/domain/model/privacy_model.dart';
import 'package:tashil_agary/providers/notifications_provider.dart';

class OneCategoryProvider extends ChangeNotifier {
  final OneCategoryController _api=OneCategoryController();
  final SearchApiController _apiSearch=SearchApiController();
bool isLoading=false;

List<HomeProduct>products=[];




  Future<void>getAllSubCategories({required BuildContext context,required int catId})async{

    isLoading=true;
    notifyListeners();
    products=await _api.getAllCategoryProducts(context: context, catId: catId);
    isLoading=false;
    notifyListeners();
  }

  // int? prevCatId;
  Future<void>getAllCategoryProducts({required BuildContext context,required int catId})async{
    // if(prevCatId!=catId) products=[];
    // prevCatId=catId;
    isLoading=true;
    // notifyListeners();
    products=await _api.getAllCategoryProducts(context: context, catId: catId);
    isLoading=false;
    notifyListeners();
  }



  Future<void> searchProducts({required BuildContext context,required  int? catId,
    required  int? subCatId,required String? keyword}) async {
    isLoading=true;
    // notifyListeners();
    products=await _apiSearch.searchProducts(context: context, catId: catId,keyword: keyword,subCatId: subCatId);
    isLoading=false;
    notifyListeners();
  }

}
