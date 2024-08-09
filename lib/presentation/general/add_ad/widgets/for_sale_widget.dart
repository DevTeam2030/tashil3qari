part of'widgetImports.dart';

class ForSaleWidget extends StatefulWidget {
  final  AddAdtData addAdtData;
  const ForSaleWidget({super.key,required this.addAdtData});

  @override
  State<ForSaleWidget> createState() => _ForSaleWidgetState();
}

class _ForSaleWidgetState extends State<ForSaleWidget> {

@override
  void initState() {

    super.initState();

  }

  @override
  void dispose() {
    super.dispose();

  }
@override
Widget build(BuildContext context) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 4,),
        padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 8),
        width: 1.0.sw,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(RadiusManager.r14),
          color: ColorManager.textGrey,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            InkWell(
              onTap: (){
                setState(() {
                  widget.addAdtData.forSale=true;
                });
              },

              child: Container(
                // margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                width: .4.sw,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(RadiusManager.r14),
                  color: widget.addAdtData.forSale? ColorManager.white:ColorManager.textGrey,
                ),
                child: AppText(
                    title:'ForSale'.tr() ,
                    titleAlign: TextAlign.center,
                    titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                    titleSize: FontSize.s16,
                    titleColor:!widget.addAdtData.forSale? ColorManager.grey: ColorManager.black),
              ),
            ),

            InkWell(
              onTap: (){
                setState(() {
                  widget.addAdtData.forSale=false;
                });
              },
              child: Container(
                // margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                width: .4.sw,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(RadiusManager.r14),
                  color: widget.addAdtData.forSale==false? ColorManager.white:ColorManager.textGrey,
                ),
                child: AppText(
                    title:'ForRent'.tr() ,
                    titleAlign: TextAlign.center,
                    titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                    titleSize: FontSize.s16,
                    titleColor:widget.addAdtData.forSale? ColorManager.grey:ColorManager.black),
              ),
            ),








          ],
        ),
      ),

      if(!widget.addAdtData.forSale)
      const AppSizeBox(height: 10,),
      if(!widget.addAdtData.forSale)
      Container(
        margin: const EdgeInsets.symmetric(vertical: 4,),
        padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 8),
        width: 1.0.sw,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(RadiusManager.r14),
          color: ColorManager.textGrey,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            InkWell(
              onTap: (){
                setState(() {
                  widget.addAdtData.monthly=true;
                });
              },

              child: Container(
                // margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                width: .4.sw,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(RadiusManager.r14),
                  color: widget.addAdtData.monthly? ColorManager.white:ColorManager.textGrey,
                ),
                child: AppText(
                    title:'Monthly'.tr() ,
                    titleAlign: TextAlign.center,
                    titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                    titleSize: FontSize.s16,
                    titleColor:!widget.addAdtData.monthly? ColorManager.grey: ColorManager.black),
              ),
            ),

            InkWell(
              onTap: (){
                setState(() {
                  widget.addAdtData.monthly=false;
                });
              },
              child: Container(
                // margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                width: .4.sw,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(RadiusManager.r14),
                  color: widget.addAdtData.monthly==false? ColorManager.white:ColorManager.textGrey,
                ),
                child: AppText(
                    title:'Annual'.tr() ,
                    titleAlign: TextAlign.center,
                    titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                    titleSize: FontSize.s16,
                    titleColor:widget.addAdtData.monthly? ColorManager.grey:ColorManager.black),
              ),
            ),








          ],
        ),
      )
    ],
  );
}


}
