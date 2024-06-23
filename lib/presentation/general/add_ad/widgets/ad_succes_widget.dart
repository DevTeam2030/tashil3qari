part of'widgetImports.dart';


class AdSuccesWidget extends StatelessWidget {
final String title,message;
  const AdSuccesWidget({super.key, required this.title, required this.message});

@override
Widget build(BuildContext context) {
  return Center(
      child: Material(
        borderRadius: BorderRadius.circular(RadiusManager.r20),
        child: Container(
          height: .5.sh,
          width: .9.sw,
          constraints: BoxConstraints(
            minHeight: .3.sh,
            maxHeight: .7.sh,
            minWidth: .9.sw,
            maxWidth: .9.sw,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(ImageManager.successAd2,height: 140,fit: BoxFit.fill,),
              const AppSizeBox(height: 18,),
              AppText(title:title,
                titleSize: FontSize.s18, titleAlign: TextAlign.center,
                titleColor: ColorManager.text,
                titleHeight: 1.3,
                fontWeightType: FontWeightType.semiBold,
                titleMaxLines: 3,),
              const AppSizeBox(height: 16,),
              AppText(title:message,
                titleSize: FontSize.s16, titleAlign: TextAlign.center,
                titleColor: ColorManager.primary,
                titleHeight: 1.3,
                fontWeightType: FontWeightType.semiBold,
                titleMaxLines: 3,),
            ],
          ),
        ),
      ));
}
}
