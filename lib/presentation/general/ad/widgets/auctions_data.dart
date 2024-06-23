part of 'widgets_imports.dart';

class AuctionsData extends StatelessWidget {
  final PropertyInfoModel propertyInfo;
  const AuctionsData({super.key, required this.propertyInfo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> MyRoute().navigate(context: context, route:  BidScreen(adId: propertyInfo.id,)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: AppText(
              title: 'Auction details'.tr(),
              titleMaxLines: 2,
              titleHeight: 1.3,
              titleSize: FontSize.s16,
              titleAlign: TextAlign.start,
              titleColor: ColorManager.black,
              fontWeightType: FontWeightType.extraBold,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 14),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            width: 1.0.sw,
            // height: 80,
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 14,
                            backgroundColor: ColorManager.white,
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: ColorManager.primary,
                              child: SvgPicture.asset(ImageManager.applyAuctions),
                            ),
                          ),
                          AppSizeBox(
                            width: 6,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                title: propertyInfo.price.toString() + ' ' + propertyInfo.currency,
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

                      const AppSizeBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 14,
                            backgroundColor: ColorManager.primary,
                            child:
                            Icon(Icons.watch_later_outlined,
                              color: ColorManager.white,),
                          ),
                          AppText(
                            title: '${propertyInfo.endDurationDays} ${'days'.tr()} '+
                            '${propertyInfo.endDurationHours} ${'hour'.tr()}'+
                            '${propertyInfo.endDurationMintues} ${'minute'.tr()}',
                            titleMaxLines: 2,
                            titleHeight: 1.3,
                            titleSize: FontSize.s9,
                            titleAlign: TextAlign.start,
                            titleColor: ColorManager.white,

                          ),

                        ],
                      )
                    ],
                  ),
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
                                title: propertyInfo.minimumAuction.toString() + ' ' + propertyInfo.currency,
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

                      const AppSizeBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              if(propertyInfo.auctionsUsers.isNotEmpty)
                              Stack(
                                children: [
                                  CachedImage(
                                    url:propertyInfo.auctionsUsers.first.userImage,
                                    height: 35,width: 35,
                                    fit: BoxFit.cover,
                                    border: Border.all(color: ColorManager.white,width: 2),
                                    boxShape: BoxShape.circle,
                                  ),

                                  if(propertyInfo.auctionsUsers.length>=2)
                                    Padding(
                                      padding:  EdgeInsets.only(right:8),
                                      child: CachedImage(
                                        url:propertyInfo.auctionsUsers[1].userImage,
                                        height: 35,width: 35,
                                        fit: BoxFit.cover,
                                        border: Border.all(color: ColorManager.white,width: 2),
                                        boxShape: BoxShape.circle,
                                      ),
                                    ),


                                  if(propertyInfo.auctionsUsers.length>=3)
                                    Padding(
                                      padding:  EdgeInsets.only(right:8*2),
                                      child: CachedImage(
                                        url:propertyInfo.auctionsUsers[2].userImage,
                                        height: 35,width: 35,
                                        fit: BoxFit.cover,
                                        border: Border.all(color: ColorManager.white,width: 2),
                                        boxShape: BoxShape.circle,
                                      ),
                                    ),
                                  if(propertyInfo.auctionsUsers.length>=4)
                                    Padding(
                                      padding:  EdgeInsets.only(right:8*3),
                                      child: CachedImage(
                                        url:propertyInfo.auctionsUsers[3].userImage,
                                        height: 35,width: 35,
                                        fit: BoxFit.cover,
                                        border: Border.all(color: ColorManager.white,width: 2),
                                        boxShape: BoxShape.circle,
                                      ),
                                    ),
                                  // for(var item in [4,3,2,1])
                                  //   Padding(
                                  //   padding:  EdgeInsets.only(right:item==[4,3,2,1].last?
                                  //   0:8.0*(item)),
                                  //   child: CachedImage(
                                  //     url:'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg',
                                  //     height: 35,width: 35,
                                  //     fit: BoxFit.cover,
                                  //     border: Border.all(color: ColorManager.white,width: 2),
                                  //     boxShape: BoxShape.circle,
                                  //   ),
                                  // ),


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
                                   title: '+${propertyInfo.auctionsUsers.length}',
                                   titleMaxLines: 2,
                                   titleHeight: 1.3,
                                   titleSize: FontSize.s10,
                                   titleAlign: TextAlign.start,
                                   titleColor: ColorManager.white,

                                 ),
                               ),
                             ),

                             if(propertyInfo.isLive)
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
        ],
      ),
    );
  }
}
