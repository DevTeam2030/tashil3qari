part of'widgetImports.dart';

class HorizontalRealEstateConsultantWidget extends StatelessWidget {
  final ConsultantModel consultant ;
  final  Function onSelected ;
  const HorizontalRealEstateConsultantWidget({super.key, required this.onSelected,required this.consultant});

@override
Widget build(BuildContext context) {
  return    InkWell(
    onTap: (){
      if(Utils.checkIfUserLogin(context: context))
        MyRoute().navigate(context: context, route:  YourConsultantProfileScreen(consultantId: consultant.id,));

    },
           child: Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
      width: 1.0.sw,
      // height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RadiusManager.r14),
        color: ColorManager.textGrey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon(Icons.close,size: 20,color: ColorManager.black,),
          CachedImage(
            url:consultant.image,
            height: 50,width: 50,
            fit: BoxFit.cover,
            boxShape: BoxShape.circle,
          ),

          const AppSizeBox(width: 6,),
     Expanded(child:  Column(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         const AppSizeBox(height: 3,),
         AppText(
             title: 'Advisor'.tr() +' /'+"${consultant.name}",
             titleAlign: TextAlign.center,
             titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
             titleSize: FontSize.s12,titleColor: ColorManager.primary),

         const AppSizeBox(height: 2,),
         AppText(
             title: 'numberLicense'.tr() +' /'+"${consultant.licenseNumber}",
             titleAlign: TextAlign.center,
             titleMaxLines: 1,fontWeightType: FontWeightType.medium,
             titleSize: FontSize.s8,titleColor: ColorManager.black),
         const AppSizeBox(height: 2,),
         AppText(
             title: consultant.serialCode,
             titleAlign: TextAlign.center,
             titleMaxLines: 1,fontWeightType: FontWeightType.medium,
             titleSize: FontSize.s8,titleColor: ColorManager.black),

         const AppSizeBox(height: 2,),

         Row(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             AppText(
                 title: 'Sold',
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
               padding: const EdgeInsets.only(bottom: 4.0,right: 4,left: 4),
               child: Icon(Icons.home_filled,size: 12,color: ColorManager.black,),
             ),

             AppText(
               title: '${consultant.rate}',
               titleSize: FontSize.s10,
               titleAlign: TextAlign.start,
               titleColor: ColorManager.black,
               fontWeightType: FontWeightType.extraBold,
             ),
             Padding(
                 padding: const EdgeInsets.only(bottom: 4.0),
                 child: Icon(Icons.star,size: 12,color: ColorManager.starColor,)),
           ],
         ),
       ],
     ),),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: (){
                  if(Utils.checkIfUserLogin(context: context)){
                    if(consultant.id==Constants.userDataModel!.id){
                      LoadingDialog.showSimpleToast('YouCantMessageYourself'.tr());

                    }else{
                      MyRoute().navigate(context: context, route: ChatAgreementScreen(
                        receiverId: consultant.id,
                        messageAd: '',
                        receiverName: consultant.name,
                        receiverImage: consultant.image,
                        receiverType: UserType.consultant,
                      ));
                    }

                  }
                },
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: ColorManager.white,
                  child: Image.asset(ImageManager.chat,color: ColorManager.primary,),
                ),
              ),

              const AppSizeBox(width: 4,),
              InkWell(
                  onTap: (){
                    if(Utils.checkIfUserLogin(context: context)){
                      if(consultant.id==Constants.userDataModel!.id){
                        LoadingDialog.showSimpleToast('YouCantMessageYourself'.tr());

                      }else{
                        UrlLauncherMethods.makePhoneCall(phoneNo: consultant.phone);
                      }

                    }
                  },
                // onTap: ()=>UrlLauncherMethods.makePhoneCall(phoneNo: consultant.phone),
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: ColorManager.white,
                  child:  Icon(Icons.phone,size: 16,color: ColorManager.primary,),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
}
