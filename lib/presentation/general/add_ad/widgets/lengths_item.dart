part of'widgetImports.dart';


class LengthsItem extends StatelessWidget {
  final TextEditingController spaceController1 ;
  final TextEditingController spaceController2 ;
  final String title1 ,title2 ,title;
  final bool enabled ;
  const LengthsItem({
    Key? key,
   required this.spaceController1,
   required this.spaceController2,
   required this.title1,
   required this.title2,
   required this.title,
    this.enabled=true

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(

      // margin: EdgeInsets.only(top: 110),
      padding: const EdgeInsets.symmetric(
          vertical: PaddingManager.p10, horizontal: PaddingManager.p16),
      width: 1.0.sw,
      // height: 45,
      constraints: BoxConstraints(
        minHeight: 45,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RadiusManager.r12),
        color:ColorManager.textGrey,
        // color:ColorManager.white,
        // boxShadow: Constants.kBoxShadow
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            title: title+' :',
            titleSize: FontSize.s16,
            titleAlign: TextAlign.start,
            titleColor:
            ColorManager.black,
            fontWeightType: FontWeightType.regular,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
               width: 65,
                height: 32,
                child:     DefaultTextFormField(
                  controller: spaceController1,
                  enabled: enabled,
                  hintTitle: title1,
                  labelTitle: title1,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.number,
                  hintFontSize: FontSize.s12,
                  hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                  textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                  textSize: FontSize.s12,
                  fillColor: ColorManager.white,
                  borderColor: ColorManager.white,
                  borderRadius: RadiusManager.r16,
                  validator: (v) => v.toString().isEmpty?null:
                  Validator().validateEmpty(value: v.toString(),message: 'required'.tr()),
                ),),
              const AppSizeBox(width: 4,),
              AppText(
                title: title1,
                titleSize: FontSize.s14,
                titleAlign: TextAlign.end,
                titleColor:
                ColorManager.black,
                fontWeightType: FontWeightType.regular,
              ),
            ],
          ),
          Icon(Icons.close,color:  ColorManager.black,size: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 65,
                height: 32,
                child:     DefaultTextFormField(
                  controller: spaceController2,
                  enabled: enabled,
                  hintTitle: title2,
                  labelTitle: title2,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.number,
                  hintFontSize: FontSize.s12,
                  hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                  textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                  textSize: FontSize.s12,
                  fillColor: ColorManager.white,
                  borderColor: ColorManager.white,
                  borderRadius: RadiusManager.r16,
                  validator: (v) =>v.toString().isEmpty?null:
                  Validator().validateEmpty(value: v.toString(),message: 'required'.tr()),
                ),),
              const AppSizeBox(width: 4,),
              AppText(
                title: title2,
                titleSize: FontSize.s14,
                titleAlign: TextAlign.end,
                titleColor:
                ColorManager.black,
                fontWeightType: FontWeightType.regular,
              ),
            ],
          )
        ],
      ),
    );

  }


}
