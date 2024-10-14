part of'make_agreement_imports.dart';


class MakeAgreementScreen extends StatefulWidget {
  final ChatAgreementModel? previousAgreement;
  final int receiverId;
  final int? agreementId;
  final String receiverName,receiverImage;
  final  List<AgreementDetailsConsultModel> previousConsults;
  final MakeAgreementActon makeAgreementAction;
  const MakeAgreementScreen({super.key,required this.receiverName,
    required this.receiverImage,required this.receiverId, this.agreementId,
    required this.makeAgreementAction,this.previousAgreement,required this.previousConsults}) ;

  @override
  State<MakeAgreementScreen> createState() => _MakeAgreementScreenState();
}

class _MakeAgreementScreenState extends State<MakeAgreementScreen> {

   late MakeAgreementData _agreementData;
   bool enableText =false;
  @override
  void initState() {
    super.initState();
    context.read<ChatAgreementDataProvider>().isLoading=false;
    context.read<ChatAgreementDataProvider>().isLoadingAgreement=false;
    _agreementData=MakeAgreementData(
        agreementCreateId:widget.previousAgreement!=null?widget.previousAgreement!.agreementCreateId: Constants.userDataModel!.id,
        receiverId: widget.receiverId,receiverName: widget.receiverName,
        receiverImage: widget.receiverImage,);
    enableText=widget.makeAgreementAction==MakeAgreementActon.create||widget.makeAgreementAction==MakeAgreementActon.edit;
    if(widget.previousAgreement!=null){
      _agreementData.titleController.text=widget.previousAgreement!.agreementTitle;
      _agreementData.totalCommissionController.text=widget.previousAgreement!.totalCommission.toString();
      _agreementData.firstPersonController.text=widget.previousAgreement!.firstPersonPercentage.toString();
      _agreementData.secondPersonController.text=widget.previousAgreement!.secondPersonPercentage.toString();
      _agreementData.detailsController.text=widget.previousAgreement!.agreementDetails;
      _agreementData.rejectRasonController.text=widget.previousAgreement!.refusedReason;
      _agreementData.addPercentage.value=widget.previousAgreement!.firstPersonPercentage!=0;
      _agreementData.addTotalAmount.value=widget.previousAgreement!.totalCommission!=0;
    }




  }

  @override
  void dispose() {
    super.dispose();
    _agreementData.totalCommissionController.dispose();
    _agreementData.firstPersonController.dispose();
    _agreementData.secondPersonController.dispose();
    _agreementData.detailsController.dispose();
    _agreementData.titleController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GeneralAppBar(title:widget.makeAgreementAction==MakeAgreementActon.create?'Make agreement'.tr():'agreement'.tr(),
            showChatNotify: false),

        body:Consumer<ChatAgreementDataProvider>(
          builder: (context, provider, child) => ScreenLoading(
              isLoading: provider.isLoadingAgreement,
              height: 1.0.sh,
              width: 1.0.sw,
              child:  Container(
                height: 1.0.sh,
                width: 1.0.sw,
                margin:returnPadding(),
                child:  Form(
                  key: _agreementData.formKey,
                  child:  SizedBox(
                    child:SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [


                          const AppSizeBox(height: AppSize.s30),
                      DefaultTextFormField(
                        controller: _agreementData.titleController,
                        hintTitle: 'Agreement title'.tr(),
                        labelTitle: 'Agreement title'.tr(),
                        enabled:enableText,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text,
                        hintFontSize: FontSize.s12,
                        hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                        textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                        textSize: FontSize.s12,
                        fillColor: ColorManager.textGrey,
                        borderColor: ColorManager.textGrey,
                        validator: (v) => Validator().validateEmpty(value: v.toString(),),
                      ),
                          const AppSizeBox(height: AppSize.s10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             Flexible(child:  AppText(
                                 title: 'agreementTitleHint'.tr(),
                                 titleAlign: TextAlign.center,
                                 titleHeight: 1.3,
                                 titleMaxLines: 2,fontWeightType: FontWeightType.regular,
                                 titleSize: FontSize.s12,titleColor: ColorManager.black),)

                            ],
                          ),


                          const AppSizeBox(height: AppSize.s20),
                          ValueListenableBuilder(valueListenable: _agreementData.addTotalAmount,
                            builder: (context, value, child) =>  Column(
                              children: [

                                if(enableText)
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children:[
                                        CheckBoxWidget(
                                          checkBoxValue: value,
                                          title: 'Specify an amount'.tr(),
                                          checkBoxFunction: (v)=>_agreementData.addTotalAmount.value=v!,
                                        ),


                                      ]
                                  ),
                                if(value&&enableText) const AppSizeBox(height: AppSize.s10),
                                if(value)
                                  DefaultTextFormField(
                                    controller: _agreementData.totalCommissionController,
                                    hintTitle: 'Total amount'.tr(),
                                    labelTitle: 'Total amount'.tr(),
                                    enabled:enableText,
                                    textInputAction: TextInputAction.next,
                                    textInputType: TextInputType.number,
                                    hintFontSize: FontSize.s12,
                                    hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                    textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                    textSize: FontSize.s12,
                                    fillColor: ColorManager.textGrey,
                                    borderColor: ColorManager.textGrey,
                                    validator: (v) => Validator().validatePrice(value: v.toString(),),
                                  ),


                              ],
                            ),),

                          const AppSizeBox(height: AppSize.s20),
                         ValueListenableBuilder(valueListenable: _agreementData.addPercentage,
                             builder: (context, value, child) =>  Column(
                               children: [

                                 if(enableText)
                                   Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children:[
                                         CheckBoxWidget(
                                           checkBoxValue: value,
                                           title: 'Add percentage'.tr(),
                                           checkBoxFunction: (v)=>_agreementData.addPercentage.value=v!,
                                         ),


                                       ]
                                   ),
                                 if(value&&enableText) const AppSizeBox(height: AppSize.s20),

                                 if(value)
                                 Row(
                                   children: [
                                     Expanded(
                                       flex: 1,
                                       child: DefaultTextFormField(
                                         controller: _agreementData.firstPersonController,
                                         hintTitle: 'First party percentage'.tr(),
                                         labelTitle: 'First party percentage'.tr(),
                                         enabled:enableText,
                                         textInputAction: TextInputAction.next,
                                         textInputType: TextInputType.number,
                                         hintFontSize: FontSize.s12,
                                         hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                         textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                         textSize: FontSize.s12,
                                         fillColor: ColorManager.textGrey,
                                         borderColor: ColorManager.textGrey,
                                         validator: (v) => Validator().validatePrice(value: v.toString(),),
                                       ),
                                     ),
                                     const AppSizeBox(width: AppSize.s10),
                                     Expanded(
                                       flex: 1,
                                       child: DefaultTextFormField(
                                         controller: _agreementData.secondPersonController,
                                         hintTitle: 'Second party percentage'.tr(),
                                         labelTitle: 'Second party percentage'.tr(),
                                         enabled:enableText,
                                         textInputAction: TextInputAction.next,
                                         textInputType: TextInputType.number,
                                         hintFontSize: FontSize.s12,
                                         hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                         textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                         textSize: FontSize.s12,
                                         fillColor: ColorManager.textGrey,
                                         borderColor: ColorManager.textGrey,
                                         validator: (v) => Validator().validatePrice(value: v.toString(),),
                                       ),
                                     ),



                                   ],
                                 ),

                               ],
                             ),),







                          if((widget.makeAgreementAction==MakeAgreementActon.refuseOrAccept||
                              widget.makeAgreementAction==MakeAgreementActon.edit)
                          // &&_agreementData.agreementCreateId==Constants.userDataModel!.id
                              && _agreementData.rejectRasonController.text.isNotEmpty)Column(
                            children: [

                              const AppSizeBox(height: AppSize.s20),

                              DefaultTextFormField(
                                controller: _agreementData.rejectRasonController,
                                hintTitle: 'reason of refuse'.tr(),
                                labelTitle: 'reason of refuse'.tr(),
                                enabled: false,
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.text,
                                hintFontSize: FontSize.s12,
                                hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                textSize: FontSize.s12,
                                // maxLength: 4,
                                fillColor: ColorManager.textGrey,
                                borderColor: ColorManager.textGrey,
                                validator: (v){},
                              ),
                            ],
                          ),

                          const AppSizeBox(height: AppSize.s20),


                            MoreLineTextFormField(
                              controller: _agreementData.detailsController,
                              hintTitle: 'Contract details'.tr(),
                              labelTitle: 'Contract details'.tr(),
                                enabled:enableText,
                              textInputType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                              hintFontSize: FontSize.s12,
                              hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                              textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                              textSize: FontSize.s12,
                              fillColor: ColorManager.textGrey,
                              borderColor: ColorManager.textGrey,
                              maxLines: 14,
                              // borderRadius: RadiusManager.r10,
                              // prefixIcon: const Icon(Icons.phone,color: ColorManager.icons,size: AppSize.s20,),
                              validator: (v) => Validator().validateEmpty(value: v.toString(),),
                            ),


                          if(widget.previousConsults.isNotEmpty&&
                              widget.makeAgreementAction==MakeAgreementActon.addConsultant&&widget.agreementId!=null)
                            PreviousConsultsWidget(previousConsults: widget.previousConsults),

                          const AppSizeBox(height: AppSize.s30),

                          if(widget.makeAgreementAction==MakeAgreementActon.create)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyTextButton(title: 'send'.tr(),
                                  size: Size( .7.sw,  47),
                                  radius: 8,
                                  fontWeightType: FontWeightType.medium,
                                  titleSize: FontSize.s14,
                                  primaryColor: ColorManager.primary,
                                  titleColor: ColorManager.white,
                                  onPressed: ()=>_agreementData.makeAgreementInFireBase(context: context,),
                                ),
                              ],
                            )
                          else if(widget.makeAgreementAction==MakeAgreementActon.addConsultant&&widget.agreementId!=null)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyTextButton(title: 'AddConsultantToAgreement'.tr(),
                                  size: Size( .6.sw,  40),
                                  radius: 8,
                                  fontWeightType: FontWeightType.medium,
                                  titleSize: FontSize.s14,
                                  primaryColor: ColorManager.primary,
                                  titleColor: ColorManager.white,
                                  onPressed: ()=> MyRoute().navigate(context: context,
                                    route: AddAgreementConsultant2Screen(agreementId: widget.agreementId!),)),


                              ],
                            )
                         else if(widget.makeAgreementAction==MakeAgreementActon.refuseOrAccept&&
                            widget.receiverId!=Constants.userDataModel!.id&&widget.previousAgreement!=null&&
                            widget.previousAgreement!.refusedReason.isNotEmpty)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [

                              ],
                            )

                            else if(widget.makeAgreementAction==MakeAgreementActon.refuseOrAccept)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                MyTextButton(title: 'Accept'.tr(),
                                  size: Size( .35.sw,  40),
                                  radius: 8,
                                  fontWeightType: FontWeightType.medium,
                                  titleSize: FontSize.s14,
                                  primaryColor: ColorManager.primary,
                                  titleColor: ColorManager.white,
                                  onPressed: (){
                                    LoadingDialog().optionalAlertDialog(context:context,
                                        message: 'AreYouSureAgreement'.tr(),
                                        btn1Title: 'Yes'.tr(),
                                        btn2Title: 'No'.tr(),
                                        title:'Make agreement'.tr(),
                                        okClick: (){
                                          Navigator.pop(context);
                                          _agreementData.acceptAgreement();
                                        });
                                  }),

                                MyTextButton(title: 'reject'.tr(),
                                  size: Size( .35.sw,  40),
                                  radius: 8,
                                  fontWeightType: FontWeightType.medium,
                                  titleSize: FontSize.s14,
                                  primaryColor: ColorManager.redShade700,
                                  titleColor: ColorManager.white,
                                  onPressed: (){
                                    LoadingDialog().widgetAlertDialog(context: context, widget: RejectReasonAgreementWidget(makeAgreementData: _agreementData,));
                                  }),
                              ],
                            )
                          else if(widget.makeAgreementAction==MakeAgreementActon.edit)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                MyTextButton(title: 'sendChanges'.tr(),
                                  size: Size( .4.sw,  40),
                                  radius: 8,
                                  fontWeightType: FontWeightType.medium,
                                  titleSize: FontSize.s14,
                                  primaryColor: ColorManager.primary,
                                  titleColor: ColorManager.white,
                                  onPressed: ()=>_agreementData.makeAgreementInFireBase(context: context,editAgreement: true),),

                                MyTextButton(title: 'CancelAgreement'.tr(),
                                  size: Size( .4.sw,  40),
                                  radius: 8,
                                  fontWeightType: FontWeightType.medium,
                                  titleSize: FontSize.s14,
                                  primaryColor: ColorManager.redShade700,
                                  titleColor: ColorManager.white,
                                  onPressed: ()=>_agreementData.cancelAgreementInFireBase(context: context,)),
                              ],
                            )


                          else const AppSizeBox(height: AppSize.s0),

                          const AppSizeBox(height: AppSize.s20),
                        ],
                      ),
                    ),
                  ),
                ),
              )
          )
        ),

    );
  }
}
