part of'widgetImports.dart';


class TitleValueItem extends StatelessWidget {
  final String value ,title;
  final Color? color,valueColor;
  final bool? haveTitle;
  const TitleValueItem({
    Key? key,
   required this.value,
   required this.title,
    this.color,
    this.valueColor,
    this.haveTitle=true,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(

      // margin: EdgeInsets.only(top: 110),
      padding: const EdgeInsets.symmetric(
          vertical: PaddingManager.p10, horizontal: PaddingManager.p16),
      width: 1.0.sw,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RadiusManager.r12),
        color:color??ColorManager.white,
        // boxShadow: Constants.kBoxShadow
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(haveTitle==true)
          AppText(
            title: title+' :',
            titleSize: FontSize.s16,
            titleAlign: TextAlign.start,
            titleColor:
            ColorManager.black,
            fontWeightType: FontWeightType.regular,
          ),

          AppText(
            title: value,
            titleSize: FontSize.s14,
            titleAlign: TextAlign.start,
            titleColor: valueColor??ColorManager.black,
            fontWeightType: FontWeightType.regular,
          ),

        ],
      ),
    );

  }


}
