part of'widgets_imports.dart';


class SelectedHomeCityMap extends StatelessWidget {
  final HomeMapProvider provider;
  const SelectedHomeCityMap({super.key,required this.provider});

  @override
  Widget build(BuildContext context) {
    return
      Align(
        alignment:Constants.isArabic? Alignment.topRight:Alignment.topLeft,
        child: provider.selectedCity==null?const AppSizeBox(width: 0,):InkWell(
            onTap: ()async{
             await  provider.onRemoveSelectedCity(context: context);
            },
          child: Container(
            margin: const EdgeInsets.all(20.0),
            constraints: const BoxConstraints(
                maxWidth: 200,
                minWidth: 80
            ),
            padding: const EdgeInsets.symmetric(
                vertical: PaddingManager.p10, horizontal: PaddingManager.p16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(RadiusManager.r12),
              color:ColorManager.primary,
              // boxShadow: Constants.kBoxShadow
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: AppText(
                      title: provider.selectedCity!.name,
                      titleAlign: TextAlign.start,
                      titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                      titleSize: FontSize.s14,titleColor: ColorManager.white),
                ),
                const AppSizeBox(width: 4,),
                Icon(Icons.close,color: ColorManager.white,size: 14),
              ],
            ),
          ),
        ),
      );


  }

}
