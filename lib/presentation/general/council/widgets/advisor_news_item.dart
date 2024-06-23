part of 'widgets_imports.dart';

class AdvisorNewsDataItem extends StatelessWidget {
  final PostModel post;
  final bool isPost;
  final bool showStar,showOptions,forAdd;
  final CouncilData councilData;
  const AdvisorNewsDataItem({super.key, required this.post,  this.forAdd=false, required this.isPost,this.showStar=true,required this.councilData,this.showOptions=true});

  @override
  Widget build(BuildContext context) {
    return    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedImage(
              url:post.userImage,
              height: 65,width: 65,
              fit: BoxFit.cover,
              boxShape: BoxShape.circle,
            ),

            const AppSizeBox(width: 6,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppSizeBox(height: 3,),
                Row(
                  children: [
                    SizedBox(
                      width: .3.sw,
                      child: AppText(
                          title: '${"Advisor".tr()}/ ${post.userName}.',
                          titleAlign: TextAlign.start,
                          titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                          titleSize: FontSize.s11,titleColor: ColorManager.black),
                    ),
                    const AppSizeBox(width: 4,),
                    SizedBox(
                      width: .2.sw,

                      child: AppText(
                          title:post.timeAgo,
                          titleAlign: TextAlign.start,
                          titleMaxLines: 1,fontWeightType: FontWeightType.regular,
                          titleSize: FontSize.s12,titleColor: ColorManager.black),
                    ),
                  ],
                ),
                const AppSizeBox(height: 4,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.location_on,size: 12,color: ColorManager.icons,),
                    AppText(
                      title:post.country+' , '+post.city,
                      titleSize: FontSize.s8,
                      titleAlign: TextAlign.start,
                      titleColor: ColorManager.black,
                      titleHeight: 1.4,
                      fontWeightType: FontWeightType.medium,
                    ),
                    if(showStar)
                    const AppSizeBox(width: 4,),
                    if(showStar)
                    Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Icon(Icons.star,size: 12,color: ColorManager.starColor,)),

                    if(showStar)
                    AppText(
                      title: '${post.userRate}',
                      titleSize: FontSize.s10,
                      titleAlign: TextAlign.start,
                      titleColor: ColorManager.black,
                      fontWeightType: FontWeightType.medium,
                    ),
                  ],
                ),




                const AppSizeBox(height: 4,),


              ],
            ),
          ],
        ),

        // if(showOptions&&post.userId!=Constants.userDataModel!.id)
        if(!forAdd)
          MoreCounilDropdownButton(councilData: councilData,isPost: isPost,post: post,),
        // Padding(
        //   padding: const EdgeInsets.only(bottom: 14),
        //   child: CircleAvatar(
        //       radius: 14,
        //       backgroundColor: ColorManager.textGrey,
        //       child: Icon(Icons.more_horiz,size: 20,color: ColorManager.grey1,)),
        // )
      ],
    );
  }
}
