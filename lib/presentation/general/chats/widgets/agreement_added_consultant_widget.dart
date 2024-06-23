part of'widgets_imports.dart';

class AgreementAddedConsultantWidget extends StatelessWidget {
  final  AgreementDetailsConsultModel consultant ;
  const AgreementAddedConsultantWidget({super.key, required this.consultant,});

@override
Widget build(BuildContext context) {
  return   InkWell(
    onTap: ()=>MyRoute().navigate(context: context, route:  YourConsultantProfileScreen(consultantId: consultant.id,)),
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 20),
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


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppSizeBox(width: 10,),
              AppText(
                  title: '( ${consultant.secondUserSerialNumber} )',
                  titleAlign: TextAlign.start,
                  titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                  titleSize: FontSize.s12,titleColor: ColorManager.primary),
              const AppSizeBox(width: 10,),
              AppText(
                  title: 'Advisor'.tr() +' /'+"${consultant.secondUser}",
                  titleAlign: TextAlign.start,
                  titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
                  titleSize: FontSize.s12,titleColor: ColorManager.black),





            ],
          ),


          AppText(
              title: "${consultant.secondUserPercentage} %",
              titleAlign: TextAlign.end,
              titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
              titleSize: FontSize.s12,titleColor: ColorManager.primary),
        ],
      ),
    ),
  );
}
}
