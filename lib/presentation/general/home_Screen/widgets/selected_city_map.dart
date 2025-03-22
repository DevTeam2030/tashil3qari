part of'widget_imports.dart';

// class SelectedCityMap extends StatelessWidget {
//   const SelectedCityMap({super.key,});
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       Align(
//         alignment:Constants.isArabic? Alignment.topRight:Alignment.topLeft,
//         child: ValueListenableBuilder(valueListenable:  context.read<HomeProvider>().selectedCity,
//             builder: (context, value, child) =>value==null?const AppSizeBox(width: 0,):Container(
//               margin: const EdgeInsets.all(20.0),
//               constraints: const BoxConstraints(
//                 maxWidth: 200,
//                 minWidth: 80
//               ),
//               padding: const EdgeInsets.symmetric(
//                   vertical: PaddingManager.p10, horizontal: PaddingManager.p16),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(RadiusManager.r12),
//                 color:ColorManager.primary,
//                 // boxShadow: Constants.kBoxShadow
//               ),
//
//               child: InkWell(
//                 onTap: (){
//                   CacheHelper.removeData(key:ConstantsKeys.selectedCityIdnMapKey);
//                   context.read<HomeProvider>().showAllSamePosition=true;
//                   context.read<HomeProvider>().showCitiesMarkers=true;
//                   context.read<HomeProvider>().selectedCity.value=null;
//                   // provider.showAllMap=true;
//
//                   context.read<HomeProvider>().mapType= MapType.normal;
//                   context.read<HomeProvider>().properties=[];
//
//                   context.read<HomeProvider>().initDataCitiesMarkers(context: context,notify: true);
//                 },
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Flexible(
//                       child: AppText(
//                           title: value.name,
//                           titleAlign: TextAlign.start,
//                           titleMaxLines: 1,fontWeightType: FontWeightType.medium,
//                           titleSize: FontSize.s14,titleColor: ColorManager.white),
//                     ),
//                     const AppSizeBox(width: 4,),
//                      Icon(Icons.close,color: ColorManager.white,size: 14),
//                   ],
//                 ),
//               ),
//             )
//         ),
//       );
//
//
//   }
//
// }
