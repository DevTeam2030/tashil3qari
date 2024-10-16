part of 'widgets_imports.dart';

class AddRealEstateNews extends StatefulWidget {
  final CouncilData councilData;
  final bool isOpportunity;
  const AddRealEstateNews({super.key, required this.councilData, this.isOpportunity=false});

  @override
  State<AddRealEstateNews> createState() => _AddRealEstateNewsState();
}

class _AddRealEstateNewsState extends State<AddRealEstateNews> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(

          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
          width: 1.0.sw,
          // height: 140,
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(RadiusManager.r22),
            color: ColorManager.white,
          ),
          child: Form(
            key:widget.isOpportunity? widget.councilData.opportunityFormKey:widget.councilData.newsFormKey,
            child: Column(
              children: [

                // if(false)
                // AdvisorNewsDataItem(
                //   forAdd: true,
                //   councilData: widget.councilData,
                //   showStar: false,
                //   isPost: false,
                //   showOptions: false,
                //   post: PostModel(
                //     id: 0,
                //     post: '',
                //    userName: Constants.userDataModel!.firstName + ' ' + Constants.userDataModel!.lastName,
                //     userImage: Constants.userDataModel!.image,
                //    image: Constants.userDataModel!.image ,
                //     userRate:  0,
                //       userId: Constants.userDataModel!.id,
                //       city: '' ,
                //       country:'',
                //       // city: Constants.userDataModel!.address.isEmpty?'':Constants.userDataModel!.address[0].cityName ,
                //       // country: Constants.userDataModel!.address.isEmpty?'':Constants.userDataModel!.address[0].countryName,
                //     userType: '' ,
                //     userPhone: '' ,
                //     userEmail:'' ,
                //     timeAgo: '',
                //     isFollow: false,
                //     isAgreement: false,
                //     disLike: false,
                //       disLikesCounter: 0,
                //     like: false,
                //     likesCounter: 0,
                //     consults: []
                //   ),
                // ),



                const AppSizeBox(height: 8,),
                MoreLineTextFormField(
                  controller:widget.isOpportunity?widget.councilData.opportunityController: widget.councilData.newsController,
                  hintTitle:widget.isOpportunity?'WriteRealEstateOpportunity'.tr(): 'WritRrealEstateNews'.tr(),
                  labelTitle:widget.isOpportunity?'WriteRealEstateOpportunity'.tr(): 'WritRrealEstateNews'.tr(),
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

                if(widget.isOpportunity)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child:Column(
                    children: [
                      MoreLineTextFormField(
                        controller:widget.councilData.opportunityDesController,
                        hintTitle: 'WriteRealEstateDesOpportunity'.tr(),
                        labelTitle: 'WriteRealEstateDesOpportunity'.tr(),
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

                      const AppSizeBox(height: 12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // InkWell(
                          //   onTap: (){},
                          //   child: Row(
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: [
                          //       SvgPicture.asset(ImageManager.addLocation,height: 16,width: 16),
                          //       const AppSizeBox(width: 4,),
                          //       AppText(
                          //         title:'AddLocation'.tr(),
                          //         titleSize: FontSize.s10,
                          //         titleMaxLines: 10,
                          //         titleAlign: TextAlign.start,
                          //         titleColor: ColorManager.black ,
                          //         titleHeight: 1.4,
                          //         fontWeightType: FontWeightType.medium,
                          //       ),
                          //     ],
                          //   ),
                          // ),


                          InkWell(
                            onTap: ()=>Utils().uploadModalBottomSheet(context: context,
                              onGalleryTap: (photo){
                                // context.read<AuthProvider>().changeImageProfile(context: context, photo: photo);
                                setState(()=> widget.councilData.opportunityPicker=photo);
                              },
                              onCameraTap: (photo){
                                // context.read<AuthProvider>().changeImageProfile(context: context, photo: photo);
                                setState(()=> widget.councilData.opportunityPicker=photo);
                              },),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // SvgPicture.asset(ImageManager.camera,height: 16,width: 16),
                                Icon(Icons.camera_alt_sharp,size: 16,color: ColorManager.red,),
                                const AppSizeBox(width: 4,),
                                AppText(
                                  title:'photo'.tr(),
                                  titleSize: FontSize.s10,
                                  titleMaxLines: 10,
                                  titleAlign: TextAlign.start,
                                  titleColor: ColorManager.red ,
                                  titleHeight: 1.4,
                                  fontWeightType: FontWeightType.medium,
                                ),
                              ],
                            ),
                          ),


                          // InkWell(
                          //   onTap: (){},
                          //   child: Row(
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: [
                          //       SvgPicture.asset(ImageManager.video,height: 16,width: 16),
                          //       const AppSizeBox(width: 4,),
                          //       AppText(
                          //         title:'video'.tr(),
                          //         titleSize: FontSize.s10,
                          //         titleMaxLines: 10,
                          //         titleAlign: TextAlign.start,
                          //         titleColor: ColorManager.primary ,
                          //         titleHeight: 1.4,
                          //         fontWeightType: FontWeightType.medium,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  )
                ),

                if( widget.isOpportunity&&widget.councilData.opportunityPicker!=null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 12),
                          height: AppSize.s90,
                          width: AppSize.s90,
                          decoration:   BoxDecoration(
                              borderRadius: BorderRadius.circular(RadiusManager.r20),
                              image:  DecorationImage(
                                image: FileImage(File( widget.councilData.opportunityPicker!.path)),
                                fit: BoxFit.cover,
                              )
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: (){
                                widget.councilData.opportunityPicker=null;
                                setState(() {});
                              },
                              child: const Icon(Icons.close,size: 16,color: ColorManager.red,),
                            ),
                          )
                      ),
                    ],
                  ),

                const AppSizeBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyTextButton(title: 'Publish'.tr(),
                        size: Size( .36.sw,  42),
                        radius: 6,
                        fontWeightType: FontWeightType.medium,
                        titleSize: FontSize.s18,
                        primaryColor: ColorManager.primary,
                        titleColor: ColorManager.white,
                        onPressed: (){
                          FocusScope.of(context).requestFocus( FocusNode());

                          if(widget.councilData.selectedCity==null){
                            LoadingDialog.showSimpleToast('PleaseSelectCityFirst'.tr());
                            return;
                          }
                          if(widget.isOpportunity){
                            if(widget.councilData.opportunityFormKey.currentState!.validate()){
                              // if(councilData.opportunityPicker==null){
                              //   LoadingDialog.showSimpleToast('PleaseEnterPicture'.tr());
                              //   return;
                              // }
                              context.read<CouncilProvider>().addOpportunity(context: context,
                                  post: widget.councilData.opportunityController.text,
                                  description: widget.councilData.opportunityDesController.text,
                                  cityId: widget.councilData.selectedCity!.id,
                                  image: widget.councilData.opportunityPicker==null?null:File(widget.councilData.opportunityPicker!.path));
                            }
                          }else{
                            if(widget.councilData.newsFormKey.currentState!.validate()){
                              context.read<CouncilProvider>().addPost(
                                  context: context,post: widget.councilData.newsController.text, image: null,
                              cityId: widget.councilData.selectedCity!.id);
                            }
                          }
                          // if(councilData.newsFormKey.currentState!.validate()){
                          //   councilData.newsFormKey.currentState!.save();
                          // }
                        }),
                  ],
                ),


              ],
            ),
          ),
        ),

        const Divider(thickness: 1,color: ColorManager.divider,),
      ],
    );
  }
}
