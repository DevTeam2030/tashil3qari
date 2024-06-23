part of'add_ad_imports.dart';

class AddAdBidScreen extends StatefulWidget {
  final int propertyId;
  final bool isPropertyFeatured;
  const AddAdBidScreen({Key? key,required this.propertyId,required this.isPropertyFeatured}) : super(key: key);


  @override
  State<AddAdBidScreen> createState() => _AddAdBidScreenState();
}

class _AddAdBidScreenState extends State<AddAdBidScreen> {



 final formKey = GlobalKey<FormState>();
 TextEditingController priceController = TextEditingController();
 TextEditingController notesController = TextEditingController();

 List<AuctionDurationsModel> durations=[];
 late AuctionDurationsModel selectedDuration;
  @override
  void initState() {
    super.initState();

    durations=Constants.settingModel.auctionDurations;
    selectedDuration=Constants.settingModel.auctionDurations.first;
  }


  @override
  void dispose() {
    priceController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: GeneralAppBar(title: 'Details of bidding on advertisement'.tr(),showChatNotify: false,showDivider: false),

      body: Consumer<AddPropertyProvider>(
        builder: (context, provider, child) => ScreenLoading(
          isLoading: provider.isLoading,
          height: 1.0.sh,
          width: 1.0.sw,
          child:   Container(
              height: 1.0.sh,
              width: 1.0.sw,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child:SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const AppSizeBox(height: 30,),
                      Container(
                        width: 1.0.sw,
                          padding:const EdgeInsets.only(top:18.0),
                          child: AppText(
                              title: 'addToAuctionMessage'.tr() ,
                              titleAlign: TextAlign.center,
                              titleMaxLines: 4,fontWeightType: FontWeightType.bold,
                              titleSize: FontSize.s12,
                              titleHeight: 1.6,
                              titleColor: ColorManager.icons3)),
                      const AppSizeBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                              title: 'bidingDuration'.tr(),
                              titleAlign: TextAlign.start,
                              titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
                              titleSize: FontSize.s16,
                              titleColor:ColorManager.black),


                        ],
                      ),
                      const AppSizeBox(height: 14,),
                      SizedBox(
                          height: 35,
                          width: 1.0.sw,
                          child: ListView.builder(
                            itemCount: durations.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>  InkWell(
                              onTap: () =>setState(()=>selectedDuration=durations[index]),
                              child: Container(
                                height: 35,
                                width: .29.sw,
                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                // padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 12),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(RadiusManager.r4),
                                    color: selectedDuration==durations[index]?ColorManager.primary:ColorManager.white,
                                    border: Border.all(color: ColorManager.textGrey,width: 1.6)
                                  // boxShadow: Constants.kBoxShadow
                                ),
                                child: AppText(
                                    title: durations[index].name ,
                                    titleAlign: TextAlign.center,
                                    titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                                    titleSize: FontSize.s12,
                                    titleColor: selectedDuration==durations[index]?ColorManager.white:ColorManager.black),
                              ),
                            ),)
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical:18.0),
                        child: Divider(
                          height: 2,
                          thickness: 1.2,
                          color: ColorManager.divider,
                        ),
                      ),

                      Row(
                        children: [
                          AppText(
                              title:'Please enter bid value'.tr(),
                              titleAlign: TextAlign.start,
                              titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
                              titleSize: FontSize.s14,
                              titleColor:ColorManager.black
                          ),
                          const AppSizeBox(width: 10,),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Constants.isArabic?const Radius.circular(0):const Radius.circular(10),
                                  bottomLeft: Constants.isArabic?const Radius.circular(0):const Radius.circular(10),
                                  topRight: Constants.isArabic?const Radius.circular(10):const Radius.circular(0),
                                  bottomRight: Constants.isArabic?const Radius.circular(10):const Radius.circular(0),
                                ),
                                border: Border.all(color: ColorManager.black,width: 1)
                            ),
                            child: Icon(Icons.add,color: ColorManager.black,size: 20,),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: 30,
                              child: DefaultTextFormField(
                                controller: priceController,
                                hintTitle: 'Bid value'.tr(),
                                labelTitle: 'Bid value'.tr(),
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.number,
                                hintFontSize: FontSize.s12,
                                hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                textSize: FontSize.s12,
                                fillColor: ColorManager.white,
                                borderColor: ColorManager.black,
                                borderRadius: 0,
                                validator: (v) => Validator().validatePrice(value: v.toString(),),
                              ),
                            ),
                          ),

                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Constants.isArabic?const Radius.circular(10):const Radius.circular(0),
                                  bottomLeft: Constants.isArabic?const Radius.circular(10):const Radius.circular(0),
                                  topRight: Constants.isArabic?const Radius.circular(0):const Radius.circular(10),
                                  bottomRight: Constants.isArabic?const Radius.circular(0):const Radius.circular(10),
                                ),
                                border: Border.all(color: ColorManager.black,width: 1)
                            ),
                            child: Icon(Icons.remove,color: ColorManager.black,size: 20,),
                          ),
                          const AppSizeBox(width: 4,),
                          AppText(
                              title: 'SR'.tr(),
                              titleAlign: TextAlign.center,
                              titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                              titleSize: FontSize.s12,
                              titleColor: ColorManager.icons3)
                        ],
                      ),
                      // Padding(
                      //     padding:const EdgeInsets.only(top:18.0),
                      //     child: AppText(
                      //         title: 'currencyMessage'.tr() ,
                      //         titleAlign: TextAlign.center,
                      //         titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                      //         titleSize: FontSize.s12,
                      //         titleColor: ColorManager.icons3)),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical:18.0),
                        child: Divider(
                          height: 2,
                          thickness: 1.2,
                          color: ColorManager.divider,
                        ),
                      ),


                      Row(
                        children: [
                          AppText(
                              title:'comments'.tr() ,
                              titleAlign: TextAlign.start,
                              titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
                              titleSize: FontSize.s16,
                              titleColor:ColorManager.black),
                        ],
                      ),

                      const AppSizeBox(height: AppSize.s14,),
                      MoreLineTextFormField(
                        controller: notesController,
                        hintTitle: 'comments'.tr(),
                        labelTitle: 'comments'.tr(),
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.multiline,
                        hintFontSize: FontSize.s12,
                        hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                        textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                        textSize: FontSize.s12,
                        fillColor: ColorManager.white,
                        borderColor: ColorManager.textField,
                        borderRadius: RadiusManager.r10,
                        maxLines: 3,
                        validator: (v) => Validator().validateEmpty(value: v.toString(),),
                      ),




                      const AppSizeBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyTextButton(title: 'Confirm'.tr(),
                              size: Size( .8.sw,  47),
                              radius: 8,
                              fontWeightType: FontWeightType.bold,
                              titleSize: FontSize.s18,
                              primaryColor: ColorManager.primary,
                              titleColor: ColorManager.white,
                              onPressed: (){
                                if(formKey.currentState!.validate()) {
                                  MakeAuctionModel model=MakeAuctionModel(
                                    propertyId: widget.propertyId,
                                    auctionDurationId: selectedDuration.id,
                                    minimumAuction: priceController.text,
                                    auctionNotes: notesController.text,
                                  );
                                  context.read<AddPropertyProvider>().makeAuction(context: context, model: model,isPropertyFeatured: widget.isPropertyFeatured);
                                }
                                return;

                                //     LoadingDialog().widgetAlertDialog(context:context,
                                //         widget:  AdSuccesWidget(title: 'requirementsMessage'.tr(),
                                //           message: 'requirementsMessage3'.tr(),));
                              }),
                        ],
                      ),
                      const AppSizeBox(height: 20,),








                    ],
                  ),
                ),
              )


          ),
        ),
      ),

    );
  }
}
