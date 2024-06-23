import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/app/validator.dart';
import 'package:tashil_agary/components/app_bar.dart';
import 'package:tashil_agary/components/buttons/text_button.dart';
import 'package:tashil_agary/components/check_icon.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/components/text_field/text_field_imports.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/localization_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  // final formKey = GlobalKey<FormState>();
  // TextEditingController searchController = TextEditingController();
  bool isArabic=false;
  @override
  void initState() {
    super.initState();
    isArabic=Constants.isArabic;
  }
  @override
  void dispose() {
    super.dispose();
    // searchController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Language'.tr(),showLogo: false,
          showBackICon: true,  titleColor: ColorManager.primary,),
      body:  SizedBox(
        height: 1.0.sh,
        width: 1.0.sw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            

            const AppSizeBox(height: AppSize.s50),


            LanguageItem(title: 'English',
                isSelected: !isArabic,
                onTap: ()=> setState(()=>isArabic=false)),
            const AppSizeBox(height: AppSize.s20),
            LanguageItem(title: 'العربية',
                isSelected: isArabic,
                onTap: ()=> setState(()=>isArabic=true)),

             AppSizeBox(height: .2.sh),


            MyTextButton(title: 'Save'.tr(),
                size: Size( .66.sw,  45),
                fontWeightType: FontWeightType.bold,
                titleSize: FontSize.s18,
                primaryColor: ColorManager.primary,
                titleColor: ColorManager.white,
                onPressed: (){
              isArabic?
              LocalizationManager.changeLocaleLangeToArabic(context: context):
              LocalizationManager.changeLocaleLangeToEnglish(context: context);
                }),
          ],
        )
      )
    );
  }
}


class LanguageItem extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool isSelected;
  const LanguageItem({Key? key,required this.onTap,required this.title,required this.isSelected}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ()=>onTap(),
      child: Container(
        height: AppSize.s50,
        width: .9.sw,
        padding: const EdgeInsets.symmetric( horizontal:PaddingManager.p16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(RadiusManager.r10),
            border: Border.all(color:isSelected?ColorManager.primary:  ColorManager.searchGrey,width: 1),
            color: ColorManager.textFormFieldFillColor
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
                title: title,
                titleAlign: TextAlign.start,
                titleColor:isSelected?ColorManager.primary:  ColorManager.textGrey,
                titleMaxLines: 1,
                titleHeight: 1.1,
                fontWeightType: FontWeightType.regular,
                titleSize: FontSize.s16),
            CheckIcon(primaryColor:isSelected?ColorManager.primary: ColorManager.textGrey,
                fillColor: ColorManager.textFormFieldFillColor)
            // Icon(Icons.check_circle_outline_sharp,
            //     size: AppSize.s30,
            //     color: ColorManager.textGrey),
          ],
        ),
      ),
    );
  }
}
