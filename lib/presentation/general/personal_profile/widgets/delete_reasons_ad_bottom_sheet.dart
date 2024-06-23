part of'widgets_imports.dart';



class DeleteReasonsAdBottomSheet extends StatefulWidget {
  final PersonalProfileData personalProfileData;
  final UserAdsModel ad;
  const DeleteReasonsAdBottomSheet({super.key, required this.personalProfileData,required this.ad});


  @override
  State<DeleteReasonsAdBottomSheet> createState() => _DeleteReasonsAdBottomSheetState();
}

class _DeleteReasonsAdBottomSheetState extends State<DeleteReasonsAdBottomSheet> {

  ReasonModel selectedReason = Constants.settingModel.reasons.first;
  @override
  void initState() {
    super.initState();   }
  @override
  void dispose() {
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
                const AppSizeBox(height: AppSize.s20,),

                AppText(
                  title: 'DeleteAd'.tr(),
                  titleSize: FontSize.s22,
                  titleAlign: TextAlign.center,
                  titleColor: ColorManager.black,
                  fontWeightType: FontWeightType.bold,
                ),


                const AppSizeBox(height: 16),

               Container(
                 padding: const EdgeInsets.symmetric(horizontal: 10),
                 width: 1.0.sw,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     for(var reason in Constants.settingModel.reasons)
                       Padding(
                         padding: const EdgeInsets.symmetric(vertical: 8),
                         child: InkWell(
                           onTap: () {
                             if(selectedReason!=reason)setState(()=>selectedReason=reason);
                           },
                           child: Row(
                             mainAxisSize: MainAxisSize.min,
                             children: [
                               CircleAvatar(
                                 radius:10,
                                 backgroundColor:selectedReason ==reason ?ColorManager.primary: ColorManager.textGrey,
                                 child: CircleAvatar(
                                   radius: 8,
                                   backgroundColor:ColorManager.white,
                                   child: CircleAvatar(
                                     radius:6,
                                     backgroundColor:selectedReason ==reason ?ColorManager.primary: ColorManager.textGrey,
                                   ),
                                 ),
                               ),

                               const AppSizeBox(width: 4,),
                               Flexible(
                                 child: AppText(
                                   title: reason.name,
                                   titleSize: FontSize.s16,
                                   titleAlign: TextAlign.start,
                                   titleMaxLines: 4,
                                   titleColor:
                                   ColorManager.black,
                                   fontWeightType: FontWeightType.regular,
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ),
                   ],
                 ),
               ),


                const AppSizeBox(height: 20,),


                MyTextButton(title: 'Delete'.tr(),
                    size: Size( .8.sw,  47),
                    radius: 6,
                    fontWeightType: FontWeightType.bold,
                    titleSize: FontSize.s18,
                    primaryColor: ColorManager.primary,
                    titleColor: ColorManager.white,
                    onPressed: ()async{
                  Navigator.pop(context);
                  widget.personalProfileData.deleteProperty(ad: widget.ad, reasonId: selectedReason.id);
                    }),
                const AppSizeBox(height: 14,),

                InkWell(
                  onTap: ()=>Navigator.pop(context),
                  child: AppText(
                    title: 'Cancel'.tr(),
                    titleSize: FontSize.s14,
                    titleAlign: TextAlign.center,
                    titleColor: ColorManager.black,
                    fontWeightType: FontWeightType.medium,
                  ),
                ),
                const AppSizeBox(height: 20,),
              ],
            ),
          )),

    );
  }
}
