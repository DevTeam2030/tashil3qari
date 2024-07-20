part of'widgets_imports.dart';

class RatingConsultantWidget extends StatelessWidget {
  final haveAnswer;
  const RatingConsultantWidget({super.key,required this.haveAnswer});

@override
Widget build(BuildContext context) {
  return    Container(
    margin: const EdgeInsets.symmetric(vertical: 6),
    padding: EdgeInsets.all(16),
    width: 0.28.sw,
    // height: 90,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(RadiusManager.r12),
      color: ColorManager.divider,
      border: Border.all(color: ColorManager.textGrey,width: 1),
      // boxShadow: kElevationToShadow[4],
      // color: Theme.of(context).bottomAppBarColor,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        BuildRateWidget(rate: 4.5,readOnly: true,iconSize: 25),
        const AppSizeBox(height: 8,),
        AppText(
            title: 'elsayed fahmy',
            titleAlign: TextAlign.center,
            titleMaxLines: 1,fontWeightType: FontWeightType.bold,
            titleSize: FontSize.s14,titleColor: ColorManager.black),

        const AppSizeBox(height: 8,),
        AppText(
            title: 'مستشار جيد انصحكم بالتعامل معه',
            titleAlign: TextAlign.center,
            titleMaxLines: 1,fontWeightType: FontWeightType.regular,
            titleSize: FontSize.s12,titleColor: ColorManager.notificationsBody),

        if(haveAnswer)Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppSizeBox(height: 12,),
            AppText(
                title: 'elsayed fahmy',
                titleAlign: TextAlign.center,
                titleMaxLines: 1,fontWeightType: FontWeightType.bold,
                titleSize: FontSize.s14,titleColor: ColorManager.textPrimaryColor),

            const AppSizeBox(height: 8,),
            AppText(
                title: 'مستشار جيد انصحكم بالتعامل معه',
                titleAlign: TextAlign.center,
                titleMaxLines: 1,fontWeightType: FontWeightType.regular,
                titleSize: FontSize.s12,titleColor: ColorManager.textPrimaryColor.withOpacity(.7)),
          ],
        )

          ///TODO: chek if my consult or no
        else InkWell(
          onTap: (){
            LoadingDialog().widgetAlertDialog(context: context, widget: AddCommentToRateWidget(rateId: 10,));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(
                  title: 'Comment'.tr(),
                  titleAlign: TextAlign.center,
                  titleMaxLines: 1,fontWeightType: FontWeightType.regular,
                  titleSize: FontSize.s12,titleColor: ColorManager.primary),
              const AppSizeBox(width: 4,),
             Icon(Icons.arrow_forward,color: ColorManager.primary,size: 16),

            ],
          ),
        )
      ],
    ),
  );
}
}
