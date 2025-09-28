part of 'dio_imports.dart';

class DioHelper {

  Dio? _dio;
  DioCacheManager? _manager;
  final bool forceRefresh;
  late String  baseUrl ;
  // BuildContext context;
  DioHelper({this.forceRefresh = true}) {
    baseUrl = getBaseUrl();
    _dio ??= Dio(BaseOptions(baseUrl: baseUrl, contentType: "application/json; charset=utf-8",),)
      // ..interceptors.add(_getCacheManager().interceptor)
      ..interceptors.add(LogInterceptor(
          // error: !Constants.isProductionMode ,
          // request:  !Constants.isProductionMode,
          // requestBody:  !Constants.isProductionMode,
          // requestHeader:  !Constants.isProductionMode,
          // responseHeader: !Constants.isProductionMode ,
          // responseBody: !Constants.isProductionMode
      ));

  }

  DioCacheManager _getCacheManager() {
    _manager ??= DioCacheManager(CacheConfig(baseUrl: baseUrl, defaultRequestMethod: "POST"));
    return _manager!;
  }

  Future<dynamic> get({required String url,required BuildContext context, }) async {
    Utils.printData("$baseUrl$url");
    _dio?.options.headers = await _getHeader(url: url,);
    try {
      var response = await _dio!.get("$baseUrl$url");
      Utils.printData("statusCode ===========> ${response.statusCode}");
      Utils.printData("header  ===========>  ${response.headers}");
      Utils.printData("response ===========>  ${response.data.toString()}");
      if (response.statusCode==200||response.statusCode==201) {
        return response.data;
      }


      else {
        // ignore: use_build_context_synchronously
        showErrorMessage(response:response, context:context,url: url);

      }
    } on DioError catch (e) {

      // ignore: use_build_context_synchronously
      showErrorMessage(response:e.response,context: context,url: url, );


    }
    return null;
  }




  // getCurrentCountry() async {
  //   // try {
  //     Response response = await _dio!.get(Constants.getLocationUrl);
  //     print('fffffffffffffffffffffff');
  //   //   var value = await AppService().getRequestExternalUrl(AppSetting.getLocationUrl);
  //   //   if (value == null) return null;
  //   //   CountryInOut country = CountryInOut.fromJson(json.decode(
  //   //       (value as String).replaceAll('%3F(', '').replaceAll(')', '')));
  //   //   return country;
  //   // } catch (e) {
  //   //   return null ;
  //   // }
  // }

  // Future<dynamic> post(String url, Map<String, dynamic> body,BuildContext context) async {
  Future<dynamic> post({required String url, required Map<String, dynamic> body,
    required BuildContext context,FormData? formData}) async {
    Utils.printData(body.toString());
    Utils.printData("$baseUrl$url");
    _dio?.options.headers = await _getHeader(url: url);

    // print('--------------------');
    if(formData==null) Utils.printData(body.toString());
    else {
      print('--------------------form data');
      Utils.printData(formData.fields.toString());
      Utils.printData(formData.files.toString());
    }
    try {
      // // ignore: use_build_context_synchronously
      // bool ifInterNet=await checkInternet(context);
      // if(!ifInterNet)return;
      var response =formData==null? await _dio!.post("$baseUrl$url", data: jsonEncode(body),
          // options: _buildCacheOptions(body)
      ): await _dio!.post("$baseUrl$url", data:formData,);

      Utils.printData("statusCode ===========> ${response.statusCode}");
      Utils.printData("header  ===========>  ${response.headers}");
      Utils.printData("response ===========>  ${response.data.toString()}");
      if (response.statusCode==200||response.statusCode==201) {
        return response.data;
      }else {
        // ignore: use_build_context_synchronously
        showErrorMessage(response: response,context: context,url: url);
      }
    } on DioError catch (e) {
      // ignore: use_build_context_synchronously
      showErrorMessage(response:e.response,context:context ,url: url);


    }
    return null;
  }


  _getHeader({required String url}) async {
    String token = Constants.userDataModel!=null?Constants.userDataModel!.accessToken:'';
    Map<String,String>header= {
      'Accept': 'application/json',
      'lang': Constants.langCode,
      // 'Authorization': token.isNotEmpty?'$token':'',
      'Authorization': token.isNotEmpty?'Bearer $token':'',

    };
    Utils.printData(header.toString());
    return header;
  }

  void tokenExpired(BuildContext context) {
    // CacheHelper.clearUserModelData();
    CacheHelper.clearUserModelData();
    gotoIntro(context:context,currentIndexScreen: 0);
    // Utils.logOut(context);
    // MyRoute().navigateAndRemove(context: context, route: const SplashScreen());
    LoadingDialog().optionalAlertDialog(context: context,
        title: 'signIn'.tr(),
        message:'UnauthenticatedMessage'.tr(),
      okClick: (){
      Navigator.pop(Constants.navigatorAppKey.currentState!.context);
        MyRoute().navigate(context: Constants.navigatorAppKey.currentState!.context,
        route: const LoginScreen());
      });


  }


  showErrorMessage({required Response? response,required BuildContext context,required String url,}) {
    Utils.printData("response  ${response!.data.toString()}");
    if (response == null) {
      //  Utils.printData("failed response Check Server");
      LoadingDialog.showSimpleToast("checkNet".tr());
    } else {


      var data = response.data;


      try{

        switch (response.statusCode) {
          case 401:

            tokenExpired(context);
            break;

            case 500:

              LoadingDialog.showSimpleToast('errorTryAgainLater'.tr());
            break;


          default:

            if(data["message"].toString().contains('The email has already been taken.')) {
              LoadingDialog.showSimpleToast('ThisEmailHasAlreadyBeenTaken'.tr());
            }
           else  if(data["message"].toString().contains('Wrong email-or password')) {
              LoadingDialog.showSimpleToast('WrongEmailOrPassword'.tr());
            }
           else  if(data["message"].toString().contains('The selected promo code is invalid')) {
              LoadingDialog.showSimpleToast('PromoCodeIsInvalid'.tr());
            }
            else if(data["message"].toString().isNotEmpty) {
              LoadingDialog.showSimpleToast(data["message"].toString());
            } else {
              LoadingDialog.showSimpleToast('errorTryAgainLater'.tr());
            }
            break;
        }
      }catch(e){
        Utils.printData(e.toString());
        LoadingDialog.showSimpleToast('errorTryAgainLater'.tr());
      }

    }
  }


String getBaseUrl(){
    return 'https://job.phlera.net/m/api/';
    // return 'https://naasaq.com/api/';
    // return 'http://estate.naasaq.com/ api/';
    // return 'http://estate.smartbox.com.sa/api/';

}


}