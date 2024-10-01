import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/presentation/general/app_screens/terms_of_service_screen.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

import '../../../../app/contants.dart';
import '../../../../components/remember_password.dart';
import '../../../../domain/model/models/country_model.dart';
import '../../../../utilites/route_manager.dart';
import '../../app_screens/terms_of_use_screen.dart';
import '../../app_screens/privacy_policy.dart';
import '../register/register_data.dart';


class AgreeTerms extends StatelessWidget {
  final  RegisterData registerData;
  const AgreeTerms({Key? key,required this.registerData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder(valueListenable: registerData.agreeTerms,
      builder: (context, value, child) =>    CheckBoxWidget(
        checkBoxValue: value,
        title: 'pledgeMessage'.tr().replaceFirst('num', Constants.settingModel.appValueAfterSelling.toString()),
        child: SizedBox(
          width: .8.sw,
          child: Wrap(
            children: [
              AppText(
                  title: 'iAgreeToThe'.tr(),
                  titleHeight: 1.5,
                  titleAlign: TextAlign.start,
                  titleColor: ColorManager.text,
                  fontWeightType: FontWeightType.medium,
                  titleSize:FontSize.s14,underline: false),
        InkWell(
          onTap: ()=>
              MyRoute().navigate(context: context, route:  const TermsOfUseScreen()),
          child:
              AppText(
                  title: '  ${'Terms and Conditions'.tr()} ',
                  titleColor: ColorManager.primary,
                  titleHeight: 1.5,
                  titleAlign: TextAlign.start,
                  fontWeightType: FontWeightType.medium,
                  titleSize:FontSize.s12,underline: false)),
              AppText(
                  title: 'and'.tr(),
                  titleHeight: 1.5,
                  titleMaxLines: 100,
                  titleColor: ColorManager.text,
                  titleAlign: TextAlign.start,
                  fontWeightType: FontWeightType.medium,
                  titleSize:FontSize.s12,underline: false),
              InkWell(
          onTap: ()=>
              MyRoute().navigate(context: context, route:  const PrivacyPolicyScreen()),
          child:
              AppText(
                  title: ' ${'PrivacyPolicy'.tr()}',
                  titleColor: ColorManager.primary,
                  titleHeight: 1.5,
                  titleAlign: TextAlign.start,
                  fontWeightType: FontWeightType.medium,
                  titleSize:FontSize.s12,underline: false)),
              AppText(
                  title: '  ${Constants.settingModel.pledgeMessage}',
                  titleHeight: 1.5,
                  titleMaxLines: 100,
                  titleColor: ColorManager.text,
                  titleAlign: TextAlign.start,
                  fontWeightType: FontWeightType.medium,
                  titleSize:FontSize.s12,underline: false),
              // InkWell(
              //   onTap: ()=>
              //       MyRoute().navigate(context: context, route:  const TermsOfUseScreen()),
              //   child: RichText(
              //
              //     text:  TextSpan(
              //       text:"iAgreeToThe".tr(),
              //       style:getAppTextStyle(titleColor: ColorManager.text,
              //           fontWeightType: FontWeightType.medium,
              //           titleSize:FontSize.s14,underline: false),
              //
              //       children: [
              //         TextSpan(
              //           text:'  ${'Terms and Conditions'.tr()}',
              //           style: getAppTextStyle(
              //               titleColor: ColorManager.primary,
              //               fontWeightType: FontWeightType.medium,
              //               titleSize:FontSize.s14,underline: false),),
              //
              //         TextSpan(
              //           // text:'  واتعهد بدفع اي رسوم إجرائية علي المعاملات في تطبيق تسهيل عقاري',
              //           text:'  ${Constants.settingModel.pledgeMessage}',
              //           style: getAppTextStyle(
              //             titleHeight: 1.5,
              //               titleColor: ColorManager.text,
              //               fontWeightType: FontWeightType.medium,
              //               titleSize:FontSize.s14,underline: false),),
              //
              //       ],
              //     ),
              //   ),
              // ),


            ],
          ),
        ),
        checkBoxFunction: (v)=>registerData.agreeTerms.value=v!,
      ),);


  }
}




