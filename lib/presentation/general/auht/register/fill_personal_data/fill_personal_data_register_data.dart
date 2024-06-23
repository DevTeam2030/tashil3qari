

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../../app/enums.dart';
import '../../../../../app/utils.dart';
import '../../../../../components/loading_manager.dart';
import '../../../../../domain/model/models/auth/register_model.dart';
import '../../../../../domain/model/models/register_request_body.dart';
import '../../../../../domain/model/models/searial_number_model.dart';
import '../../../../../providers/auth_provider.dart';
import '../../../../../utilites/route_manager.dart';
import '../../otp/otp_imports.dart';
import '../register_data.dart';

class FillPersonalDataRegisterData{
late  RegisterModel registerModel;

  FillPersonalDataRegisterData({required this.registerModel});

  final formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController desController = TextEditingController();



  XFile? imagePicker;




  follow({required BuildContext context,})async{


    FocusScope.of(context).requestFocus( FocusNode());
    // // MyRoute().navigate(context: context, route: OtpScreen(fillPersonalDataRegisterData: this,));
    // return;
    if(formKey.currentState!.validate()){
      if(imagePicker==null){
        LoadingDialog.showToastNotification('PleaseEnterPicture'.tr());
        return;
      }

      // MyRoute().navigate(context: context, route: OtpScreen(fillPersonalDataRegisterData: this,
      UpdatePhoneRequestModel updatePhoneRequestModel =UpdatePhoneRequestModel(
    id: registerModel.id,
    image: File(imagePicker!.path),
    phone: phoneController.text.trim(),
    firstName: firstNameController.text.trim(),
    lastName: lastNameController.text.trim(),
        des:registerModel.type==UserType.consultant ?desController.text.trim():'',
      );
      RegisterModel?  model=await  context.read<AuthProvider>().updateRegisterPhone(context: context,
          model: updatePhoneRequestModel);
      if(model!=null) {
        MyRoute().navigate(context: context, route: OtpScreen(registerModel: model,emailToVerify: model.email,),withReplace: true);
      }
  }
}

  visitor({required BuildContext context}){

  }
}
