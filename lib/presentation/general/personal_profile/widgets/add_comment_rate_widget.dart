part of'widgets_imports.dart';


class AddCommentToRateWidget extends StatefulWidget {
  final int rateId ;
  const AddCommentToRateWidget({super.key,required this.rateId});

  @override
  State<AddCommentToRateWidget> createState() => _AddCommentToRateWidgetState();
}

class _AddCommentToRateWidgetState extends State<AddCommentToRateWidget> {
  final formKey = GlobalKey<FormState>();
  TextEditingController reasonController = TextEditingController();
@override
  void initState() {
  super.initState();

  }

  @override
  void dispose() {
    reasonController.dispose();
    super.dispose();

  }



@override
Widget build(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        borderRadius: BorderRadius.circular(RadiusManager.r14),
        color: ColorManager.white,
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 12,horizontal: 14),
            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 4),
            width: 1.0.sw,
            constraints:  BoxConstraints(
                minHeight: 100,
                maxHeight: .7.sh
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(RadiusManager.r14),
              color: ColorManager.white,
            ),
            // height: 200,
            child:  Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        title:'yourComment'.tr(),
                        titleMaxLines: 1,
                        titleSize: FontSize.s16,
                        titleAlign: TextAlign.center,
                        titleColor: ColorManager.black,
                        fontWeightType: FontWeightType.medium,
                      ),
                    ],
                  ),

                  const AppSizeBox(height: AppSize.s20),


                  MoreLineTextFormField(
                      controller: reasonController,
                      hintTitle: 'WriteYourComment'.tr(),
                      labelTitle: 'WriteYourComment'.tr(),
                      textInputType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      hintFontSize: FontSize.s12,
                      hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                      textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                      textSize: FontSize.s12,
                      fillColor: ColorManager.textGrey,
                      borderColor: ColorManager.textGrey,
                      maxLines: 4,
                    validator: (v) => Validator().validateEmpty(value: v.toString(),),
                  ),
                  const AppSizeBox(height: AppSize.s20),
                  MyTextButton(title: 'send'.tr(),
                      size: Size( .5.sw,  40),
                      radius: 8,
                      fontWeightType: FontWeightType.medium,
                      titleSize: FontSize.s14,
                      primaryColor: ColorManager.primary,
                      titleColor: ColorManager.white,
                      onPressed: (){
                        Navigator.pop(context);
                        if(formKey.currentState!.validate()){
                          // context.read<CouncilProvider>().reportConsultant(context: context, consultantId: widget.consultantId,
                          // message: reasonController.text);
                        }

                      }),
                ],
              ),
            )
        ),
      ),
    ),
  );
}


}
