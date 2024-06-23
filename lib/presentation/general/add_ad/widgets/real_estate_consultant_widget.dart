part of'widgetImports.dart';

class RealEstateConsultantWidget extends StatelessWidget {
  final  ConsultantModel consultant ;
  final  Function onSelected ;
  final  bool? isSelected ;
  const RealEstateConsultantWidget({super.key, required this.onSelected, this.isSelected,required this.consultant});

@override
Widget build(BuildContext context) {
  return   SizedBox(
    width: .5.sw,
    height: 145,
    // color: ColorManager.primary,
    child: InkWell(
      onTap: ()=>MyRoute().navigate(context: context, route: YourConsultantProfileScreen(consultantId: consultant.id,)),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10,left: 5,right: 5),
            width: .5.sw,
            // height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(RadiusManager.r14),
              color: ColorManager.textGrey,
            //   image: DecorationImage(
            //       image: FileImage(File(imageFile.path)),
            //       fit: BoxFit.cover
            // )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedImage(
                  url:consultant.image,
                  height: 95.0,width: 95,
                  fit: BoxFit.cover,
                  boxShape: BoxShape.circle,
                ),

                const AppSizeBox(height: 10,),
                AppText(
                    title: 'Advisor'.tr() +' /'+"${consultant.name}",
                    titleAlign: TextAlign.center,
                    titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
                    titleSize: FontSize.s13,titleColor: ColorManager.primary),

                const AppSizeBox(height: 6,),
                AppText(
                    title: '${'numberLicense'.tr()} /${consultant.licenseNumber}',
                    titleAlign: TextAlign.center,
                    titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                    titleSize: FontSize.s8,titleColor: ColorManager.black),
                const AppSizeBox(height: 6,),
                AppText(
                    title: consultant.serialCode,
                    titleAlign: TextAlign.center,
                    titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                    titleSize: FontSize.s8,titleColor: ColorManager.black),

                const AppSizeBox(height: 6,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                        title: 'Sold1'.tr(),
                        titleAlign: TextAlign.center,
                        titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                        titleSize: FontSize.s10,titleColor: ColorManager.black),
                    const AppSizeBox(width: 4,),
                    AppText(
                        title:'${consultant.countAds}',
                        titleAlign: TextAlign.center,
                        titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
                        titleSize: FontSize.s10,titleColor: ColorManager.black),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0,right: 4,left: 4),
                      child: Icon(Icons.home_filled,size: 16,color: ColorManager.black,),
                    ),

                    AppText(
                      title: '${consultant.rate}',
                      titleSize: FontSize.s10,
                      titleAlign: TextAlign.start,
                      titleColor: ColorManager.black,
                      fontWeightType: FontWeightType.extraBold,
                    ),

                    const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Icon(Icons.star,size: 16,color: ColorManager.starColor,)),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    InkWell(
                      onTap: (){
                        if(Utils.checkIfUserLogin(context: context)){
                          MyRoute().navigate(context: context, route: ChatAgreementScreen(
                            receiverId: consultant.id,
                            receiverName: consultant.name,
                            receiverImage: consultant.image,
                            receiverType: UserType.consultant,
                          ));
                        }
                        },
                      child:CircleAvatar(
                        radius: 18,
                        backgroundColor: ColorManager.white,
                        child: SvgPicture.asset(ImageManager.chat2,),
                      ),
                    ),

                    const AppSizeBox(width: 10,),
                    InkWell(
                      onTap: ()=>UrlLauncherMethods.makePhoneCall(phoneNo: consultant.phone),
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: ColorManager.white,
                        child: SvgPicture.asset(ImageManager.call2,),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          if(isSelected!=null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:14.0,vertical: 18),
            child: InkWell(
              onTap: ()=>onSelected(),
              child: CircleAvatar(
                radius: 10,
                backgroundColor: ColorManager.primary,
                child:  CircleAvatar(
                  radius: 9,
                  backgroundColor: ColorManager.white,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor:isSelected!? ColorManager.primary:ColorManager.white,
                  )
                )
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}
