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
            valueColor: ColorManager.grey,),

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

          
          // const AppSizeBox(height: 14,),
          // SizedBox(
          //     height: 35,
          //     width: 1.0.sw,
          //     child: ListView.builder(
          //       itemCount: Constants.settingModel.currencies.length,
          //       scrollDirection: Axis.horizontal,
          //       itemBuilder: (context, index) =>  InkWell(
          //         onTap: () =>setState(()=>widget.editAdData.selectedCurrency=Constants.settingModel.currencies[index]),
          //         child: Container(
          //           height: 35,
          //           width: .29.sw,
          //           margin: const EdgeInsets.symmetric(horizontal: 5),
          //           // padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 12),
          //           alignment: Alignment.center,
          //           decoration: BoxDecoration(
          //               borderRadius:
          //               BorderRadius.circular(RadiusManager.r4),
          //               color: widget.editAdData.selectedCurrency==Constants.settingModel.currencies[index]?ColorManager.primary:ColorManager.white,
          //               border: Border.all(color: ColorManager.textGrey,width: 1.6)
          //             // boxShadow: Constants.kBoxShadow
          //           ),
          //           child: AppText(
          //               title: Constants.settingModel.currencies[index].name ,
          //               titleAlign: TextAlign.center,
          //               titleMaxLines: 1,fontWeightType: FontWeightType.medium,
          //               titleSize: FontSize.s12,
          //               titleColor: widget.editAdData.selectedCurrency==Constants.settingModel.currencies[index]?ColorManager.white:ColorManager.black),
          //         ),
          //       ),)
          // ),
          PropertyItem(notifier: widget.editAdData.floor, color: ColorManager.white, title: 'Floor'.tr() ,),

          SpaceItem(spaceController: widget.editAdData.spaceController,title: 'space'.tr(),subTitle: 'meter'.tr(),
              isSpaceOptional: true),

          PropertyItem(notifier: widget.editAdData.bedrooms, color: ColorManager.white, title: 'bedrooms'.tr(), ),
          PropertyItem(notifier: widget.editAdData.bathrooms, color: ColorManager.textGrey, title: 'Bathrooms'.tr(), ),
          PropertyItem(notifier: widget.editAdData.kitchen, color: ColorManager.white, title: 'kitchen'.tr(), ),

          FinishingItem(notifier: widget.editAdData.finishing,),

          LengthsItem(spaceController1: widget.editAdData.lengthController,title1: 'Length'.tr(),title2: 'width'.tr(),
              spaceController2: widget.editAdData.widthController,title: 'Lengths'.tr(), ),





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
