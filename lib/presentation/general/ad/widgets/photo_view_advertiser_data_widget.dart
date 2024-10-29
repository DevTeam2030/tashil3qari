part of'widgets_imports.dart';


class PhotoViewAdvertiserDataWidget extends StatelessWidget {
  final   PropertyInfoModel propertyInfo;
  const PhotoViewAdvertiserDataWidget({super.key,required this.propertyInfo});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
      width: .56.sw,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RadiusManager.r22),
        color: ColorManager.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          CachedImage(
            url:propertyInfo.userImage,
            height: 55,width: 55,
            fit: BoxFit.cover,
            boxShape: BoxShape.circle,
          ),

          const AppSizeBox(width: 4,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppSizeBox(height: 3,),
              AppText(
                  title:propertyInfo.userName,
                  titleAlign: TextAlign.center,
                  titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
                  titleSize: FontSize.s12,titleColor: ColorManager.black),
              const AppSizeBox(height: 4,),
              Row(
                children: [
                  AppText(
                      title:propertyInfo.userType==UserType.user?'user'.tr(): 'RealEstateConsultant'.tr() ,
                      titleAlign: TextAlign.start,
                      titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                      titleSize: FontSize.s8,titleColor: ColorManager.black),

                  const AppSizeBox(width: 4,),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Icon(Icons.star,size: 12,color: ColorManager.starColor,)),

                  AppText(
                    title: '${propertyInfo.userRate}',
                    titleSize: FontSize.s10,
                    titleAlign: TextAlign.start,
                    titleColor: ColorManager.black,
                    fontWeightType: FontWeightType.medium,
                  ),
                ],
              ),

              const AppSizeBox(height: 4,),
              SizedBox(
                // width: .40.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CallIcon(phoneNo: propertyInfo.userPhone),
                    const AppSizeBox(width: 4,),
                    ChatIcon(receiverType: UserType.consultant,
                        receiverName: propertyInfo.userName,
                        receiverImage: propertyInfo.userImage,
                        receiverId: propertyInfo.userId,
                    propertyId: propertyInfo.id,
                    messageAd: propertyInfo.propertyTitle,),
                    const AppSizeBox(width: 4,),
                    SvgPicture.asset(ImageManager.whatsSvg),
                    const AppSizeBox(width: 4,),
                    SvgPicture.asset(ImageManager.messageSvg),

                  ],
                ),
              ),
              const AppSizeBox(height: 4,),

            ],
          ),
        ],
      ),
    );
  }
}
