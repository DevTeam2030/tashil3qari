part of'widgets_imports.dart';

class UserProfileDataWidget extends StatefulWidget {
  final String userImage,userRate,userName,userPhone;
  final int userId,propertyId;
  const UserProfileDataWidget({super.key,required this.userImage,required this.userName,required this.userPhone,
  required this.userRate,required this.userId,required this.propertyId,});

  @override
  State<UserProfileDataWidget> createState() => _UserProfileDataWidgetState();
}

class _UserProfileDataWidgetState extends State<UserProfileDataWidget> {
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
                    url:widget.userImage,
                    height: 65,
                    width: 65,
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
                                        title: widget.userName,
                                        titleAlign: TextAlign.start,
                                        titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
                                        titleSize: FontSize.s14,titleColor: ColorManager.black),
                                  ),

                                  const AppSizeBox(width: 4,),
                                  const Padding(
                                      padding: EdgeInsets.only(bottom: 4.0),
                                      child: Icon(Icons.star,size: 12,color: ColorManager.starColor,)),

                                  AppText(
                                    title: '${widget.userRate}',
                                    titleSize: FontSize.s10,
                                    titleAlign: TextAlign.start,
                                    titleColor: ColorManager.black,
                                    fontWeightType: FontWeightType.medium,
                                  ),
                                ],
                              ),
                              const AppSizeBox(height: 4,),
                              AppText(
                                  title: 'user'.tr() ,
                                  titleAlign: TextAlign.start,
                                  titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                                  titleSize: FontSize.s8,titleColor: ColorManager.black),
                              const AppSizeBox(height: 4,),
                              // Row(
                              //   children: [
                              //     Icon(Icons.location_on,size: 12,color: ColorManager.black,),
                              //     AppText(
                              //         title: widget.propertyInfo.u+' , '+widget.consultantInfo.city,
                              //         titleAlign: TextAlign.start,
                              //         titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                              //         titleSize: FontSize.s8,titleColor: ColorManager.black),
                              //
                              //
                              //   ],
                              // ),
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

                            CallIcon(phoneNo: widget.userPhone),
                            ChatIcon(
                              messageAd: '',
                              receiverId: widget.userId,
                                receiverName: widget.userName,
                                receiverImage: widget.userImage,
                                propertyId:widget.propertyId,
                              receiverType: UserType.user,
                            ),
                            // InkWell(
                            //     // onTap: () => UrlLauncherMethods.whatsapp(phoneNo: consultantInfo.phone),
                            //     child: SvgPicture.asset(ImageManager.chatSvg),),


                            InkWell(
                                onTap: () => UrlLauncherMethods.whatsapp(
                                    phoneNo: widget.userPhone),
                            child:SvgPicture.asset(ImageManager.whatsSvg)),

                          ],
                        ),
                      )
                    ],
                  ),

                    const AppSizeBox(height: 4,),




                  ],
                ),
              ),



                ],
              ),





            ],
          ),
        ),


      ],
    ),
  );
}
}
