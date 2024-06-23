part of'widgets_imports.dart';

class ConsultantProfileDataWidget extends StatefulWidget {
  final ConsultantInfoModel consultantInfo;
  final Function(bool) onTabPressed;
  final bool showAdsTab;
  const ConsultantProfileDataWidget({super.key,required this.onTabPressed,required this.showAdsTab,required this.consultantInfo});

  @override
  State<ConsultantProfileDataWidget> createState() => _ConsultantProfileDataWidgetState();
}

class _ConsultantProfileDataWidgetState extends State<ConsultantProfileDataWidget> {
  bool showAll=false;
@override
Widget build(BuildContext context) {
  return   Material(
    elevation: 6,
    color: ColorManager.white,
    shadowColor: ColorManager.textGrey,
    child: Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
          width: 1.0.sw,
          // height: 140,
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(RadiusManager.r14),
            // color: ColorManager.textGrey,
            // boxShadow: kElevationToShadow[4],
            // color: Theme.of(context).bottomAppBarColor,
          ),
          child: Column(
            children: [
              // AppSizeBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CachedImage(
                    url:widget.consultantInfo.image,
                    height: 120,width: 100,
                    fit: BoxFit.cover,
                    boxShape: BoxShape.circle,
                  ),

                  const AppSizeBox(width: 10,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AppSizeBox(height: 3,),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 0.27.sw,
                                    child: AppText(
                                        title: '${widget.consultantInfo.firstName} ${widget.consultantInfo.lastName}',
                                        titleAlign: TextAlign.start,
                                        titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
                                        titleSize: FontSize.s14,titleColor: ColorManager.black),
                                  ),

                                  const AppSizeBox(width: 4,),
                                  const Padding(
                                      padding: EdgeInsets.only(bottom: 4.0),
                                      child: Icon(Icons.star,size: 12,color: ColorManager.starColor,)),

                                  AppText(
                                    title: '${widget.consultantInfo.rate}',
                                    titleSize: FontSize.s10,
                                    titleAlign: TextAlign.start,
                                    titleColor: ColorManager.black,
                                    fontWeightType: FontWeightType.medium,
                                  ),
                                ],
                              ),
                              const AppSizeBox(height: 4,),
                              AppText(
                                  title: 'Real estate consultant'.tr() ,
                                  titleAlign: TextAlign.start,
                                  titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                                  titleSize: FontSize.s8,titleColor: ColorManager.black),
                              const AppSizeBox(height: 4,),
                              Row(
                                children: [
                                  Icon(Icons.location_on,size: 12,color: ColorManager.black,),
                                  AppText(
                                      title: widget.consultantInfo.country+' , '+widget.consultantInfo.city,
                                      titleAlign: TextAlign.start,
                                      titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                                      titleSize: FontSize.s8,titleColor: ColorManager.black),


                                ],
                              ),
                            ],
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            CallIcon(phoneNo: widget.consultantInfo.phone),
                            ChatIcon(
                              receiverId: widget.consultantInfo.id,
                              receiverName: widget.consultantInfo.firstName+' '+widget.consultantInfo.lastName,
                              receiverImage: widget.consultantInfo.image,
                              receiverType: UserType.consultant,
                              propertyId: null,
                            ),
                            // InkWell(
                            //     // onTap: () => UrlLauncherMethods.whatsapp(phoneNo: consultantInfo.phone),
                            //     child: SvgPicture.asset(ImageManager.chatSvg),),


                            InkWell(
                                onTap: () => UrlLauncherMethods.whatsapp(
                                    phoneNo: widget.consultantInfo.phone),
                            child:SvgPicture.asset(ImageManager.whatsSvg)),

                          ],
                        ),
                      )
                    ],
                  ),

                    const AppSizeBox(height: 4,),

                    SizedBox(
                      width: 0.6.sw,
                      child: Wrap(
                        children: [
                          InkWell(
                            onTap: () => !showAll?null:setState(() => showAll = false),
                            child: AppText(
                                title:
                                showAll?widget.consultantInfo.des:
                                widget.consultantInfo.des.length>30?
                                widget.consultantInfo.des.substring(0,29):widget.consultantInfo.des,
                                titleAlign: TextAlign.start,
                                titleHeight: 1.6,
                                titleMaxLines: 5,
                                fontWeightType: FontWeightType.medium,
                                titleSize: FontSize.s8,titleColor: ColorManager.black),
                          ),

                          if(widget.consultantInfo.des.length>30&&!showAll)
                          InkWell(
                            onTap: () => setState(() => showAll = true),
                            child: AppText(
                               title: 'Show All'.tr(),
                                titleAlign: TextAlign.start,
                                titleHeight: 1.3,
                                titleMaxLines: 2,fontWeightType: FontWeightType.medium,
                                titleSize: FontSize.s8,titleColor: ColorManager.primary),
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
              ),



                ],
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FollowWidget(title: 'advertisements'.tr(),value: '${widget.consultantInfo.adsNo}',),
                  FollowWidget(title: 'Following'.tr(),value: '${widget.consultantInfo.followingNo}',),
                  FollowWidget(title: 'Followers'.tr(),value: '${widget.consultantInfo.followersNo}',),
                ],
              ),



              MyTextButton(title: widget.consultantInfo.isFollow?'unfollow'.tr():'Follow'.tr(),
                  size: Size( .8.sw,  47),
                  radius: 10,
                  fontWeightType: FontWeightType.bold,
                  titleSize: FontSize.s16,
                  primaryColor: ColorManager.primary,
                  titleColor: ColorManager.white,
                  onPressed: (){
                if(widget.consultantInfo.isFollow){
                  context.read<ConsultantProvider>().unFollowConsultant(context: context,consultant: widget.consultantInfo);
                }
                else {
                  context.read<ConsultantProvider>().followConsultant(context: context,consultant: widget.consultantInfo);
                }
                  }),


          const AppSizeBox(height: 12,),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal:12.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       // for(var item in ['advertisements'.tr(),'Personal data'.tr()])
          //       InkWell(
          //         onTap: () =>widget.onTabPressed(false),
          //           child: Container(
          //             padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 12),
          //             alignment: Alignment.center,
          //             decoration: BoxDecoration(
          //                 borderRadius:
          //                 BorderRadius.circular(RadiusManager.r16),
          //                 color: !widget.showAdsTab?ColorManager.primary:ColorManager.white
          //               // boxShadow: Constants.kBoxShadow
          //             ),
          //             child: AppText(
          //                 title: 'advertisements'.tr(),
          //                 titleAlign: TextAlign.center,
          //                 titleMaxLines: 1,fontWeightType: FontWeightType.bold,
          //                 titleSize: FontSize.s12,
          //                 titleColor: !widget.showAdsTab?ColorManager.white:ColorManager.grey),
          //           ),
          //         ),
          //       InkWell(
          //         onTap: () =>widget.onTabPressed(true),
          //           child: Container(
          //             padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
          //             alignment: Alignment.center,
          //             decoration: BoxDecoration(
          //                 borderRadius:
          //                 BorderRadius.circular(RadiusManager.r16),
          //                 color: widget.showAdsTab?ColorManager.primary:ColorManager.white
          //               // boxShadow: Constants.kBoxShadow
          //             ),
          //             child: AppText(
          //                 title: 'Personal data'.tr(),
          //                 titleAlign: TextAlign.end,
          //                 titleMaxLines: 1,fontWeightType: FontWeightType.bold,
          //                 titleSize: FontSize.s12,
          //                 titleColor: widget.showAdsTab?ColorManager.white:ColorManager.grey),
          //           ),
          //         ),
          //     ],
          //   ),
          // )
            ],
          ),
        ),

        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal:14.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       CircleAvatar(
        //         radius: 16,
        //         backgroundColor:ColorManager.textGrey,
        //         child: Icon(Icons.file_upload_outlined,size: 16,color: ColorManager.black,)
        //       ),
        //     ],
        //   ),
        // )
      ],
    ),
  );
}
}
