import 'package:easy_localization/easy_localization.dart';

import 'contants.dart';


class Validator {
  String fillFields = 'fillField'.tr();
  // String passWordValidate = StringManager.passValidation.tr();
  String mailValidation = 'pleaseEnterCorrectEmail'.tr();
  String datelValidation = 'pleaseEnterCorrectDateTime'.tr();
  String phoneValidation = 'pleaseEnterCorrectNumber'.tr();
  String confirmPassword = 'confirmValidation'.tr();
  String passWordValidate = 'passWordValidate'.tr();
  String passWordValidateLength = 'passWordValidateLength'.tr();
  // String pleaseEnterCorrectAmount = StringManager.pleaseEnterCorrectAmount.tr();
  String noValidate({required String value}) {
    return "ok";
  }

  String? validateEmpty({required String? value, String? message}) {
    if (value==null||value.trim().isEmpty) {
      return message ?? fillFields;
    }
    return null;
  }
  
  String? validateText({required String value, String? message}) {
    if (value.trim().isEmpty) {
      return message ?? fillFields;
    }
    return null;
  }

  String? validatePrice({required String value, String? message}) {
    if (value.trim().isEmpty) {
      return message ?? fillFields;
    }
    else  if (double.tryParse(value)==null) {
      return message ?? fillFields;
    }
    return null;
  }
  String? validateSpace({required String value, String? message}) {
    if (value.trim().isEmpty) {
      return message ?? fillFields;
    }
    else  if (double.tryParse(value)==null) {
      return message ?? fillFields;
    }
    return null;
  }

  String? validateName({required String? value, String? message}) {
    if (value==null||value.trim().isEmpty) {
      return message ?? fillFields;
    }
    // if(v==null||v.isEmpty)return WordsManager.required.tr();
    else if (RegExp(r'[!@#<>?":_.`~;[\]\\|=+)(*&^%-]')
        .hasMatch(value)) {
      return message ??'pleaseEnterCorrectName'.tr();
    }
    return null;
  }

  String? validatePassword({required String value, String? message}) {
    // تعبير منتظم للتحقق من أن كلمة المرور تحتوي على حرف واحد على الأقل ورقم واحد على الأقل
    String pattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
    RegExp regExp = RegExp(pattern);
    if (value.trim().isEmpty) {
      return message ?? fillFields;
    }
    else if (
    Constants.isProductionMode&&
        value.length < 8) {
      return message ?? passWordValidateLength;
    }

    else if (
    Constants.isProductionMode&&
        !regExp.hasMatch(value)) {
      return message ?? passWordValidate;
    }
    return null;
  }


  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  String? validateEmail({required String value, String? message}) {
    final String _emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    if (value.trim().isEmpty) {
      return message ?? fillFields;
    }
    // else if (value.) {
    //   return message ?? mailValidation;
    // }
    else if (!RegExp(_emailPattern).hasMatch(value)) {
      // else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
      return message ?? mailValidation;
    }

    return null;
  }
  String? validateDatetime({required String value, String? message}) {
    if (value.trim().isEmpty) {
      return message ?? fillFields;
    }
    // else{
    //   var items=value.split('/');
    //   if(items.length<3) {
    //     return message ?? datelValidation;
    //   } else{
    //     DateTime date=DateTime(int.parse(items.first),
    //       int.parse(items[1]),int.parse(items[2]),);
    //   }
    // }
    else if (DateTime.tryParse(value)==null) {
      return message ?? datelValidation;
    }


    return null;
  }
  String? validateDatetimeIsNotRequired({required String value, String? message}) {
    // if (value.trim().isEmpty) {
    //   return message ?? fillFields;
    // }
    // else{
    //   var items=value.split('/');
    //   if(items.length<3) {
    //     return message ?? datelValidation;
    //   } else{
    //     DateTime date=DateTime(int.parse(items.first),
    //       int.parse(items[1]),int.parse(items[2]),);
    //   }
    // }
    // else
      if (value.trim().isNotEmpty&&DateTime.tryParse(value)==null) {
      return message ?? datelValidation;
    }


    return null;
  }

//   String? validatePhone({required String value, String? message,required CountryModel country}) {
//     String phone=Utils.checkStartDigitsPhone(phone: value);
//     if (phone.trim().isEmpty) {
//       return message ?? fillFields;
//     }
//     else if(value.length!=int.parse(country.mobileNo)){
//       return '$phoneValidation ( ${country.mobileNo} No ) ';
//     }
//     // if(phone.startsWith('05')){
//     //   phone.replaceRange(0, 1, '5');
//     // }
//     // else if (!RegExp(r'(^\+[0-9]{2}|^\+[0-9]{2}\(0\)|^\(\+[0-9]{2}\)\(0\)|^00[0-9]{2}|^0)([0-9]{9}$|[0-9\-\s]{10}$)').hasMatch(value)) {
//     //   return message ?? phoneValidation;
//     // }
//
//     // else if (countryModel.countryType==CountryType.egypt) {
//     //
//     //  if (phone.length != countryModel.digitsNum||!phone.startsWith(countryModel.statWith)) {
//     //   return message ?? phoneValidation;
//     // }
//     //
//     // }
//
//     // if (phone.length != 9||!phone.startsWith('5')) {
//     //   return message ?? phoneValidation;
//     // }
//
//
//     // else if (countryModel.countryType==CountryType.saudi&& (phone.length != 10||!phone.startsWith('05'))) {
//     //   return message ?? phoneValidation;
//     // }
//
// else {
//       return null;
//     }
//   }

  String? validatePhone({required String value, String? message,}) {
    // String phone=Utils.checkStartDigitsPhone(phone: value);
   
    String phone=value;
    
    if (phone.trim().isEmpty) {
      return message ?? fillFields;
    } else if (!phone.startsWith("05", 0) || phone.length > 14 || phone.length < 9) {
      // } else if (!startsWith("05", 0) || length !=10) {
      return message ?? tr('Phone must contain at least 9 numbers staring with 05');
    }
    return null;
  }

  String? validatePasswordConfirm(
      {required String? confirm, required String pass, String? message}) {
    if (confirm==null||confirm.trim().isEmpty) {
      return message ?? fillFields;
    } else if (confirm != pass) {
      return message ?? confirmPassword;
    }
    return null;
  }

  String? validateCode({required String code, String? message}) {
    if (code.trim().isEmpty) {
      return message ?? fillFields;
    } else if (code.length < 4) {
      return message ?? tr("codeValidation");
    }
    return null;
  }
}
