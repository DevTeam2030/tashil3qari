import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/app/validator.dart';
import 'package:tashil_agary/components/buttons/back_button.dart';
import 'package:tashil_agary/components/buttons/text_button.dart';
import 'package:tashil_agary/components/screen_loading.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/components/text_field/text_field_imports.dart';
import 'package:tashil_agary/presentation/general/auht/login/login_screen.dart';
import 'package:tashil_agary/presentation/general/auht/register/register_data.dart';
import 'package:tashil_agary/presentation/general/auht/widgets/bar_title_value.dart';
import 'package:tashil_agary/presentation/general/auht/widgets/loginImage.dart';
import 'package:tashil_agary/providers/auth_provider.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import 'package:tashil_agary/utilites/route_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

import '../../../app/contants.dart';
import '../../../domain/model/models/searial_number_model.dart';


class SelectSerialScreen extends StatefulWidget {
  final SerialNumberModel? selectedSerialNumber;
  const SelectSerialScreen({super.key,required this.selectedSerialNumber});

  @override
  State<SelectSerialScreen> createState() => _SelectSerialScreenState();
}

class _SelectSerialScreenState extends State<SelectSerialScreen> {
  SerialNumberModel? selectedSerialNumber;
  var serialNumbers=Constants.settingModel.serialNumbers;
  double width=1.0.sw;
  @override
  void initState() {
    super.initState();
    selectedSerialNumber=widget.selectedSerialNumber;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppSizeBox(height: AppSize.s10),
            MyTextButton(title: 'Continue'.tr(),
              size: Size( .8.sw,  47),
              radius: 8,
              fontWeightType: FontWeightType.bold,
              titleSize: FontSize.s18,
              primaryColor: ColorManager.primary,
              titleColor: ColorManager.white,
              onPressed: (){
                Navigator.pop(context,selectedSerialNumber);
              },),

            const AppSizeBox(height: AppSize.s20),
          ],
        ),
        body:InkWell(
            splashColor:ColorManager.white,
            focusColor: ColorManager.white,
            onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
          child: ScreenLoading(
            isLoading: context.watch<AuthProvider>().isLoading,
            child:  SizedBox(
              height: 1.0.sh,
              width: 1.0.sw,
              child: Stack(
                children: [
                  const LoginImage(),

                  Container(
                    height: 1.0.sh,
                    width: 1.0.sw,
                    margin:returnPadding(),
                    child: SizedBox(
                      child:SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const AppSizeBox(height: AppSize.s60),
                            if(Navigator.canPop(context))
                               Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  BackAppBarButton(),

                                ],
                              ),
                            // const AppSizeBox(height: AppSize.s20),
                            Image.asset(ImageManager.splash_logo,
                              height: AppSize.s70,width: AppSize.s100,fit: BoxFit.fill,),

                            const AppSizeBox(height: AppSize.s30),
                            BarTitleValue(
                              title: 'Create Account'.tr(),
                              subtitle:'RegisterAppBarMessage'.tr() ,
                            ),



                            const AppSizeBox(height: AppSize.s20),

                            Wrap(
                              children: [
                                for(int i=0;i<serialNumbers.length;i++)
                                  InkWell(
                                    onTap: (){
                                      if(serialNumbers[i].booked)return;
                                      setState(() {
                                        selectedSerialNumber=serialNumbers[i];
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: AppSize.s10,bottom: AppSize.s10),
                                      padding: const EdgeInsets.symmetric(horizontal: AppSize.s20,vertical: AppSize.s8),
                                      decoration: BoxDecoration(
                                        color:
                                        serialNumbers[i].booked?ColorManager.red:
                                        selectedSerialNumber==serialNumbers[i]?
                                        ColorManager.primary:
                                        ColorManager.reviewGrey,
                                        borderRadius: BorderRadius.circular(AppSize.s8),
                                        // border: Border.all(color: ColorManager.primary,width: 1)
                                      ),
                                      child: AppText(
                                        title: serialNumbers[i].serialNumber,
                                        titleSize: FontSize.s14,
                                        titleColor: selectedSerialNumber==serialNumbers[i]?ColorManager.white:ColorManager.black,
                                      ),
                                    ),
                                  )
                              ],
                            ),
                       
                    

                            const AppSizeBox(height: AppSize.s40),



                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
