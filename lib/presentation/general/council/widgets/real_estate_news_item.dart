part of 'widgets_imports.dart';

class RealEstateNewsItem extends StatelessWidget {
  final CouncilData councilData;
  final PostModel post;

  const RealEstateNewsItem(
      {super.key, required this.councilData, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(

          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          width: 1.0.sw,
          // height: 140,
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(RadiusManager.r22),
            color: ColorManager.white,
          ),
          child: Column(
            children: [

              AdvisorNewsDataItem(
                post: post,
                isPost: true,
                councilData: councilData,
              ),


              const AppSizeBox(height: 8,),

              // AppText(
              //   title: post.post,
              //   titleSize: FontSize.s12,
              //   titleMaxLines: 10,
              //   titleAlign: TextAlign.start,
              //   titleColor: ColorManager.newsText,
              //   titleHeight: 1.4,
              //   fontWeightType: FontWeightType.medium,
              // ),

              Linkify(
                onOpen: (link) async {
                UrlLauncherMethods.launchURL(url: link.url);
                },
                text: post.post,
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
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Row(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //
              //           SvgPicture.asset(ImageManager.likeSvg,height: 18,width: 18),
              //           const AppSizeBox(width: 10,),
              //           Stack(
              //             children: [
              //
              //               for(var item in [3,2,1])
              //                 Padding(
              //                   padding:  EdgeInsets.only(right:item==[3,2,1].last?
              //                   0:14.0*(item)),
              //                   child: CachedImage(
              //                     url:'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg',
              //                     height: 35,width: 35,
              //                     fit: BoxFit.cover,
              //                     border: Border.all(color: ColorManager.white,width: 2),
              //                     boxShape: BoxShape.circle,
              //                   ),
              //                 ),
              //
              //
              //             ],
              //           )
              //
              //         ],
              //       ),
              //
              //       SvgPicture.asset(ImageManager.likeSvg,height: 18,width: 18,color: ColorManager.red,),
              //     ],
              //   ),
              // ),

              if(post.userId != Constants.userDataModel!.id)
              const AppSizeBox(height: 20,),
              if(post.userId != Constants.userDataModel!.id)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [



                   // InkWell(
                   //   onTap: (){
                   //     if(post.like)return;
                   //     context.read<CouncilProvider>().likePost(context: context, post: post, isLike: true);
                   //   },
                   //   child: Row(
                   //     crossAxisAlignment: CrossAxisAlignment.center,
                   //     children: [
                   //      if(post.likesCounter>0)
                   //        AppText(
                   //          title: '(${post.likesCounter}) ',
                   //          titleSize: FontSize.s12,
                   //          titleMaxLines: 10,
                   //          titleAlign: TextAlign.start,
                   //          titleColor: ColorManager.newsText,
                   //          titleHeight: 1.4,
                   //          fontWeightType: FontWeightType.medium,
                   //        ),
                   //       post.like?
                   //       SvgPicture.asset(ImageManager.likeSvg,height: 22,width: 22,):
                   //       Transform.rotate(angle: 9.39,
                   //         child: SvgPicture.asset(ImageManager.disLikeSvg,height: 22,width: 22,),),
                   //     ],
                   //   )
                   // ),
                   //
                   //
                   //    Container(
                   //      margin: EdgeInsets.symmetric(horizontal: 6),
                   //      height: 24,
                   //      width: 2,
                   //      color: ColorManager.divider,
                   //    ),
                   //    InkWell(
                   //        onTap: (){
                   //          if(post.disLike)return;
                   //          context.read<CouncilProvider>().likePost(context: context, post: post, isLike: false);
                   //        },
                   //      child:Row(
                   //        crossAxisAlignment: CrossAxisAlignment.center,
                   //        children: [
                   //          if(post.likesCounter>0)
                   //            AppText(
                   //              title: '(${post.likesCounter}) ',
                   //              titleSize: FontSize.s12,
                   //              titleMaxLines: 10,
                   //              titleAlign: TextAlign.start,
                   //              titleColor: ColorManager.newsText,
                   //              titleHeight: 1.4,
                   //              fontWeightType: FontWeightType.medium,
                   //            ),
                   //          post.disLike?
                   //          Transform.rotate(angle: -9.39,
                   //            child: SvgPicture.asset(ImageManager.likeSvg,height: 22,width: 22,color: ColorManager.primary),):
                   //          SvgPicture.asset(ImageManager.disLikeSvg,height: 22,width: 22, ),
                   //        ],
                   //      )
                   //    ),
                   //
                   //    Container(
                   //      margin: EdgeInsets.symmetric(horizontal: 6),
                   //      height: 24,
                   //      width: 2,
                   //      color: ColorManager.divider,
                   //    ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CallIcon(phoneNo: post.userPhone),
                          const AppSizeBox(width: 10,),
                          ChatIcon(receiverType: UserType.consultant,
                              receiverName: post.userName,
                              receiverImage: post.userImage,
                              // propertyId: null,
                              propertyId: null,
                              receiverId: post.userId),


                        ],
                      ),
                    ],
                  ),
                ),
              const AppSizeBox(height: 4,),

            ],
          ),
        ),

        Divider(thickness: 1, color: ColorManager.divider,),
      ],
    );
  }
}
