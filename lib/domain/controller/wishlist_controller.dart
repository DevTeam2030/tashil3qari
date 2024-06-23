import 'package:flutter/cupertino.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/urls.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/domain/dio/dio_imports.dart';
import 'package:tashil_agary/domain/model/home_venue_model.dart';
import 'package:tashil_agary/domain/model/model/home_product.dart';
import 'package:tashil_agary/domain/model/venue_model.dart';

class WishlistController  {
  final DioHelper _dio = DioHelper();
  Future<List<HomeProduct>> getUserWishlistData({required BuildContext context,required  int page}) async {
    List<HomeProduct> data=[];
    String url='${Urls.getWishlist}?lang=${Constants.langCode}';
    if(Constants.userDataModel!=null&&Constants.isLogin)url='$url&user_id=${Constants.userDataModel!.id}';
    var res = await _dio.get(url:url, context: context);
    if (res != null) {
      try{
        data = List<HomeProduct>.from(res['data'].map((x) => HomeProduct.fromJson(x)));

      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return data;
  }
  Future<bool> wishlist({required BuildContext context,required int adId}) async {


    var res = await _dio.post(url:'${Urls.wishlistProduct}?lang=${Constants.langCode}', context: context,
        body: {
          "property_id":adId
        });
    if (res != null) {
    return true;
    }
    return false;

  }

  Future<bool> unWishlist({required BuildContext context,required int adId}) async {


    var res = await _dio.post(url:'${Urls.unWishlistProduct}?lang=${Constants.langCode}', context: context,
        body: {

          "property_id":adId
        });
    if (res != null) {
      return true;
    }
    return false;

  }

}
