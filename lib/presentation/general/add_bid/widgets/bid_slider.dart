part of'widgets_imports.dart';


class BidSlider extends StatelessWidget {
  final   AuctionDataModel auctionData;
  final int propertyId;
  const BidSlider({super.key,required this.auctionData,required this.propertyId});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> wishlist = ValueNotifier<bool>(auctionData.wishlist);
    double height= .4.sh;
    return Container(
      height: height,
      width: 1.0.sw,
      color: Colors.white,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: CarouselSlider(
              options: CarouselOptions(
                height:height,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: false,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  // setState(() {
                  //   _current = index;
                  // });
                },
              ),
              items:auctionData.gallery.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return CachedImage(
                      url: i,
                      fit: BoxFit.cover,
                    );
                  },
                );
              }).toList(),
            ),
          ),









          Align(
            alignment: Alignment.topCenter,
            child:Padding(
              padding: const EdgeInsets.only(top: 40,left: 16,right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackAppBarButton(),

                  Row(
                    children: [
                      CircleAvatar(
                          radius: 20,
                          backgroundColor:ColorManager.white,
                          child: Icon(Icons.file_upload_outlined,size: 16,color: ColorManager.black,)
                      ),

                      const AppSizeBox(width: 6,),
                      ValueListenableBuilder(valueListenable: wishlist,
                        builder: (context, value, child) =>    InkWell(
                          onTap: ()async{
                            if(Utils.checkIsLogin()){
                              value?context.read<WishlistProvider>().unWishlist(context: context,adId: propertyId):
                              context.read<WishlistProvider>().wishlist(context: context,adId: propertyId);
                              wishlist.value=!value;
                            }
                          },
                          child: CircleAvatar(
                              radius: 20,
                              backgroundColor:ColorManager.notificationsBody,
                              child: Icon(Icons.favorite,size: 16,color: ColorManager.white,)
                          ),
                        ),)
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child:  Container(
              margin: const EdgeInsets.symmetric(horizontal: 14),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
              width: 1.0.sw,
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(RadiusManager.r14),
                color: ColorManager.primary,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child:    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          title: 'Bid price'.tr(),
                          titleMaxLines: 2,
                          titleHeight: 1.3,
                          titleSize: FontSize.s14,
                          titleAlign: TextAlign.start,
                          titleColor: ColorManager.white,
                          fontWeightType: FontWeightType.extraBold,
                        ),
                        AppText(
                          title: auctionData.price + ' ' + auctionData.currency,
                          titleMaxLines: 2,
                          titleHeight: 1.3,
                          titleSize: FontSize.s14,
                          titleAlign: TextAlign.start,
                          titleColor: ColorManager.white,
                        ),
                      ],
                    )
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    color: ColorManager.white.withOpacity(.7),
                    height: 120,
                    width: .5,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  title: 'Starting price'.tr(),
                                  titleMaxLines: 2,
                                  titleHeight: 1.3,
                                  titleSize: FontSize.s14,
                                  titleAlign: TextAlign.start,
                                  titleColor: ColorManager.white,
                                  fontWeightType: FontWeightType.extraBold,
                                ),
                                AppText(
                                  title:  auctionData.minimumAuction + ' ' + auctionData.currency,
                                  titleMaxLines: 2,
                                  titleHeight: 1.3,
                                  titleSize: FontSize.s14,
                                  titleAlign: TextAlign.start,
                                  titleColor: ColorManager.white,
                                ),
                              ],
                            )
                          ],
                        ),




                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            if(auctionData.auctionsUsers.isNotEmpty)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                              Stack(
                                children: [

                                  CachedImage(
                                    url:auctionData.auctionsUsers.first.userImage,
                                    height: 35,width: 35,
                                    fit: BoxFit.cover,
                                    border: Border.all(color: ColorManager.white,width: 2),
                                    boxShape: BoxShape.circle,
                                  ),

                                 if(auctionData.auctionsUsers.length>=2)
                                  Padding(
                                        padding:  EdgeInsets.only(right:8),
                                        child: CachedImage(
                                          url:auctionData.auctionsUsers[1].userImage,
                                          height: 35,width: 35,
                                          fit: BoxFit.cover,
                                          border: Border.all(color: ColorManager.white,width: 2),
                                          boxShape: BoxShape.circle,
                                        ),
                                      ),


                                  if(auctionData.auctionsUsers.length>=3)
                                    Padding(
                                      padding:  EdgeInsets.only(right:8*2),
                                      child: CachedImage(
                                        url:auctionData.auctionsUsers[2].userImage,
                                        height: 35,width: 35,
                                        fit: BoxFit.cover,
                                        border: Border.all(color: ColorManager.white,width: 2),
                                        boxShape: BoxShape.circle,
                                      ),
                                    ),
                                  if(auctionData.auctionsUsers.length>=4)
                                    Padding(
                                      padding:  EdgeInsets.only(right:8*3),
                                      child: CachedImage(
                                        url:auctionData.auctionsUsers[3].userImage,
                                        height: 35,width: 35,
                                        fit: BoxFit.cover,
                                        border: Border.all(color: ColorManager.white,width: 2),
                                        boxShape: BoxShape.circle,
                                      ),
                                    ),

                                  // for(var item in auctionData.auctionsUsers)
                                  //   Padding(
                                  //     padding:  EdgeInsets.only(
                                  //       right:item==auctionData.auctionsUsers.first?0: 8.0*(auctionData.auctionsUsers.indexOf(item)+6)
                                  //     ),
                                  //     child: CachedImage(
                                  //       url:'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg',
                                  //       height: 35,width: 35,
                                  //       fit: BoxFit.cover,
                                  //       border: Border.all(color: ColorManager.white,width: 2),
                                  //       boxShape: BoxShape.circle,
                                  //     ),
                                  //   ),
                                ],
                              ),

                                if(false)
                                Stack(
                                  children: [
                                    
                                    for(var item in auctionData.auctionsUsers)
                                      Padding(
                                        padding:  EdgeInsets.only(right:12.0*auctionData.auctionsUsers.indexOf(item)),
                                        // item==auctionData.auctionsUsers.last?
                                        // 0:8.0*
                                        //     ((auctionsUsers.indexOf(item)+10))),
                                        child: CachedImage(
                                          url:'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg',
                                          height: 35,width: 35,
                                          fit: BoxFit.cover,
                                          border: Border.all(color: ColorManager.white,width: 2),
                                          boxShape: BoxShape.circle,
                                        ),
                                      ),
                                    // for(var item in [4,3,2,1])
                                    //   Padding(
                                    //     padding:  EdgeInsets.only(right:item==[4,3,2,1].last?
                                    //     0:8.0*(item)),
                                    //     child: CachedImage(
                                    //       url:'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg',
                                    //       height: 35,width: 35,
                                    //       fit: BoxFit.cover,
                                    //       border: Border.all(color: ColorManager.white,width: 2),
                                    //       boxShape: BoxShape.circle,
                                    //     ),
                                    //   ),


                                  ],
                                )

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CircleAvatar(
                                  radius: 16,
                                  backgroundColor: ColorManager.white,
                                  child: CircleAvatar(
                                    radius: 14,
                                    backgroundColor: ColorManager.primary,
                                    child:AppText(
                                      title: '+${auctionData.auctionsUsers.length}',
                                      titleMaxLines: 2,
                                      titleHeight: 1.3,
                                      titleSize: FontSize.s10,
                                      titleAlign: TextAlign.start,
                                      titleColor: ColorManager.white,

                                    ),
                                  ),
                                ),

                                if(auctionData.isLive)
                                AppText(
                                  title: 'Live now'.tr(),
                                  titleMaxLines: 2,
                                  titleHeight: 1.3,
                                  titleSize: FontSize.s11,
                                  titleAlign: TextAlign.start,
                                  titleColor: ColorManager.white,

                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),



        ],
      )
    );
  }
}
