part of'widgets_imports.dart';


class DeleteReasonWidgetAlert extends StatelessWidget {
 final ReasonModel reason;
 final int adId;
 final Function(int adId,int reasonId,String otherReasonOptional)onDeleteAd ;
  const DeleteReasonWidgetAlert({super.key,required this.reason,required this.onDeleteAd,required this.adId});

@override
Widget build(BuildContext context) {
  return Center(
      child: Material(
        borderRadius: BorderRadius.circular(RadiusManager.r20),
        child: Container(
          height: .5.sh,
          width: .9.sw,
          constraints: BoxConstraints(
            minHeight: .3.sh,
            maxHeight: .7.sh,
            minWidth: .9.sw,
            maxWidth: .9.sw,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(ImageManager.deleteIcons,height: 140,fit: BoxFit.fill,),
              const AppSizeBox(height: 18,),
              AppText(title:'DeleteAdMessage'.tr(),
                titleSize: FontSize.s18, titleAlign: TextAlign.center,
                titleColor: ColorManager.text,
                titleHeight: 1.3,
                fontWeightType: FontWeightType.semiBold,
                titleMaxLines: 3,),
              const AppSizeBox(height: 16,),
       MyTextButton(title: 'send'.tr(),
           size: Size( .5.sw,  40),
           radius: 8,
           fontWeightType: FontWeightType.medium,
           titleSize: FontSize.s14,
           primaryColor: ColorManager.primary,
           titleColor: ColorManager.white,
           onPressed: (){
             Navigator.pop(context);
             if(reason.type=='all') {
               LoadingDialog().widgetAlertDialog(context: context,
                   widget: DeleteAdReasonWidget(reason: reason,
                     onDeleteAd:onDeleteAd ,
                     adId: adId,
                   ));
             } else{
               onDeleteAd(adId, reason.id,'');
             }

           }),
              const AppSizeBox(height: 14,),

              InkWell(
                onTap: ()=>Navigator.pop(context),
                child: AppText(
                  title: 'Cancel'.tr(),
                  titleSize: FontSize.s14,
                  titleAlign: TextAlign.center,
                  titleColor: ColorManager.red,
                  fontWeightType: FontWeightType.medium,
                ),
              ),
              const AppSizeBox(height: 20,),
            ],
          ),
        ),
      ));
}
}
