part of'widgets_imports.dart';

class CloseAdBottomSheet extends StatefulWidget {
  final EditAdData editAdData;
  const CloseAdBottomSheet({super.key, required this.editAdData});


  @override
  State<CloseAdBottomSheet> createState() => _CloseAdBottomSheetState();
}

class _CloseAdBottomSheetState extends State<CloseAdBottomSheet> {
  String? selectedReason;
  final List<String> reasons=['Sold'.tr(),'Not wanting to sell'.tr(),'Repost another ad'.tr(),'Another'.tr(),];
  final formKey = GlobalKey<FormState>();
  TextEditingController otherController = TextEditingController();
  @override
  void initState() {

    super.initState();
  }
  @override
  void dispose() {
    otherController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Material(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(RadiusManager.r20),
          topRight: Radius.circular(RadiusManager.r20),
        ),
        color: ColorManager.white,
        child: Container(
          padding: const EdgeInsets.all(PaddingManager.p20),
          // height:  .75.sh,
          width:  1.0.sw,

          constraints: BoxConstraints(
            maxHeight: .8.sh,
            minHeight: .2.sh,
          ),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(RadiusManager.r20),
              topRight: Radius.circular(RadiusManager.r20),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [


                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      AppText(
                        title: 'PleaseChooseReason'.tr(),
                        titleSize: FontSize.s20,
                        titleAlign: TextAlign.start,
                        titleColor: ColorManager.black,
                        fontWeightType: FontWeightType.regular,
                      ),
                    ],
                  ),
                ),

                // SearchSelectLocationButton(),


                for(var item in reasons)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:6.0),
                    child: InkWell(
                      onTap: ()=>selectedReason==item?null:setState(() {
                        selectedReason=item;
                      }),
                      child:    Row(
                        children: [
                          CircleAvatar(
                            backgroundColor:selectedReason==item? ColorManager.primary:ColorManager.black,
                            radius: 6,
                            child: CircleAvatar(
                              backgroundColor: ColorManager.white,
                              radius: 5,
                              child:  CircleAvatar(
                                backgroundColor:selectedReason==item? ColorManager.primary:ColorManager.white,
                                radius: 4,

                              ),
                            ),
                          ),
                          const AppSizeBox(width: 10,),
                          AppText(
                            title: item,
                            titleSize: FontSize.s14,
                            titleAlign: TextAlign.start,
                            titleColor: ColorManager.black,
                            fontWeightType: FontWeightType.regular,
                          ),
                        ],
                      ),
                    ),
                  ),
                const AppSizeBox(height: AppSize.s14,),

                if(selectedReason==reasons.last)
                  MoreLineTextFormField(
                    controller: otherController,
                    hintTitle: 'reasonClosingAd'.tr(),
                    labelTitle: 'reasonClosingAd'.tr(),
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.multiline,
                    hintFontSize: FontSize.s12,
                    hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                    textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                    textSize: FontSize.s12,
                    fillColor: ColorManager.white,
                    borderColor: ColorManager.textField,
                    borderRadius: RadiusManager.r10,
                    maxLines: 3,
                    validator: (v) => Validator().validateEmpty(value: v.toString(),),
                  ),

                const AppSizeBox(height: AppSize.s14,),
                AppText(
                  title: 'closeAdMessage'.tr(),
                  titleSize: FontSize.s14,
                  titleMaxLines: 3,
                  titleAlign: TextAlign.start,
                  titleColor: ColorManager.primary,
                  fontWeightType: FontWeightType.regular,
                ),


                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyTextButton(title: 'Confirm'.tr(),
                          size: Size( .8.sw,  47),
                          radius: 6,
                          fontWeightType: FontWeightType.bold,
                          titleSize: FontSize.s18,
                          primaryColor: ColorManager.primary,
                          titleColor: ColorManager.white,
                          onPressed: (){
                        widget.editAdData.addReason(context: context);

                          }),
                    ],
                  ),
                ),

                // const AppSizeBox(height: 20,),



              ],
            ),
          )),

    );
  }
}
