part of'widgets_imports.dart';

class ServicesItem extends StatelessWidget {
  final ServiceModel service;
  const ServicesItem({super.key,required this.service});

@override
Widget build(BuildContext context) {
  return   Padding(
    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
    child: Material(
      elevation: 4,
      color: ColorManager.white,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 12),
        width: 1.0.sw,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
                radius: 25,
                backgroundColor: ColorManager.textGrey,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child:CachedImage(url: service.image),
                )
            ),
            const AppSizeBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppSizeBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: AppText(
                            title: service.name,
                            titleAlign: TextAlign.start,
                            titleMaxLines: 100,fontWeightType: FontWeightType.bold,
                            titleSize: FontSize.s14,titleColor: ColorManager.black),
                      ),

                      if(service.isSoon)
                      AppText(
                          title: 'soon'.tr(),
                          titleAlign: TextAlign.end,
                          titleHeight: 1.1,
                          titleMaxLines: 10,fontWeightType: FontWeightType.medium,
                          titleSize: FontSize.s14,titleColor: ColorManager.primary),
                    ],
                  ),
                  if(service.description.isNotEmpty)
                  const AppSizeBox(height: 4),

                  if(service.description.isNotEmpty)
                  AppText(
                      title: service.description,
                      titleAlign: TextAlign.start,
                      titleHeight: 1.4,
                      titleMaxLines: 100,
                      fontWeightType: FontWeightType.regular,
                      titleSize: FontSize.s12,titleColor: ColorManager.black),



                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}
