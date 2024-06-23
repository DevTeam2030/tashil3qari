import 'dart:io';

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
import 'package:tashil_agary/providers/auth_provider.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

import '../../../../../app/contants.dart';
import '../../../../../domain/model/models/auth/register_model.dart';
import '../../widgets/bar_title_value.dart';
import '../../widgets/loginImage.dart';
import '../../widgets/serial_numbers_down.dart';
import 'fill_personal_data_register_data.dart';



class FillPersonalDataRegisterScreen extends StatefulWidget {
  final RegisterModel registerModel;
  const FillPersonalDataRegisterScreen({super.key,required this.registerModel});

  @override
  State<FillPersonalDataRegisterScreen> createState() => _FillPersonalDataRegisterScreenState();
}

class _FillPersonalDataRegisterScreenState extends State<FillPersonalDataRegisterScreen> {

   late FillPersonalDataRegisterData _fillData;
  @override
  void initState() {
    super.initState();
    _fillData=FillPersonalDataRegisterData(registerModel: widget.registerModel);
    // _registerData=RegisterData();
  }

  @override
  void dispose() {
    super.dispose();
    _fillData.phoneController.dispose();
    _fillData.firstNameController.dispose();
    _fillData.lastNameController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child:Stack(
        children: [
          const LoginImage(),
          Scaffold(
              backgroundColor: ColorManager.transparent,
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyTextButton(title: 'Continue'.tr(),
                      size: Size( .8.sw,  47),
                      radius: 8,
                      fontWeightType: FontWeightType.bold,
                      titleSize: FontSize.s18,
                      primaryColor: ColorManager.primary,
                      titleColor: ColorManager.white,
                      onPressed: ()=>_fillData.follow(context: context,),),
                  ],
                ),
              ),
              body:InkWell(
                splashColor:ColorManager.white,
                focusColor: ColorManager.white,
                onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
                child: ScreenLoading(
                  isLoading: context.watch<AuthProvider>().isLoading,
                  child: Container(
                    height: 1.0.sh,
                    width: 1.0.sw,
                    margin:returnPadding(),
                    child:  Form(
                      key: _fillData.formKey,
                      child:  SizedBox(
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


                              const AppSizeBox(height: AppSize.s30),
                              BarTitleValue(
                                title: 'AddPersonalData'.tr(),
                                subtitle:'AddPersonalDataMessage'.tr() ,
                              ),

                              const AppSizeBox(height: AppSize.s20),

                              SizedBox(
                                height: AppSize.s90,
                                width: AppSize.s90,
                                child: Stack(
                                  children: [
                                    Container(
                                        height: AppSize.s90,
                                        width: AppSize.s90,
                                        decoration:   BoxDecoration(
                                          shape: BoxShape.circle,
                                          image:  _fillData.imagePicker!=null?DecorationImage(
                                            image: FileImage(File( _fillData.imagePicker!.path)),
                                            fit: BoxFit.cover,
                                          ):DecorationImage(
                                            image: AssetImage(ImageManager.placeHolder),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        // child:
                                        // // imagePicker!=null?
                                        // // Image.file(File(imagePicker!.path),fit: BoxFit.fill,):
                                        // _fillData.imagePicker!=null?
                                        // Image.file(File( _fillData.imagePicker!.path),fit:BoxFit.cover,):
                                        // (
                                        //     // Constants.userDataModel!.image.isNotEmpty?
                                        //     // // CircleAvatar(
                                        //     // //     backgroundColor: ColorManager.white,
                                        //     // //     backgroundImage: NetworkImage(Constants.userDataModel!.image)
                                        //     // //
                                        //     // // )
                                        //     // CachedImage(
                                        //     //   height: AppSize.s90,
                                        //     //   width: AppSize.s90,
                                        //     //   url: Constants.userDataModel!.image,
                                        //     //   fit: BoxFit.fill,
                                        //     //   boxShape: BoxShape.circle,
                                        //     // )
                                        //     //     :
                                        //     CircleAvatar(
                                        //         backgroundColor: ColorManager.white,
                                        //         backgroundImage: const AssetImage(ImageManager.placeHolder)
                                        //
                                        //     ))
                                      // ClipPath(
                                      //   clipBehavior: Clip.hardEdge,
                                      //     child: Image.asset(ImageManager.staff,fit: BoxFit.fill,)),
                                    ),
                                    Align(
                                      alignment: Constants.isArabic?Alignment.bottomRight:Alignment.bottomLeft,
                                      child: InkWell(
                                        onTap: ()=>Utils().uploadModalBottomSheet(context: context,
                                          onGalleryTap: (photo){
                                            // context.read<AuthProvider>().changeImageProfile(context: context, photo: photo);
                                            setState(()=> _fillData.imagePicker=photo);
                                          },
                                          onCameraTap: (photo){
                                            // context.read<AuthProvider>().changeImageProfile(context: context, photo: photo);
                                            setState(()=> _fillData.imagePicker=photo);
                                          },),
                                        child: CircleAvatar(
                                          radius: 16,
                                          backgroundColor: ColorManager.primary,
                                          child:  Icon(Icons.edit,
                                              size: AppSize.s20,
                                              color: ColorManager.white),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              const AppSizeBox(height: AppSize.s25),

                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: DefaultTextFormField(
                                      controller: _fillData.firstNameController,
                                      hintTitle: 'firstName'.tr(),
                                      labelTitle: 'firstName'.tr(),
                                      textInputAction: TextInputAction.next,
                                      textInputType: TextInputType.text,
                                      hintFontSize: FontSize.s12,
                                      hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                      textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                      textSize: FontSize.s12,
                                      fillColor: ColorManager.textGrey,
                                      borderColor: ColorManager.textGrey,
                                      // borderRadius: RadiusManager.r10,
                                      // prefixIcon: const Icon(Icons.email_outlined,color: ColorManager.icons,size: AppSize.s20,),
                                      validator: (v) => Validator().validateEmpty(value: v.toString(),),
                                    ),
                                  ),
                                  const AppSizeBox(width: AppSize.s10),
                                  Expanded(
                                    flex: 1,
                                    child: DefaultTextFormField(
                                      controller: _fillData.lastNameController,
                                      hintTitle: 'lastName'.tr(),
                                      labelTitle: 'lastName'.tr(),
                                      textInputAction: TextInputAction.next,
                                      textInputType: TextInputType.text,
                                      hintFontSize: FontSize.s12,
                                      hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                      textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                      textSize: FontSize.s12,
                                      fillColor: ColorManager.textGrey,
                                      borderColor: ColorManager.textGrey,
                                      // borderRadius: RadiusManager.r10,
                                      // prefixIcon: const Icon(Icons.email_outlined,color: ColorManager.icons,size: AppSize.s20,),
                                      validator: (v) => Validator().validateEmpty(value: v.toString(),),
                                    ),
                                  ),



                                ],
                              ),


                              const AppSizeBox(height: AppSize.s8),

                              DefaultTextFormField(
                                controller: _fillData.phoneController,
                                hintTitle: 'MobileNumber'.tr(),
                                labelTitle: 'MobileNumber'.tr(),
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.phone,
                                hintFontSize: FontSize.s12,
                                hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                textSize: FontSize.s12,
                                fillColor: ColorManager.textGrey,
                                borderColor: ColorManager.textGrey,
                                // borderRadius: RadiusManager.r10,
                                prefixIcon: const Icon(Icons.phone,color: ColorManager.icons,size: AppSize.s20,),
                                validator: (v) => Validator().validatePhone(value: v.toString(),),
                              ),

                              const AppSizeBox(height: AppSize.s8),

                              if(widget.registerModel.type==UserType.consultant)
                                MoreLineTextFormField(
                                  controller: _fillData.desController,
                                  hintTitle: 'aboutYou'.tr(),
                                  labelTitle: 'aboutYou'.tr(),
                                  textInputType: TextInputType.multiline,
                                  textInputAction: TextInputAction.next,
                                  hintFontSize: FontSize.s12,
                                  hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                  textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                  textSize: FontSize.s12,
                                  fillColor: ColorManager.textGrey,
                                  borderColor: ColorManager.textGrey,
                                  maxLines: 3,
                                  // borderRadius: RadiusManager.r10,
                                  // prefixIcon: const Icon(Icons.phone,color: ColorManager.icons,size: AppSize.s20,),
                                  validator: (v) => Validator().validateEmpty(value: v.toString(),),
                                ),


                              // AppSizeBox(height: ..sh),


                              // MyTextButton(title: 'Continue'.tr(),
                              //   size: Size( .8.sw,  47),
                              //   radius: 8,
                              //   fontWeightType: FontWeightType.bold,
                              //   titleSize: FontSize.s18,
                              //   primaryColor: ColorManager.primary,
                              //   titleColor: ColorManager.white,
                              //   onPressed: ()=>_fillData.follow(context: context),),

                              const AppSizeBox(height: AppSize.s20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}
