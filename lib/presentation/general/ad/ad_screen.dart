part of'ad_imports.dart';


class AdScreen extends StatefulWidget {
 // final bool isBid;
 final int? notificationId; //coming from notification to accept or refuse ad
 final int propertyId ;
 final UserAdsModel? ad;
  const AdScreen({Key? key,required this.propertyId,this.notificationId, this.ad}) : super(key: key);

  @override
  State<AdScreen> createState() => _AdScreenState();
}

class _AdScreenState extends State<AdScreen> {

  AdData addAdtData=AdData();



  @override
  void initState() {
    super.initState();
    if(mounted) context.read<ProductProvider>().getPropertyInfo(context: context,propertyId: widget.propertyId,);
    // getLocation();
  }


  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationsProvider>(
      builder: (context, notificationsProvider, child) => Consumer<ProductProvider>(
        builder: (context, provider, child) => ScreenLoading(
            isLoading: provider.isLoading||notificationsProvider.isLoading,
            height: 1.0.sh,
            width: 1.0.sw,
            child: provider.isLoading||provider.propertyInfo==null? Scaffold(
              body: Container(
                color:ColorManager.white,
                  height: 1.0.sh,
                  width: 1.0.sw,
              ),
            ):
            Scaffold(
              body: SizedBox(
                  height: 1.0.sh,
                  width: 1.0.sw,

                  child:SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        AddSlider(propertyInfo: provider.propertyInfo!,),
                        AddDetails(propertyInfo: provider.propertyInfo!),
                        if(Constants.userDataModel==null||Constants.userDataModel!.id!= provider.propertyInfo!.userId)
                        AdvertiserData(propertyInfo: provider.propertyInfo!),
                        if(provider.propertyInfo!.isAuction)AuctionsData(propertyInfo: provider.propertyInfo!,),

                        AdInformations(provider: provider,propertyInfo: provider.propertyInfo!,
                            distance: provider.distance,currentLocation: provider.currentLocation,ad: widget.ad),
                        if(Constants.isLogin&&Constants.userDataModel!.isUser==false&&widget.notificationId!=null)
                          AcceptRejectAd(propertyId: widget.propertyId,notificationId: widget.notificationId!,)
                        else
                          SimilarAds(adData: addAdtData,),


                        const AppSizeBox(height: 20,),
                      ],
                    ),
                  )


              ),
            )
        ),
      )
    );
  }
}
