part of 'widgets_imports.dart';

class RealEstateOpportunityItem extends StatelessWidget {
  final CouncilData councilData;
  final PostModel opportunity;
  const RealEstateOpportunityItem({super.key, required this.councilData, required this.opportunity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(

          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          width: 1.0.sw,
          // height: 140,
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(RadiusManager.r22),
            color: ColorManager.white,
          ),
          child: Column(
            children: [

              AdvisorNewsDataItem(
                post: opportunity,
                isPost: false,
                councilData: councilData,
              ),



              const AppSizeBox(height: 8,),

              // AppText(
              //   title:opportunity.post,
              //   titleSize: FontSize.s12,
              //   titleMaxLines: 10,
              //   titleAlign: TextAlign.start,
              //   titleColor: ColorManager.newsText ,
              //   titleHeight: 1.4,
              //   fontWeightType: FontWeightType.medium,
              // ),

              Linkify(
                onOpen: (link) async {
                  UrlLauncherMethods.launchURL(url: link.url);
                },
                text: opportunity.post,
                style:getAppTextStyle(
                  titleHeight: 1.4,
                  titleSize: FontSize.s12,
                  titleColor: ColorManager.newsText,
                  fontWeightType: FontWeightType.medium,
                ),
                linkStyle: getAppTextStyle(
                    titleHeight: 1.4,
                    titleSize: FontSize.s12,
                    titleColor: ColorManager.textPrimaryColor,
                    fontWeightType: FontWeightType.medium,
                    underline: true
                ),
              ),
              if(opportunity.image.isNotEmpty)
              Container(
                height: 220,width: 1.0.sw,
                padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 10),
                child: Stack(
                  children: [
                    CachedImage(
                      url:opportunity.image,
                      height: 200,width: 1.0.sw,
                      fit: BoxFit.cover,
                      borderRadius: BorderRadius.circular(RadiusManager.r16),
                    ),
                    // Align(
                    //   alignment: Alignment.bottomCenter,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(16.0),
                    //     child: Row(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Row(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //
                    //             Container(
                    //                 height: 35,width: 35,
                    //                 padding: const EdgeInsets.all(2),
                    //                 alignment: Alignment.center,
                    //                 decoration: BoxDecoration(
                    //                   color: ColorManager.transparent,
                    //                   border: Border.all(color: ColorManager.white,width: 2),
                    //                   borderRadius: BorderRadius.circular(18),
                    //                 ),
                    //                 child: Column(
                    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //                   children: [
                    //                     SvgPicture.asset(ImageManager.likeSvg,height: 16,width: 16),
                    //                     AppText(
                    //                       title:'+10',
                    //                       titleSize: FontSize.s6,
                    //                       titleMaxLines: 10,
                    //                       titleAlign: TextAlign.start,
                    //                       titleColor: ColorManager.white ,
                    //                       titleHeight: 1.4,
                    //                       fontWeightType: FontWeightType.medium,
                    //                     ),
                    //                   ],
                    //                 )),
                    //             const AppSizeBox(width: 10,),
                    //             Stack(
                    //               children: [
                    //
                    //                 for(var item in [3,2,1])
                    //                   Padding(
                    //                     padding:  EdgeInsets.only(right:item==[3,2,1].last?
                    //                     0:14.0*(item)),
                    //                     child: CachedImage(
                    //                       url:'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg',
                    //                       height: 35,width: 35,
                    //                       fit: BoxFit.cover,
                    //                       border: Border.all(color: ColorManager.white,width: 2),
                    //                       boxShape: BoxShape.circle,
                    //                     ),
                    //                   ),
                    //
                    //
                    //               ],
                    //             )
                    //
                    //           ],
                    //         ),
                    //
                    //         Container(
                    //             height: 35,width: 35,
                    //             padding: const EdgeInsets.all(2),
                    //             alignment: Alignment.center,
                    //             decoration: BoxDecoration(
                    //               color: ColorManager.transparent,
                    //               border: Border.all(color: ColorManager.white,width: 2),
                    //               borderRadius: BorderRadius.circular(18),
                    //             ),
                    //             child:    Column(
                    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //               children: [
                    //                 SvgPicture.asset(ImageManager.likeSvg,height: 16,width: 16,color: ColorManager.red,),
                    //                 AppText(
                    //                   title:'0',
                    //                   titleSize: FontSize.s6,
                    //                   titleMaxLines: 10,
                    //                   titleAlign: TextAlign.start,
                    //                   titleColor: ColorManager.white ,
                    //                   titleHeight: 1.4,
                    //                   fontWeightType: FontWeightType.medium,
                    //                 ),
                    //
                    //               ],
                    //             ),),
                    //
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),


              if(opportunity.userId!=Constants.userDataModel!.id)
                const AppSizeBox(height: 20,),
              if(opportunity.userId!=Constants.userDataModel!.id)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [


                      // InkWell(
                      //   onTap: (){
                      //     if(opportunity.like)return;
                      //     context.read<CouncilProvider>().likeOpportunity(context: context, opportunity: opportunity, isLike: true);
                      //   },
                      //   child: Row(
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: [
                      //       if(opportunity.likesCounter>0)
                      //         AppText(
                      //           title: '(${opportunity.likesCounter}) ',
                      //           titleSize: FontSize.s12,
                      //           titleMaxLines: 10,
                      //           titleAlign: TextAlign.start,
                      //           titleColor: ColorManager.newsText,
                      //           titleHeight: 1.4,
                      //           fontWeightType: FontWeightType.medium,
                      //         ),
                      //       opportunity.like?
                      //       SvgPicture.asset(ImageManager.likeSvg,height: 22,width: 22,):
                      //       Transform.rotate(angle: 9.39,
                      //         child: SvgPicture.asset(ImageManager.disLikeSvg,height: 22,width: 22,),),
                      //     ],
                      //   )
                      // ),
                      //
                      //
                      // Container(
                      //   margin: EdgeInsets.symmetric(horizontal: 6),
                      //   height: 24,
                      //   width: 2,
                      //   color: ColorManager.divider,
                      // ),
                      // InkWell(
                      //   onTap: (){
                      //     if(opportunity.disLike)return;
                      //     context.read<CouncilProvider>().likeOpportunity(context: context, opportunity: opportunity, isLike: false);
                      //   },
                      //   child:Row(
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: [
                      //       if(opportunity.disLikesCounter>0)
                      //         AppText(
                      //           title: '(${opportunity.disLikesCounter}) ',
                      //           titleSize: FontSize.s12,
                      //           titleMaxLines: 10,
                      //           titleAlign: TextAlign.start,
                      //           titleColor: ColorManager.newsText,
                      //           titleHeight: 1.4,
                      //           fontWeightType: FontWeightType.medium,
                      //         ),
                      //       opportunity.disLike?
                      //       Transform.rotate(angle: -9.39,
                      //         child: SvgPicture.asset(ImageManager.likeSvg,height: 22,width: 22,color: ColorManager.primary),):
                      //       SvgPicture.asset(ImageManager.disLikeSvg,height: 22,width: 22, ),
                      //     ],
                      //   )
                      // ),
                      //
                      // Container(
                      //   margin: EdgeInsets.symmetric(horizontal: 6),
                      //   height: 24,
                      //   width: 2,
                      //   color: ColorManager.divider,
                      // ),



                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CallIcon(phoneNo: opportunity.userPhone),
                          const AppSizeBox(width: 10,),
                          ChatIcon(receiverType: UserType.consultant,
                              receiverName: opportunity.userName,
                              receiverImage: opportunity.userImage,
                              isOpportunity: true,
                              propertyId: opportunity.id,
                              receiverId: opportunity.userId),


                        ],
                      ),
                    ],
                  ),
                ),
              const AppSizeBox(height: 4,),

            ],
          ),
        ),

        Divider(thickness: 1,color: ColorManager.divider,),
      ],
    );
  }
}
