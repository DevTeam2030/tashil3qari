part of'make_agreement_imports.dart';


class PreviousConsultsWidget extends StatefulWidget {
  final  List<AgreementDetailsConsultModel> previousConsults;
  const PreviousConsultsWidget({super.key,required this.previousConsults});

  @override
  State<PreviousConsultsWidget> createState() => _PreviousConsultsWidgetState();
}

class _PreviousConsultsWidgetState extends State<PreviousConsultsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSizeBox(height: 30,),

        AppText(
          title:'Advisors you added'.tr() +' :',
          titleSize:FontSize.s12,
          titleMaxLines: 1,
          titleHeight: 1.3,
          titleAlign: TextAlign.start,
          titleColor: ColorManager.black,
          fontWeightType: FontWeightType.regular,
        ),
        // AppSizeBox(height: 10,),

        for(var item in widget.previousConsults)AgreementAddedConsultantWidget(consultant: item,),

      ],
    );
  }
}
