part of'add_complaint_imports.dart';


class AddComplaintData {

   final formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController complaintTitleController = TextEditingController();
  TextEditingController complaintDesController = TextEditingController();
late int propertyId;

  late BuildContext ctx;

   AddComplaintData({required int adId,required BuildContext context}){
    ctx=context;
    propertyId=adId;
    nameController.text=Constants.userDataModel!.firstName + ' '+Constants.userDataModel!.lastName;
    emailController.text=Constants.userDataModel!.email;
    phoneController.text=Constants.userDataModel!.phone;



  }

   sentData({required BuildContext context})async{

     FocusScope.of(context).requestFocus( FocusNode());

     if(formKey.currentState!.validate()){
       AddComplaintRequestModel model =AddComplaintRequestModel(
         name: nameController.text.trim(),
         propertyId: propertyId,
         email: emailController.text.trim(),
         phone: phoneController.text.trim(),
         complaintTitle: complaintTitleController.text.trim(),
         complaint: complaintDesController.text.trim(),
       );
         context.read<GeneralProvider>().sentComplaint(context: context, model: model);

     }
   }
}

