part of'widgets_imports.dart';


class RemainingTime extends StatefulWidget {
  final   AuctionDataModel auctionData;
  const RemainingTime({super.key,required this.auctionData});

  @override
  State<RemainingTime> createState() => _RemainingTimeState();
}

class _RemainingTimeState extends State<RemainingTime> {
  List<String>data=['days'.tr(),'hour'.tr(),'minute'.tr(),];
  List<String>times=['0','0','0'];
  @override
  void initState() {
    super.initState();
 times=[widget.auctionData.endDurationDays,widget.auctionData.endDurationHours,widget.auctionData.endDurationMintues,];
  }

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const AppSizeBox(height: 10,),
          Row(
            children: [
              const Icon(Icons.watch_later_outlined,color: ColorManager.primary,size: 22,),
              const AppSizeBox(width: 4,),
              AppText(
                title:'remaining time'.tr(),
                titleMaxLines: 2,
                titleHeight: 1.3,
                titleSize: FontSize.s18,
                titleAlign: TextAlign.start,
                titleColor: ColorManager.black,
                fontWeightType: FontWeightType.extraBold,
              ),
            ],
          ),

            const AppSizeBox(height: 8,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for(var item in data)
                Container(
                  height: 70,
                  width: 100,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(RadiusManager.r14),
                    color: ColorManager.white,
                    border: Border.all(color: ColorManager.black,width: 1)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppText(
                        title:times[data.indexOf(item)].toString(),
                        titleMaxLines: 2,
                        titleHeight: 1.3,
                        titleSize: FontSize.s28,
                        titleAlign: TextAlign.start,
                        titleColor: ColorManager.primary,
                        fontWeightType: FontWeightType.extraBold,
                      ),

                      AppText(
                        title:item,
                        titleMaxLines: 2,
                        titleHeight: 1.3,
                        titleSize: FontSize.s12,
                        titleAlign: TextAlign.start,
                        titleColor: ColorManager.black,
                        fontWeightType: FontWeightType.medium,
                      ),
                    ],
                  ),
                ),
              ],
            )



        ],
      ),
    );
  }
}
