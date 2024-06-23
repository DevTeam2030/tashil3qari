part of'make_agreement_imports.dart';



class MakeAgreementData{

  late int receiverId,agreementCreateId;
  late String receiverName,receiverImage;
MakeAgreementData({required this.agreementCreateId,required this.receiverId,required this.receiverName,
  required this.receiverImage,});

  final formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController totalCommissionController = TextEditingController();
  TextEditingController firstPersonController = TextEditingController();
  TextEditingController secondPersonController = TextEditingController();
  TextEditingController rejectRasonController = TextEditingController();

  ValueNotifier<bool> addTotalAmount= ValueNotifier<bool>(true);
  ValueNotifier<bool> addPercentage = ValueNotifier<bool>(false);


makeAgreementInFireBase({required BuildContext context,bool? editAgreement})async{


    FocusScope.of(context).requestFocus( FocusNode());
    var user=Constants.userDataModel!;
    if(formKey.currentState!.validate()){
     double firstPersonPercentage= addPercentage.value?double.parse(firstPersonController.text):0;
     double secondPersonPercentage= addPercentage.value?double.parse(secondPersonController.text):0;
      if(addPercentage.value&&(firstPersonPercentage+secondPersonPercentage)!=100){
        LoadingDialog.showSimpleToast('Please enter the percentages correctly'.tr());
        return;
      }
      ChatAgreementModel model=ChatAgreementModel(
        agreementCreateId: agreementCreateId,
        firstPersonId: user.id,
        secondPersonId: receiverId,
        agreementTitle: titleController.text,
        agreementDetails: detailsController.text,
        totalCommission: addTotalAmount.value?0:double.parse(totalCommissionController.text),
          firstPersonPercentage: firstPersonPercentage,
        secondPersonPercentage: secondPersonPercentage,
        refusedReason:editAgreement==true?'': rejectRasonController.text.isEmpty?'':rejectRasonController.text,
   );
      ChatAgreementMessageModel messageModel=ChatAgreementMessageModel(
        receiverName: receiverName,
        receiverId: receiverId,
        receiverImage: receiverImage,
          senderId:user.id ,
          senderName: user.firstName + ' ' + user.lastName,
          senderImage:user.image ,
          timestamp: Timestamp.now(),
          messageType: ChatAgreementMessageType.agreement,
          receiverUnreadMessage: 1,
          senderUnreadMessage: 0,
        message: titleController.text,
      );

      context.read<ChatAgreementDataProvider>().makeAgreementInFireBase(context: context,chatAgreementModel: model,messageModel: messageModel);
  }
}
refuseAgreementInFireBase({required refuseReason})async{

BuildContext context=Constants.navigatorAppKey.currentState!.context;
    FocusScope.of(context).requestFocus( FocusNode());
    var user=Constants.userDataModel!;

     double firstPersonPercentage= addPercentage.value?double.parse(firstPersonController.text):0;
     double secondPersonPercentage= addPercentage.value?double.parse(secondPersonController.text):0;
      ChatAgreementModel model=ChatAgreementModel(
        agreementCreateId: agreementCreateId,
        firstPersonId: user.id,
        secondPersonId: receiverId,
        agreementTitle: titleController.text,
        agreementDetails: detailsController.text,
        totalCommission: double.parse(totalCommissionController.text),
          firstPersonPercentage: firstPersonPercentage,
        secondPersonPercentage: secondPersonPercentage,
        refusedReason: refuseReason,
   );
      ChatAgreementMessageModel messageModel=ChatAgreementMessageModel(
        receiverName: receiverName,
        receiverId: receiverId,
        receiverImage: receiverImage,
          senderId:user.id ,
          senderName: '${user.firstName} ${user.lastName}',
          senderImage:user.image ,
          timestamp: Timestamp.now(),
          messageType: ChatAgreementMessageType.agreement,
          receiverUnreadMessage: 1,
          senderUnreadMessage: 0,
        message: 'reject'.tr()+'\n'+titleController.text,
      );

      context.read<ChatAgreementDataProvider>().makeAgreementInFireBase(context: context,chatAgreementModel: model,messageModel: messageModel);

}

  acceptAgreement()async{

BuildContext context=Constants.navigatorAppKey.currentState!.context;
    FocusScope.of(context).requestFocus( FocusNode());
    var user=Constants.userDataModel!;
     double firstPersonPercentage= addPercentage.value?double.parse(firstPersonController.text):0;
     double secondPersonPercentage= addPercentage.value?double.parse(secondPersonController.text):0;
AcceptAgreementModel model=AcceptAgreementModel(
  title: titleController.text,
  description: detailsController.text,
  firstUserId: receiverId,
  firstUserPercentage: firstPersonPercentage.toString(),
  mount: double.parse(totalCommissionController.text),
  secondUserId: user.id,
  secondUserPercentage:secondPersonPercentage.toString() ,
);

      context.read<ChatAgreementDataProvider>().acceptAgreement(context: context,model: model);

}


cancelAgreementInFireBase({required BuildContext context,})async{

  var user=Constants.userDataModel!;
    FocusScope.of(context).requestFocus( FocusNode());
  context.read<ChatAgreementDataProvider>().cancelAgreementInFireBase(userId: user.id,otherId: receiverId,context: context,
  isCancel: true);
}


}
