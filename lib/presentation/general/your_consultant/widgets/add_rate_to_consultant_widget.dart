part of 'widgets_imports.dart';

class AddRateToConsultantWidget extends StatefulWidget {
  final int consultantId;
  const AddRateToConsultantWidget({super.key, required this.consultantId, });

  @override
  State<AddRateToConsultantWidget> createState() => _AddRateToConsultantWidgetState();
}

class _AddRateToConsultantWidgetState extends State<AddRateToConsultantWidget> {
  final formKey = GlobalKey<FormState>();
  TextEditingController rateController = TextEditingController();
double rate=5;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    rateController.dispose();
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
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              width: 1.0.sw,
              constraints: BoxConstraints(minHeight: 100, maxHeight: .7.sh),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(RadiusManager.r14),
                color: ColorManager.white,
              ),
              // height: 200,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BuildRateWidget(rate: rate,readOnly: false,iconSize: 25,
                    onChange: (v)=>setState(() => rate=v,)),
                    const AppSizeBox(height: 20),
                    MoreLineTextFormField(
                      controller: rateController,
                      hintTitle: 'Add your rating'.tr(),
                      labelTitle:  'Add your rating'.tr(),
                      textInputType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      hintFontSize: FontSize.s12,
                      hintStyle: getAppTextStyle(
                          titleColor: ColorManager.textField,
                          fontWeightType: FontWeightType.medium,
                          titleSize: FontSize.s12,
                          underline: false),
                      textStyle: getAppTextStyle(
                          titleColor: ColorManager.icons,
                          fontWeightType: FontWeightType.medium,
                          titleSize: FontSize.s12,
                          underline: false),
                      textSize: FontSize.s12,
                      fillColor: ColorManager.textGrey,
                      borderColor: ColorManager.textGrey,
                      maxLines: 4,
                      validator: (v) => Validator().validateEmpty(
                        value: v.toString(),
                      ),
                    ),
                    const AppSizeBox(height: AppSize.s20),
                    MyTextButton(
                        title: 'send'.tr(),
                        size: Size(.5.sw, 40),
                        radius: 8,
                        fontWeightType: FontWeightType.medium,
                        titleSize: FontSize.s14,
                        primaryColor: ColorManager.primary,
                        titleColor: ColorManager.white,
                        onPressed: () {
                          Navigator.pop(context);
                          if (formKey.currentState!.validate()) {
                            context.read<ConsultantProvider>().addRateToConsultant(
                                context: context,
                                consultantId: widget.consultantId,
                                rate: rate,
                                comment: rateController.text);
                          }
                        }),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
