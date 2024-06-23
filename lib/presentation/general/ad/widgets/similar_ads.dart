part of'widgets_imports.dart';


class SimilarAds extends StatelessWidget {
  final AdData adData;
  const SimilarAds({super.key,required this.adData});

  @override
  Widget build(BuildContext context) {
    return context.read<ProductProvider>().similarProperties.isEmpty?const AppSizeBox(width: 0,):Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 20),
          child: AppText(
            title:'Similar ads'.tr(),
            titleMaxLines: 2,
            titleHeight: 1.3,
            titleSize: FontSize.s16,
            titleAlign: TextAlign.start,
            titleColor: ColorManager.black,
            fontWeightType: FontWeightType.extraBold,
          ),
        ),


        const AppSizeBox(height: 10,),


        SizedBox(
          width: 1.0.sw,
          height: 280,
          child: ListView.builder(
            itemCount:  context.read<ProductProvider>().similarProperties.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>  AdGridItem(width: .45.sw,property:  context.read<ProductProvider>().similarProperties[index],),),
        )





      ],
    );
  }
}
