part of'add_ad_imports.dart';


class AddAdScreen extends StatefulWidget {
  const AddAdScreen({Key? key,}) : super(key: key);

  @override
  State<AddAdScreen> createState() => _AddAdScreenState();
}

class _AddAdScreenState extends State<AddAdScreen> {

  AddAdtData addAdtData=AddAdtData();




  @override
  void initState() {
    super.initState();

    addAdtData.currencies=Constants.settingModel.currencies;
    addAdtData.selectedCurrency=Constants.settingModel.currencies.first;
    addAdtData.finishing= ValueNotifier<FinishingTypesModel>(Constants.settingModel.finishingTypes.first);
    addAdtData.category= ValueNotifier<HomeCatogeryModel>(Constants.settingModel.categories.where((element) => element.id!=0).first);
  }


  @override
  void dispose() {
    addAdtData.priceController.dispose();
    addAdtData.spaceController.dispose();
    addAdtData.titleController.dispose();
    addAdtData.detailsController.dispose();
    addAdtData.lengthController.dispose();
    addAdtData.widthController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(title: 'AddAd'.tr(),showChatNotify: false,showDivider: false),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextButton(title: 'next'.tr(),
                size: Size( .8.sw,  47),
                radius: 6,
                fontWeightType: FontWeightType.bold,
                titleSize: FontSize.s18,
                primaryColor: ColorManager.primary,
                titleColor: ColorManager.white,
                onPressed: (){

              if(addAdtData.formKey.currentState!.validate()) {
                MyRoute().navigate(context: context,
                    route: AddAdImagesScreen(addAdtData: addAdtData,));
              }
              else{
                LoadingDialog.showToastNotification('PleaseEnterAllDataCorrectly'.tr());
              }
                }),
          ],
        ),
      ),
      body:InkWell(
          splashColor:ColorManager.white,
          focusColor: ColorManager.white,
          onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
          child: SizedBox(
        height: 1.0.sh,
        width: 1.0.sw,

       child:SingleChildScrollView(
         child: Column(
           children: [
             ForSaleWidget(addAdtData: addAdtData),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child:    Form(
                key: addAdtData.formKey,
                child: Column(

                  children: [

                    // if(widget.isEditAd)
                    CategoryItem(notifier: addAdtData.category,color: ColorManager.white,   valueColor: ColorManager.grey),


                    const AppSizeBox(height: AppSize.s14,),
                    Row(
                      children: [
                        AppText(
                            title:'adTitle'.tr() ,
                            titleAlign: TextAlign.start,
                            titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
                            titleSize: FontSize.s16,
                            titleColor:ColorManager.black),
                      ],
                    ),

                    const AppSizeBox(height: AppSize.s14,),
                    MoreLineTextFormField(
                      controller: addAdtData.titleController,
                      hintTitle: 'adTitle'.tr(),
                      labelTitle: 'adTitle'.tr(),
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
                    const AppSizeBox(height: AppSize.s14,),

                    Row(
                      children: [
                        AppText(
                            title:'adDetails'.tr() ,
                            titleAlign: TextAlign.start,
                            titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
                            titleSize: FontSize.s16,
                            titleColor:ColorManager.black),
                      ],
                    ),

                    const AppSizeBox(height: AppSize.s14,),
                    MoreLineTextFormField(
                      controller: addAdtData.detailsController,
                      hintTitle: 'adDetails'.tr(),
                      labelTitle: 'adDetails'.tr(),
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
                    const AppSizeBox(height: AppSize.s14,),



                    SpaceItem(spaceController: addAdtData.priceController,title: 'price'.tr(),
                        subTitle: addAdtData.selectedCurrency.name,),

                    // const AppSizeBox(height: 14,),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     AppText(
                    //         title: 'currency'.tr(),
                    //         titleAlign: TextAlign.start,
                    //         titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
                    //         titleSize: FontSize.s16,
                    //         titleColor:ColorManager.black),
                    //
                    //
                    //   ],
                    // ),
                    // const AppSizeBox(height: 14,),
                    // SizedBox(
                    //     height: 35,
                    //     width: 1.0.sw,
                    //     child: ListView.builder(
                    //       itemCount: addAdtData.currencies.length,
                    //       scrollDirection: Axis.horizontal,
                    //       itemBuilder: (context, index) =>  InkWell(
                    //         onTap: () =>setState(()=>addAdtData.selectedCurrency=addAdtData.currencies[index]),
                    //         child: Container(
                    //           height: 35,
                    //           width: .29.sw,
                    //           margin: const EdgeInsets.symmetric(horizontal: 5),
                    //           // padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 12),
                    //           alignment: Alignment.center,
                    //           decoration: BoxDecoration(
                    //               borderRadius:
                    //               BorderRadius.circular(RadiusManager.r4),
                    //               color: addAdtData.selectedCurrency==addAdtData.currencies[index]?ColorManager.primary:ColorManager.white,
                    //               border: Border.all(color: ColorManager.textGrey,width: 1.6)
                    //             // boxShadow: Constants.kBoxShadow
                    //           ),
                    //           child: AppText(
                    //               title: addAdtData.currencies[index].name ,
                    //               titleAlign: TextAlign.center,
                    //               titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                    //               titleSize: FontSize.s12,
                    //               titleColor: addAdtData.selectedCurrency==addAdtData.currencies[index]?ColorManager.white:ColorManager.black),
                    //         ),
                    //       ),)
                    // ),
                    PropertyItem(notifier: addAdtData.floor, color: ColorManager.white, title: 'Floor'.tr(),),
                    SpaceItem(spaceController: addAdtData.spaceController,title: 'space'.tr(),subTitle: 'meter'.tr(),
                        isSpaceOptional: true),

                    PropertyItem(notifier: addAdtData.bedrooms, color: ColorManager.white, title: 'bedrooms'.tr(),),
                    PropertyItem(notifier: addAdtData.bathrooms, color: ColorManager.textGrey, title: 'Bathrooms'.tr(),),
                    PropertyItem(notifier: addAdtData.kitchen, color: ColorManager.white, title: 'kitchen'.tr(),),

                    FinishingItem(notifier: addAdtData.finishing,),

                    LengthsItem(spaceController1: addAdtData.lengthController,title1: 'Length'.tr(),title2: 'width'.tr(),
                        spaceController2: addAdtData.widthController,title: 'Lengths'.tr(),),

                    // if(widget.isEditAd)
                    // TitleValueItem(color: ColorManager.textGrey, title: 'Advertisement number'.tr(),value: '5463512'),
                    // if(widget.isEditAd)
                    // TitleValueItem(color: ColorManager.white, title: 'PostAd'.tr(),value: '2023/11/09/ 09:23 AM',
                    // valueColor: ColorManager.grey,),


                    const AppSizeBox(height: 20,),



                  ],
                ),
              ),
            )
           ],
         ),
       )


      )),
    );
  }
}
