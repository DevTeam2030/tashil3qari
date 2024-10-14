part of'widgets_imports.dart';


class AdDetailsData extends StatefulWidget {
  final EditAdData editAdData;
  const AdDetailsData({super.key,required this.editAdData});

  @override
  State<AdDetailsData> createState() => _AdDetailsDataState();
}

class _AdDetailsDataState extends State<AdDetailsData> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          const AppSizeBox(height: AppSize.s45,),

          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                  title: 'Add photos to your ad'.tr(),
                  titleAlign: TextAlign.start,
                  titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                  titleSize: FontSize.s20,titleColor: ColorManager.black),


              InkWell(
                onTap: ()async{
                  var photos=await Utils.pickMultiImage();
                  widget.editAdData.adImages.value.addAll(photos);
                  setState(() {});
                },
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: ColorManager.primary,
                  child:  Icon(Icons.add,
                      size: AppSize.s20,
                      color: ColorManager.white),
                ),
              ),
            ],
          ),


          const AppSizeBox(height: AppSize.s25,),

          ValueListenableBuilder(valueListenable: widget.editAdData.adImages,
            builder: (context, value, child) =>Wrap(
              children: [
                for(var item in widget.editAdData.adImages.value)
                AdAImageWidget(imageFile: item,
                  width: 100,height: 100,
                  onRemove: (){
                    widget.editAdData.adImages.value.remove(item);
                    // widget.addAdtData.adImages.value=widget.addAdtData.adImages.value;;
                    setState(() {});
                  },)
              ],
            )),

          const AppSizeBox(height: AppSize.s25,),
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                  title: 'Add video to your ad'.tr(),
                  titleAlign: TextAlign.start,
                  titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                  titleSize: FontSize.s20,titleColor: ColorManager.black),


              InkWell(
                onTap: ()async{
                  var video=await Utils.getVideo();
                  widget.editAdData.video.value=video;
                  // setState(() {});
                },
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: ColorManager.primary,
                  child:  Icon(Icons.add,
                      size: AppSize.s20,
                      color: ColorManager.white),
                ),
              ),


            ],
          ),
          ValueListenableBuilder(valueListenable: widget.editAdData.video,
            builder: (context, value, child) =>value==null?AppSizeBox(width: 0,):
            Padding(padding: EdgeInsets.symmetric(vertical: 30,),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: AppText(
                      title: value.path.split('/').last,
                      titleAlign: TextAlign.start,
                      titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                      titleSize: FontSize.s20,titleColor: ColorManager.black)),

                  AppSizeBox(width: 10,),
                  InkWell(
                    onTap: ()=>widget.editAdData.video.value=null,
                    child: Icon(Icons.delete,color: ColorManager.red,),
                  )
                ],
              ),),),

          if(widget.editAdData.userAd.video.isNotEmpty)
            Padding(padding: const EdgeInsets.symmetric(vertical: 30,),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: InkWell(
                    onTap: () => UrlLauncherMethods.launchURL(url: widget.editAdData.userAd.video),

                    child: AppText(
                        title: widget.editAdData.userAd.video.split('/').last+'dddd',
                        titleAlign: TextAlign.start,
                        underline: true,
                        titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                        titleSize: FontSize.s20,titleColor: ColorManager.black),
                  )),

                  AppSizeBox(width: 10,),
                  InkWell(
                    onTap: ()async{
                      bool isDeleted=await  context.read<AddPropertyProvider>().deleteVideo(
                          context: context, propertyId: widget.editAdData.userAd.id);
                      if(isDeleted) widget.editAdData.userAd.video='';
                      setState(() {});
                    },
                    child: Icon(Icons.delete,color: ColorManager.red,),
                  )
                ],
              ),),

          const AppSizeBox(height: AppSize.s25,),
          EditForSaleWidget(editAdData: widget.editAdData,),
          CategoryItem(notifier: widget.editAdData.category,
            color: ColorManager.white,
            valueColor: ColorManager.grey,
              onNotifierChange: (){
                widget.editAdData.streetWidthController.text='';
                widget.editAdData.floor.value=0;
                widget.editAdData.bedrooms.value=0;
                widget.editAdData.bathrooms.value=0;
                widget.editAdData.kitchen.value=0;
                widget.editAdData.receptionsNo.value=0;
                widget.editAdData.apartmentsNo.value=0;
                widget.editAdData.storesNo.value=0;
                widget.editAdData.buildingAge.value=0;
                widget.editAdData.floorsNo.value=0;
                widget.editAdData.feminine.value=false;
                widget.editAdData.direction.value=[Constants.directions.first];


              }),

          const AppSizeBox(height: AppSize.s25,),
          Row(
            children: [
              AppText(
                  title:'PropertyTitle'.tr() ,
                  titleAlign: TextAlign.start,
                  titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
                  titleSize: FontSize.s16,
                  titleColor:ColorManager.black),
            ],
          ),

          const AppSizeBox(height: AppSize.s14,),
          MoreLineTextFormField(
            controller: widget.editAdData.titleController,
            hintTitle: 'PropertyTitle'.tr(),
            labelTitle: 'PropertyTitle'.tr(),
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
                  title:'Property details'.tr() ,
                  titleAlign: TextAlign.start,
                  titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
                  titleSize: FontSize.s16,
                  titleColor:ColorManager.black),
            ],
          ),

          const AppSizeBox(height: AppSize.s10,),
          MoreLineTextFormField(
            controller: widget.editAdData.detailsController,
            hintTitle: 'Property details'.tr(),
            labelTitle: 'Property details'.tr(),
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



          SpaceItem(spaceController: widget.editAdData.priceController,title: 'price'.tr(),
              subTitle: widget.editAdData.selectedCurrency.name),

          SpaceItem(spaceController: widget.editAdData.spaceController,title: 'space'.tr(),subTitle: 'meter'.tr(),
              isSpaceOptional: true),

          LengthsItem(spaceController1: widget.editAdData.lengthController,title1: 'Length'.tr(),title2: 'width'.tr(),
            spaceController2: widget.editAdData.widthController,title: 'Lengths'.tr(), ),


          ValueListenableBuilder(valueListenable: widget.editAdData.category,
              builder: (context, value, child) => Column(
                children: [
                  if(value.options.direction)
                    DirectionDropdownButton(
                      fromSearch: false,
                      directions: Constants.directions,
                      notifier: widget.editAdData.direction,
                    ),

                  if(value.options.streetWidth)
                    SpaceItem(spaceController: widget.editAdData.streetWidthController,title: 'streetWidth'.tr(),
                      subTitle: 'meter1'.tr(),color: ColorManager.white,fillColor: ColorManager.textGrey, ),

                  if(value.options.feminine)
                    SwitchItem(notifier: widget.editAdData.feminine, title: 'Feminine'.tr(),),


                  if(value.options.annex)
                    SwitchItem(notifier: widget.editAdData.annex, title: 'Annex'.tr(),),

                  if(value.options.carEntrance)
                    SwitchItem(notifier: widget.editAdData.carEntrance, title: 'Car entrance'.tr(),),

                  if(value.options.elevator)
                    SwitchItem(notifier: widget.editAdData.elevator, title: 'Elevator'.tr(),),

                  if(value.options.airConditioners)
                    SwitchItem(notifier: widget.editAdData.airConditioners, title: 'Air conditioners'.tr(),),

                  if(value.options.waterAvailability)
                    SwitchItem(notifier: widget.editAdData.waterAvailability, title: 'Water availability'.tr(),),

                  if(value.options.electricityAvailability)
                    SwitchItem(notifier: widget.editAdData.electricityAvailability, title: 'Electricity availability'.tr(),),

                  if(value.options.swimmingPool)
                    SwitchItem(notifier: widget.editAdData.swimmingPool, title: 'Swimming pool'.tr(),),

                  if(value.options.footballField)
                    SwitchItem(notifier: widget.editAdData.footballField, title: 'Football field'.tr(),),

                  if(value.options.volleyballCourt)
                    SwitchItem(notifier: widget.editAdData.volleyballCourt, title: 'Volleyball court'.tr(),),

                  if(value.options.amusementPark)
                    SwitchItem(notifier: widget.editAdData.amusementPark, title: 'Amusement park'.tr(),),

                  if(value.options.familySection)
                    SwitchItem(notifier: widget.editAdData.familySection, title: 'Family section'.tr(),),


                  if(value.options.floor)
                    PropertyItem(notifier: widget.editAdData.floor, color: ColorManager.white, title: 'Floor'.tr(),),

                  if(value.options.floorsNo)
                    PropertyItem(notifier: widget.editAdData.floorsNo, color: ColorManager.white, title: 'floors_no'.tr(),),

                  if(value.options.roomsNo)
                    PropertyItem(notifier: widget.editAdData.bedrooms, color: ColorManager.white, title: 'bedrooms'.tr(),),

                  if(value.options.bathroomsNo)
                    PropertyItem(notifier: widget.editAdData.bathrooms, color: ColorManager.white, title: 'Bathrooms'.tr(),),

                  if(value.options.kitchensNo)
                    PropertyItem(notifier: widget.editAdData.kitchen, color: ColorManager.white, title: 'kitchen'.tr(),),

                  if(value.options.receptionsNo)
                    PropertyItem(notifier: widget.editAdData.receptionsNo, color: ColorManager.white, title: 'receptionsNo'.tr(),),

                  if(value.options.apartmentsNo)
                    PropertyItem(notifier: widget.editAdData.apartmentsNo, color: ColorManager.white, title: 'apartmentsNo'.tr(),),

                  if(value.options.storesNo)
                    PropertyItem(notifier: widget.editAdData.storesNo, color: ColorManager.white, title: 'storesNo'.tr(),),

                  if(value.options.buildingAge)
                    PropertyItem(notifier: widget.editAdData.buildingAge, color: ColorManager.white, title: 'buildingAge'.tr(),),
                ],
              )),





          // FinishingItem(notifier: widget.editAdData.finishing,),






          SpaceItem( title: 'Advertising license'.tr(),
              color: ColorManager.white,
              spaceController: widget.editAdData.licenseAdController,subTitle: '' ,),

          // CategoryItem(notifier: widget.editAdData.category,
          //   color: ColorManager.white,
          //   valueColor: ColorManager.grey,),


          TitleValueItem(color: ColorManager.textGrey,
            title: 'Advertisement number'.tr(),value: widget.editAdData.userAd.id.toString(),),

          TitleValueItem(color: ColorManager.white, title: 'Last updated'.tr(),value: widget.editAdData.userAd.lastUpadte,
            valueColor: ColorManager.grey, ),

          TitleValueItem(color: ColorManager.textGrey, title: 'PostAd'.tr(),value:widget.editAdData.userAd.adCreatedAt,
            valueColor: ColorManager.grey, ),

          const AppSizeBox(height: 20,),
        ],
      ),
    );
  }
}
