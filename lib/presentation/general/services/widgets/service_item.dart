part of'widgets_imports.dart';

class ServicesItem extends StatelessWidget {
  final String title,value,image;
  final bool showSoon;
  const ServicesItem({super.key,required this.title,required this.value,required this.image,this.showSoon=true});

@override
Widget build(BuildContext context) {
  return   Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Material(
      elevation: 4,
      color: ColorManager.white,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 8),
        width: 1.0.sw,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
                radius: 25,
                backgroundColor: ColorManager.textGrey,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                    image,
                    // color: ColorManager.white,
                    // height: 14,
                    // width: 14,
                  ),
                )
            ),
            const AppSizeBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                    title: title,
                    titleAlign: TextAlign.start,
                    titleMaxLines: 1,fontWeightType: FontWeightType.regular,
                    titleSize: FontSize.s18,titleColor: ColorManager.black),

                const AppSizeBox(height: 4),
                SizedBox(
                  width: .6.sw,
                  child: AppText(
                      title: value,
                      titleAlign: TextAlign.start,
                      titleHeight: 1.1,
                      titleMaxLines: 10,fontWeightType: FontWeightType.regular,
                      titleSize: FontSize.s12,titleColor: ColorManager.black),
                ),
              ],
            ),
          ],
        ),

            if(showSoon)
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppText(
                    title: 'soon'.tr(),
                    titleAlign: TextAlign.start,
                    titleMaxLines: 1,fontWeightType: FontWeightType.regular,
                    titleSize: FontSize.s14,titleColor: ColorManager.primary),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
}
