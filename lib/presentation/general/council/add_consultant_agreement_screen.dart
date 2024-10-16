part of 'council_imports.dart';

class AddAgreementConsultantScreen extends StatefulWidget {
  final PostModel opportunity;
  const AddAgreementConsultantScreen({Key? key,required this.opportunity}) : super(key: key);

  @override
  State<AddAgreementConsultantScreen> createState() => _AddAgreementConsultantScreenState();
}

class _AddAgreementConsultantScreenState extends State<AddAgreementConsultantScreen> {
 ConsultantModel? selectedConsultant;
 TextEditingController searchController = TextEditingController();
 TextEditingController consultPercentage = TextEditingController();
 TextEditingController yourPercentage = TextEditingController();
 final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    context.read<ConsultantProvider>().getConsultants(notify: false,context: context,opportunityId: widget.opportunity.id);
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
                    AddConsultantAgreementRequestModel model=AddConsultantAgreementRequestModel(
                      mainConsultantId: Constants.userDataModel!.id,
                      subConsultantId: selectedConsultant!.id,
                      realEstateOpportunityId: widget.opportunity.id,
                      mainConsultantRate: double.parse(yourPercentage.text),
                      subConsultantRate: double.parse(consultPercentage.text),
                    );
                    // context.read<AgreementsProvider>().addConsultantAgreement(context: context,model: model);
                  }
                  else{
                    LoadingDialog.showSimpleToast('PleaseEnterAllDataCorrectly'.tr());
                  }
                }),
          ],
        ),
      ),

      body: InkWell(
        splashColor:ColorManager.white,
        focusColor: ColorManager.white,
        onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
        child: Consumer<AgreementsProvider>(
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


                        // Padding(
                        //   padding: const EdgeInsets.symmetric(vertical: 10),
                        //   child: Row(
                        //     children: [
                        //       Expanded(
                        //         child: DefaultTextFormField(
                        //           controller: searchController,
                        //           hintTitle: 'search'.tr(),
                        //           labelTitle: 'search'.tr(),
                        //           textInputAction: TextInputAction.search,
                        //           textInputType: TextInputType.text,
                        //           hintFontSize: FontSize.s12,
                        //           hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                        //           textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                        //           textSize: FontSize.s12,
                        //           fillColor: ColorManager.textGrey,
                        //           borderColor: ColorManager.textGrey,
                        //           borderRadius: RadiusManager.r10,
                        //           prefixIcon: const Icon(Icons.search,color: ColorManager.icons,size: AppSize.s20,),
                        //           validator: (v) {},
                        //           onChanged: (v) {
                        //             provider.searchConsultants(name: v);
                        //           },
                        //         ),
                        //       ),
                        //
                        //       const AppSizeBox(width: 10,),
                        //       InkWell(
                        //           onTap: (){
                        //             Utils.showModalBottomSheetApp(widget:ConsultantFilterBottomSheet(
                        //               onSelectedConsultant: (consultant){
                        //                 selectedConsultant=consultant;
                        //                 Navigator.pop(context);
                        //                 searchController.clear();
                        //                 // if(!provider.filterConsultants.contains(consultant))provider.filterConsultants=provider.allConsultants;
                        //                 // addAdtData.addPropertyAndAddConsultant(consultantId: selectedConsultant!.id, context: context);
                        //               },
                        //             ));
                        //           },
                        //           child: Image.asset(ImageManager.filter,height: 30,width: 30,)),
                        //
                        //
                        //
                        //     ],
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                DefaultTextFormField(
                                  controller: yourPercentage,
                                  hintTitle: 'YourPercentage'.tr(),
                                  labelTitle: 'YourPercentage'.tr(),
                                  textInputAction: TextInputAction.search,
                                  textInputType: TextInputType.text,
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
                                AppSizeBox(height: 4,),
                                DefaultTextFormField(
                                  controller: consultPercentage,
                                  hintTitle: 'PleaseEnterAdvisorPercentage'.tr(),
                                  labelTitle: 'PleaseEnterAdvisorPercentage'.tr(),
                                  textInputAction: TextInputAction.search,
                                  textInputType: TextInputType.text,
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
                              ],
                            ),
                          ),
                        ),

                        // Expanded(
                        //   child: AppText(
                        //       title: 'PleaseEnterAdvisorPercentageNote'.tr(),
                        //       titleAlign: TextAlign.start,
                        //       titleHeight: 1.3,
                        //       titleMaxLines: 2,fontWeightType: FontWeightType.regular,
                        //       titleSize: FontSize.s14,titleColor: ColorManager.reject),
                        // ),

                        if(widget.opportunity.consults.isNotEmpty&&widget.opportunity.consults.
                        where ((element) => element.id==Constants.userDataModel!.id).isNotEmpty)
                        for(var item in widget.opportunity.consults.
                        firstWhere((element) => element.id==Constants.userDataModel!.id).subConsults)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                      title:item.name,
                                      titleAlign: TextAlign.start,
                                      titleHeight: 1.3,
                                      titleMaxLines: 2,fontWeightType: FontWeightType.regular,
                                      titleSize: FontSize.s14,titleColor: ColorManager.black),

                              AppText(
                                  title:item.rate +' % ' ,
                                  titleAlign: TextAlign.start,
                                  titleHeight: 1.3,
                                  titleMaxLines: 2,fontWeightType: FontWeightType.regular,
                                  titleSize: FontSize.s14,titleColor: ColorManager.reject),
                            ],
                          ),
                        if(provider.filterConsultants.isEmpty)
                          Padding(
                              padding: EdgeInsets.only(top: .25.sh),
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  NoDataCurrentlyAvailable(),
                                ],
                              )
                          ),


                      ]),
                    ),





                    SliverGrid(
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 2,
                        childAspectRatio: .74,
                      ),
                      delegate: SliverChildBuilderDelegate(
                            (context, index) {
                          return RealEstateConsultantWidget(
                            consultant: provider.filterConsultants[index],
                            isSelected: selectedConsultant==provider.filterConsultants[index],
                            onSelected: (){
                              setState(() {
                                selectedConsultant=provider.filterConsultants[index];
                              });
                            },);
                        },
                        // childCount:widget.cat.subCategories.length,
                        childCount:provider.filterConsultants.length,
                      ),
                    ),


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
