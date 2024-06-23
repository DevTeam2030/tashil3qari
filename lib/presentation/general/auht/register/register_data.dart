import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/contants.dart';
import '../../../../../utilites/route_manager.dart';
import '../../../../app/enums.dart';
import '../../../../components/loading_manager.dart';
import '../../../../domain/model/models/auth/register_model.dart';
import '../../../../domain/model/models/register_request_body.dart';
import '../../../../domain/model/models/searial_number_model.dart';
import '../../../../providers/auth_provider.dart';
import 'fill_personal_data/fill_personal_data_register_screen.dart';

class RegisterData{
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController licenseNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  ValueNotifier<SerialNumberModel?> selectedSerialNumber = ValueNotifier<SerialNumberModel?>(null);
  UserType userType=UserType.user;


  register({required BuildContext context})async{
    // MyRoute().navigate(context: context, route: FillPersonalDataRegisterScreen(registerData: this,));
    // return;
    FocusScope.of(context).requestFocus( FocusNode());


    if(formKey.currentState!.validate()){
     if(userType==UserType.consultant){
       if(selectedSerialNumber.value==null||selectedSerialNumber.value!.booked){
         LoadingDialog.showToastNotification('ChooseSerialNumberMessge'.tr());
         return;
       }
     }
      // MyRoute().navigate(context: context, route: FillPersonalDataRegisterScreen(registerData: this,));
      RegisterRequestModel registerRequestBodyModel =RegisterRequestModel(
        password:passwordController.text.trim() ,
        passwordConfirmation:confirmPasswordController.text.trim() ,
        lang: Constants.langCode,
        email: emailController.text.trim(),
        userType: userType,
        idNumber: idNumberController.text,
        licenseNumber:userType==UserType.consultant? licenseNumberController.text:'',
        serialNumber:userType==UserType.consultant? selectedSerialNumber.value!.serialNumber:'',
        nationality: nationalityController.text,
        registrationType: RegisterType.email,

      );
      RegisterModel?  model=await  context.read<AuthProvider>().register(context: context,
       model: registerRequestBodyModel);

if(model!=null){
 
  model.type=userType;
  nationalityController.clear();
  idNumberController.clear();
  emailController.clear();
  passwordController.clear();
  confirmPasswordController.clear();
  // ignore: use_build_context_synchronously
  MyRoute().navigate(context: context, route: FillPersonalDataRegisterScreen(registerModel: model,),);
    }
  }
}
  visitor({required BuildContext context}){

  }
}