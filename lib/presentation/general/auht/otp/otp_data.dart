part of'otp_imports.dart';

class OtPData{
  TextEditingController codeController=TextEditingController();
  late  StreamController<ErrorAnimationType>? errorController;
  var formKey=GlobalKey<FormState>();
  bool hasError=false;
  bool countDown =true;
  String signature = "{{ app signature }}";
  String otpCode="";





  validateFromRegister({required BuildContext context,required RegisterModel registerModel})async{
       if(formKey.currentState!.validate()&&otpCode.length==6){

         RegisterModel?  model=await  context.read<AuthProvider>().activateAccount(context: context,
         code: codeController.text.trim(),email: registerModel.email);

         // if(!user.isCompletedAddress){
         //   MyRoute().navigate(context: context, route: AddLocationRegisterScreen(
         //     registerModel: RegisterModel(
         //       id: user.id,
         //       email: user.email,
         //       type: user.type,
         //       phone: user.phone,
         //     ),));
         //   return;
         // }
         if(model!=null) {
           MyRoute().navigate(context: context, route: AddLocationRegisterScreen(registerModel: model,));
         }



       }


  }


  sendVerificationCode({required BuildContext context,required RegisterModel registerModel})async{
   await  context.read<AuthProvider>().sendVerificationCode(context: context, email: registerModel.email);



  }
}