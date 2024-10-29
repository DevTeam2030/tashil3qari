part of'bid_imports.dart';


class BidScreen extends StatefulWidget {
  final int adId;
  final bool isBidBefore;
  const BidScreen({Key? key,required this.adId,required this.isBidBefore}) : super(key: key);

  @override
  State<BidScreen> createState() => _BidScreenState();
}

class _BidScreenState extends State<BidScreen> {

  BidData bidData=BidData();



  @override
  void initState() {
    super.initState();
    bidData.propertyId=widget.adId;
    if(mounted) context.read<ProductProvider>().getAuctionData(context: context,propertyId: widget.adId,isNotify: false);
  }


  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, provider, child) => ScreenLoading(
          isLoading: provider.isLoading,
          height: 1.0.sh,
          width: 1.0.sw,
          child: provider.isLoading||provider.auctionData==null?const AppSizeBox(height: 0,):
          Scaffold(

            // appBar: GeneralAppBar(title: 'AddAd'.tr(),showChatNotify: false,showDivider: false),

            body: SizedBox(
                height: 1.0.sh,
                width: 1.0.sw,

                child:SingleChildScrollView(
                  child: Column(
                    children: [
                      BidSlider(auctionData: provider.auctionData!,propertyId: widget.adId),

                      if(provider.auctionData!.isLive)
                      RemainingTime(auctionData: provider.auctionData!)
                      else const AppSizeBox(height: 30,),
                      BidWidget(bidData: bidData,auctionData: provider.auctionData!,
                        isBidBefore: widget.isBidBefore,
                        propertyId: widget.adId,
                        mostAuctionUser: provider.mostAuctionUser,),



                      const AppSizeBox(height: 20,),
                    ],
                  ),
                )


            ),
          )
      ),

    );
  }
}
