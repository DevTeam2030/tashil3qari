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
                LoadingDialog.showSimpleToast('PleaseEnterAllDataCorrectly'.tr());
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
                    CategoryItem(notifier: addAdtData.category,
                        color: ColorManager.white,   valueColor: ColorManager.grey,
                    onNotifierChange: (){
                      addAdtData.streetWidthController.text='';
                      addAdtData.floor.value=0;
                      addAdtData.bedrooms.value=0;
                      addAdtData.bathrooms.value=0;
                      addAdtData.kitchen.value=0;
                      addAdtData.receptionsNo.value=0;
                      addAdtData.apartmentsNo.value=0;
                      addAdtData.storesNo.value=0;
                      addAdtData.buildingAge.value=0;
                      addAdtData.feminine.value=false;
                      addAdtData.direction.value=[Constants.directions.first];



                    }),


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
                      fillColor: ColorManager.textGrey,
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

                    SpaceItem(spaceController: addAdtData.spaceController,title: 'space'.tr(),subTitle: 'meter'.tr(),
                        isSpaceOptional: true,color:ColorManager.white,fillColor: ColorManager.textGrey, ),
                    LengthsItem(spaceController1: addAdtData.lengthController,title1: 'Length'.tr(),title2: 'width'.tr(),
                        spaceController2: addAdtData.widthController,title: 'Lengths'.tr(),fillColor: ColorManager.textGrey, ),

                    const AppSizeBox(height: 14,),
                    ValueListenableBuilder(valueListenable: addAdtData.category,
                      builder: (context, value, child) => Column(
                        children: [
                          if(value.options.direction)
                            DirectionDropdownButton(

                              directions: Constants.directions,
                              notifier: addAdtData.direction,
                            ),

                          if(value.options.streetWidth)
                          SpaceItem(spaceController: addAdtData.streetWidthController,title: 'streetWidth'.tr(),
                            subTitle: 'meter1'.tr(),color: ColorManager.white,fillColor: ColorManager.textGrey, ),

                          if(value.options.floor)
                          PropertyItem(notifier: addAdtData.floor, color: ColorManager.white, title: 'Floor'.tr(),),

                          if(value.options.feminine)
                            SwitchItem(notifier: addAdtData.feminine, title: 'Feminine'.tr(),),


                          if(value.options.annex)
                            SwitchItem(notifier: addAdtData.annex, title: 'Annex'.tr(),),

                          if(value.options.carEntrance)
                            SwitchItem(notifier: addAdtData.carEntrance, title: 'Car entrance'.tr(),),

                          if(value.options.elevator)
                            SwitchItem(notifier: addAdtData.elevator, title: 'Elevator'.tr(),),

                          if(value.options.airConditioners)
                            SwitchItem(notifier: addAdtData.airConditioners, title: 'Air conditioners'.tr(),),

                          if(value.options.waterAvailability)
                            SwitchItem(notifier: addAdtData.waterAvailability, title: 'Water availability'.tr(),),

                          if(value.options.electricityAvailability)
                            SwitchItem(notifier: addAdtData.electricityAvailability, title: 'Electricity availability'.tr(),),

                          if(value.options.swimmingPool)
                            SwitchItem(notifier: addAdtData.swimmingPool, title: 'Swimming pool'.tr(),),

                          if(value.options.footballField)
                            SwitchItem(notifier: addAdtData.footballField, title: 'Football field'.tr(),),

                          if(value.options.volleyballCourt)
                            SwitchItem(notifier: addAdtData.volleyballCourt, title: 'Volleyball court'.tr(),),

                          if(value.options.amusementPark)
                            SwitchItem(notifier: addAdtData.amusementPark, title: 'Amusement park'.tr(),),

                          if(value.options.familySection)
                            SwitchItem(notifier: addAdtData.familySection, title: 'Family section'.tr(),),








                          if(value.options.floorsNo)
                          PropertyItem(notifier: addAdtData.floorsNo, color: ColorManager.white, title: 'floors_no'.tr(),),

                          if(value.options.roomsNo)
                          PropertyItem(notifier: addAdtData.bedrooms, color: ColorManager.white, title: 'bedrooms'.tr(),),

                          if(value.options.bathroomsNo)
                          PropertyItem(notifier: addAdtData.bathrooms, color: ColorManager.white, title: 'Bathrooms'.tr(),),

                          if(value.options.kitchensNo)
                          PropertyItem(notifier: addAdtData.kitchen, color: ColorManager.white, title: 'kitchen'.tr(),),

                          if(value.options.receptionsNo)
                          PropertyItem(notifier: addAdtData.receptionsNo, color: ColorManager.white, title: 'receptionsNo'.tr(),),

                          if(value.options.apartmentsNo)
                          PropertyItem(notifier: addAdtData.apartmentsNo, color: ColorManager.white, title: 'apartmentsNo'.tr(),),

                          if(value.options.storesNo)
                          PropertyItem(notifier: addAdtData.storesNo, color: ColorManager.white, title: 'storesNo'.tr(),),

                          if(value.options.buildingAge)
                          PropertyItem(notifier: addAdtData.buildingAge, color: ColorManager.white, title: 'buildingAge'.tr(),),




                        ],
                      )),








                    // direction: false,
                    // street_width: false,
                   // building_age: false,

                    // FinishingItem(notifier: addAdtData.finishing,),
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
