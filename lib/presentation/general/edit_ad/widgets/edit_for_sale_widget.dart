part of'widgets_imports.dart';

class EditForSaleWidget extends StatefulWidget {
  final  EditAdData editAdData;
  const EditForSaleWidget({super.key,required this.editAdData});

  @override
  State<EditForSaleWidget> createState() => _EditForSaleWidgetState();
}

class _EditForSaleWidgetState extends State<EditForSaleWidget> {

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
                  widget.editAdData.forSale=true;
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
                  color: widget.editAdData.forSale? ColorManager.white:ColorManager.textGrey,
                ),
                child: AppText(
                    title:'ForSale'.tr() ,
                    titleAlign: TextAlign.center,
                    titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                    titleSize: FontSize.s16,
                    titleColor:!widget.editAdData.forSale? ColorManager.grey: ColorManager.black),
              ),
            ),

            InkWell(
              onTap: (){
                setState(() {
                  widget.editAdData.forSale=false;
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
                  color: widget.editAdData.forSale==false? ColorManager.white:ColorManager.textGrey,
                ),
                child: AppText(
                    title:'ForRent'.tr() ,
                    titleAlign: TextAlign.center,
                    titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                    titleSize: FontSize.s16,
                    titleColor:widget.editAdData.forSale? ColorManager.grey:ColorManager.black),
              ),
            ),








          ],
        ),
      ),
      if(!widget.editAdData.forSale)
        const AppSizeBox(height: 10,),
      if(!widget.editAdData.forSale)
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
                    widget.editAdData.monthly=true;
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
                    color: widget.editAdData.monthly? ColorManager.white:ColorManager.textGrey,
                  ),
                  child: AppText(
                      title:'Monthly'.tr() ,
                      titleAlign: TextAlign.center,
                      titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                      titleSize: FontSize.s16,
                      titleColor:!widget.editAdData.monthly? ColorManager.grey: ColorManager.black),
                ),
              ),

              InkWell(
                onTap: (){
                  setState(() {
                    widget.editAdData.monthly=false;
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
                    color: widget.editAdData.monthly==false? ColorManager.white:ColorManager.textGrey,
                  ),
                  child: AppText(
                      title:'Annual'.tr() ,
                      titleAlign: TextAlign.center,
                      titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                      titleSize: FontSize.s16,
                      titleColor:widget.editAdData.monthly? ColorManager.grey:ColorManager.black),
                ),
              ),








            ],
          ),
        )
    ],
  );
}


}
