part of'widgets_imports.dart';


class AgreementItem extends StatelessWidget {
  final AgreementModel agreementModel;
  const AgreementItem({super.key,required this.agreementModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6,),
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
      width: 1.0.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RadiusManager.r14),
        color: ColorManager.textGrey,
      ),
      // height:height,
      child:    Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

            InkWell(
              onTap: ()async{
                UrlLauncherMethods.launchURL(url:agreementModel.agreementFile);
                // Utils.downloadImage(context: context,
              },
              child: CircleAvatar(
                  radius: 20,
                  backgroundColor:ColorManager.white,
                  child: Icon(Icons.file_download_outlined,size: 16,color: ColorManager.black,)
              ),
            ),
          const AppSizeBox(width: 4,),
        Image.asset(ImageManager.pdfPng,height: 22,width: 22,),
          const AppSizeBox(width: 4,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SizedBox(
          width: .6.sw,
          child:   AppText(
          title:agreementModel.agreementFile.split('/').last,
          titleMaxLines: 1,
          titleSize: FontSize.s16,
          titleAlign: TextAlign.start,
          titleColor: ColorManager.black,
          fontWeightType: FontWeightType.medium,),),
          AppSizeBox(height: 4,),
          AppText(
            title:agreementModel.senderName,
            titleMaxLines: 1,
            titleSize: FontSize.s16,
            titleAlign: TextAlign.start,
            titleColor: ColorManager.black,
            fontWeightType: FontWeightType.medium,),

          AppSizeBox(height: 4,),
          AppText(
            title:agreementModel.receiverName,
            titleMaxLines: 1,
            titleSize: FontSize.s16,
            titleAlign: TextAlign.start,
            titleColor: ColorManager.black,
            fontWeightType: FontWeightType.medium,),

    ],
      )




        ],
      ),
    );
  }
}
