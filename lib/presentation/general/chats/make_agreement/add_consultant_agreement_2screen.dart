part of'make_agreement_imports.dart';

class AddAgreementConsultant2Screen extends StatefulWidget {
  final int agreementId;
  const AddAgreementConsultant2Screen({Key? key,required this.agreementId}) : super(key: key);

  @override
  State<AddAgreementConsultant2Screen> createState() => _AddAgreementConsultant2ScreenState();
}

class _AddAgreementConsultant2ScreenState extends State<AddAgreementConsultant2Screen> {
 ConsultantModel? selectedConsultant;
 TextEditingController searchController = TextEditingController();
 TextEditingController consultPercentage = TextEditingController();
 TextEditingController yourPercentage = TextEditingController();
 final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    context.read<ConsultantProvider>().getAgreementConsultants(notify: false,context: context,agreementId: widget.agreementId);
    // context.read<ConsultantProvider>().getConsultants(notify: false,context: context,opportunityId: widget.opportunity.id);
  }



  @override
  void dispose() {
    searchController.dispose();
    consultPercentage.dispose();
    yourPercentage.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(title: 'AddConsultantToAgreement'.tr(),showChatNotify: false,showDivider: false),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextButton(title: 'Confirm'.tr(),
                size: Size( .8.sw,  47),
                radius: 6,
                fontWeightType: FontWeightType.bold,
                titleSize: FontSize.s18,
                primaryColor: ColorManager.primary,
                titleColor: ColorManager.white,
                onPressed: (){
                  FocusScope.of(context).requestFocus( FocusNode());
                  if(!formKey.currentState!.validate())return;
                  if(selectedConsultant!=null) {

                    AddConsultantAgreementModel model=AddConsultantAgreementModel(
                      agreementId: widget.agreementId,
                        firstUserPercentage: yourPercentage.text,
                      secondUserPercentage: consultPercentage.text,
                      firstUserId: Constants.userDataModel!.id,
                      secondUserId: selectedConsultant!.id,
                    );
                    context.read<ChatAgreementDataProvider>().addConsultantEstateAgreement(context: context,model: model);
                  }
                  else{
                    LoadingDialog.showToastNotification('PleaseEnterAllDataCorrectly'.tr());
                  }
                }),
          ],
        ),
      ),


      body: InkWell(
        splashColor:ColorManager.white,
        focusColor: ColorManager.white,
        onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
        child: Consumer<ChatAgreementDataProvider>(
          builder: (context, agreementsProvider, child) => Consumer<ConsultantProvider>(
            builder: (context, provider, child) => ScreenLoading(
              isLoading: provider.isLoading||agreementsProvider.isLoading,
              height: 1.0.sh,
              width: 1.0.sw,
              child:  (provider.isLoading||agreementsProvider.isLoading)&&provider.filterConsultants.isEmpty?AppSizeBox(width: 0,):
              Container(
                height: 1.0.sh,
                width: 1.0.sw,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: CustomScrollView(
                  // shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  slivers: [

                    SliverList(
                      delegate: SliverChildListDelegate([

                        AppSizeBox(height: 20,),
                        DefaultTextFormField(
                          controller: searchController,
                          hintTitle: 'search'.tr(),
                          labelTitle: 'search'.tr(),
                          textInputAction: TextInputAction.search,
                          textInputType: TextInputType.text,
                          hintFontSize: FontSize.s12,
                          hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                          textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                          textSize: FontSize.s12,
                          fillColor: ColorManager.textGrey,
                          borderColor: ColorManager.textGrey,
                          borderRadius: RadiusManager.r10,
                          prefixIcon: const Icon(Icons.search,color: ColorManager.icons,size: AppSize.s20,),
                          validator: (v) {},
                          onChanged: (v) {
                            provider.searchConsultants(name: v);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Form(
                            key: formKey,
                            child: SizedBox(
                              width: 1.0.sw,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: DefaultTextFormField(
                                      controller: yourPercentage,
                                      hintTitle: 'YourPercentage1'.tr(),
                                      labelTitle: 'YourPercentage1'.tr(),
                                      textInputAction: TextInputAction.search,
                                      textInputType: TextInputType.number,
                                      hintFontSize: FontSize.s12,
                                      hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                      textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                      textSize: FontSize.s12,
                                      fillColor: ColorManager.textGrey,
                                      borderColor: ColorManager.textGrey,
                                      borderRadius: RadiusManager.r10,
                                      // prefixIcon: const Icon(Icons.search,color: ColorManager.icons,size: AppSize.s20,),
                                    validator: (v) => Validator().validatePrice(value: v.toString(),),
                                    ),
                                  ),
                                  AppSizeBox(width: 10,),
                                  Expanded(
                                    child: DefaultTextFormField(
                                      controller: consultPercentage,
                                      hintTitle: 'AdvisorPercentage'.tr(),
                                      labelTitle: 'AdvisorPercentage'.tr(),
                                      textInputAction: TextInputAction.search,
                                      textInputType: TextInputType.number,
                                      hintFontSize: FontSize.s12,
                                      hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                      textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                      textSize: FontSize.s12,
                                      fillColor: ColorManager.textGrey,
                                      borderColor: ColorManager.textGrey,
                                      borderRadius: RadiusManager.r10,
                                      // prefixIcon: const Icon(Icons.search,color: ColorManager.icons,size: AppSize.s20,),
                                    validator: (v) => Validator().validatePrice(value: v.toString(),),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),


                        // if(widget.opportunity.consults.isNotEmpty&&widget.opportunity.consults.
                        // where ((element) => element.id==Constants.userDataModel!.id).isNotEmpty)
                        // for(var item in widget.opportunity.consults.
                        // firstWhere((element) => element.id==Constants.userDataModel!.id).subConsults)
                        //   Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       AppText(
                        //               title:item.name,
                        //               titleAlign: TextAlign.start,
                        //               titleHeight: 1.3,
                        //               titleMaxLines: 2,fontWeightType: FontWeightType.regular,
                        //               titleSize: FontSize.s14,titleColor: ColorManager.black),
                        //
                        //       AppText(
                        //           title:item.rate +' % ' ,
                        //           titleAlign: TextAlign.start,
                        //           titleHeight: 1.3,
                        //           titleMaxLines: 2,fontWeightType: FontWeightType.regular,
                        //           titleSize: FontSize.s14,titleColor: ColorManager.reject),
                        //     ],
                        //   ),
                        // if(provider.filterConsultants.isEmpty)
                        //   Padding(
                        //       padding: EdgeInsets.only(top: .25.sh),
                        //       child:Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           NoDataCurrentlyAvailable(),
                        //         ],
                        //       )
                        //   ),


                      ]),
                    ),
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {

                            return AgreementConsultantWidget(
                              consultant: provider.filterConsultants[index],
                              isSelected: selectedConsultant==provider.filterConsultants[index],
                              onSelected: (){
                                setState(() {
                                  selectedConsultant=provider.filterConsultants[index];
                                });
                              },);
                          },
                          childCount:provider.filterConsultants.length,
                        ))






                  ],
                ),



              ),
            ),
          ),
        ),
      ),


    );
  }


}
