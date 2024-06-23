part of'widgets_imports.dart';


class AgreementDetailsItem extends StatelessWidget {
  final AgreementDetailsModel agreement;
  const AgreementDetailsItem({super.key,required this.agreement});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()async{


        bool isMeFirst =agreement.firstUserId == Constants.userDataModel!.id.toString();
        List<AgreementDetailsConsultModel> previousConsults=isMeFirst?agreement.firstConsults:agreement.secondConsults;
        bool meMainConsult=true;
        if(previousConsults.isNotEmpty){
          for(var item in previousConsults){
            if(item.secondUserId==Constants.userDataModel!.id.toString()){
              meMainConsult=false;
              break;
            }
          }
        }
        ChatAgreementModel prevAgreementData=ChatAgreementModel(
           agreementCreateId: int.parse(agreement.firstUserId),
            firstPersonId: int.parse(agreement.firstUserId),
            secondPersonId: int.parse(agreement.secondUserId),
            agreementTitle: agreement.title,
            agreementDetails: agreement.description,
            totalCommission:double.tryParse(agreement.mount)??0 ,
            firstPersonPercentage: double.tryParse(agreement.firstUserPercentage)??0 ,
            secondPersonPercentage: double.tryParse(agreement.secondUserPercentage)??0 ,
            refusedReason: '',
          );

        MyRoute().navigate(context: context, route: MakeAgreementScreen(
          agreementId: agreement.id,
          previousConsults: previousConsults,
          receiverName: isMeFirst?agreement.secondUser:agreement.firstUser,
          receiverImage:isMeFirst?agreement.secondUserImage:agreement.firstUserImage,
          receiverId:int.parse(isMeFirst?agreement.secondUserId:agreement.firstUserId),
          previousAgreement: prevAgreementData,
          makeAgreementAction:meMainConsult?MakeAgreementActon.addConsultant:MakeAgreementActon.seeOnly,

        ),);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6,),
        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 8),
        width: 1.0.sw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RadiusManager.r14),
          color: ColorManager.textGrey,
        ),
        // height:height,
        child:    Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

          Expanded(child:  Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // InkWell(
              //   onTap: ()async{
              //     UrlLauncherMethods.launchURL(url:'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf');
              //     // Utils.downloadImage(context: context,
              //   },
              //   child: CircleAvatar(
              //       radius: 20,
              //       backgroundColor:ColorManager.white,
              //       child: Icon(Icons.file_download_outlined,size: 16,color: ColorManager.redShade700,)
              //   ),
              // ),
              // //   const AppSizeBox(width: 4,),
              // // Image.asset(ImageManager.pdfPng,height: 22,width: 22,),
              const AppSizeBox(width: 10,),
              AppText(
                  title: '( ${agreement.code} )',
                  titleAlign: TextAlign.start,
                  titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                  titleSize: FontSize.s12,titleColor: ColorManager.primary),
              const AppSizeBox(width: 10,),
              Flexible(child: AppText(
                title:agreement.title,
                titleMaxLines: 1,
                titleSize: FontSize.s14,
                titleAlign: TextAlign.start,
                titleColor: ColorManager.black,
                fontWeightType: FontWeightType.medium,),)
            ],
          ),),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                if(agreement.pdfFile.isNotEmpty)
                Icon(Icons.picture_as_pdf,size: 24,color: ColorManager.redShade700,),
                if(agreement.pdfFile.isNotEmpty)
                const AppSizeBox(width: 4,),
                if(agreement.pdfFile.isNotEmpty)
                InkWell(
                  onTap: ()async{
                    UrlLauncherMethods.launchURL(url:agreement.pdfFile);
                    // Utils.downloadImage(context: context,
                  },
                  child: CircleAvatar(
                      radius: 20,
                      backgroundColor:ColorManager.white,
                      child: Stack(
                        children: [
                          Icon(Icons.download,size: 24,color: ColorManager.redShade700,)
                        ],
                      )
                  ),
                ),
                if(agreement.pdfFile.isNotEmpty)
                  const AppSizeBox(width: 4,),

                CircleAvatar(
                    radius: 20,
                    backgroundColor:ColorManager.white,
                    child: Icon(Icons.arrow_forward_ios,size: 16,color: ColorManager.black,)
                ),
              ],
            )





          ],
        ),
      ),
    );
  }
}
