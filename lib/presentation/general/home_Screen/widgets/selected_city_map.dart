part of'widget_imports.dart';

class SelectedCityMap extends StatelessWidget {
  final HomeData homeData;
  const SelectedCityMap({Key? key,required this.homeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Align(
        alignment:Constants.isArabic? Alignment.topRight:Alignment.topLeft,
        child: ValueListenableBuilder(valueListenable: homeData.selectedCity,
            builder: (context, value, child) =>value==null?const AppSizeBox(width: 0,):Container(
              margin: const EdgeInsets.all(20.0),
              constraints: BoxConstraints(
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

              child: InkWell(
                onTap: (){
                  homeData.showCitiesMarkers=true;
                  homeData.selectedCity.value=null;
                  // homeData.showAllMap=true;
                  homeData.mapType= MapType.normal;
                  context.read<HomeProvider>().properties=[];
                  homeData.initDataCitiesMarkers(context: context,isNotify: true,
                      afterBuildCitiesMarkers:(){});
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: AppText(
                          title: value.name,
                          titleAlign: TextAlign.start,
                          titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                          titleSize: FontSize.s14,titleColor: ColorManager.white),
                    ),
                    AppSizeBox(width: 4,),
                     Icon(Icons.close,color: ColorManager.white,size: 14),
                  ],
                ),
              ),
            )
        ),
      );


  }

}
