part of'widgets_imports.dart';


class BidPersonWidget extends StatelessWidget {
  final bool isWin ;
  final AuctionUserModel user ;
  const BidPersonWidget({super.key,required this.isWin,required this.user});

  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        if(isWin) const AppSizeBox(height: 14,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if(isWin) Image.asset(ImageManager.winPng,width: 40,height: 40,fit: BoxFit.cover,),
                  // SvgPicture.asset(ImageManager.win,width: 40,height: 40,fit: BoxFit.cover,),

                CachedImage(
                  url:user.userImage,
                  height: 50,width: 50,
                  fit: BoxFit.cover,
                  border: Border.all(color: ColorManager.white,width: 2),
                  boxShape: BoxShape.circle,
                ),
                const AppSizeBox(width: 4,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      title:user.userName,
                      titleMaxLines: 2,
                      titleHeight: 1.3,
                      titleSize: FontSize.s14,
                      titleAlign: TextAlign.start,
                      titleColor: ColorManager.black,
                      fontWeightType: FontWeightType.extraBold,
                    ),

                    AppText(
                      title:DateTime.tryParse(user.createdAt)==null?user.createdAt:
                     ( DateFormat('yyyy-MM-dd').format(DateTime.tryParse(user.createdAt)!)+
                      '  '+DateFormat('hh:mm a').format(DateTime.tryParse(user.createdAt)!)),
                      titleSize: FontSize.s9,
                      titleAlign: TextAlign.start,
                      titleColor: ColorManager.black,
                      fontWeightType:FontWeightType.regular,
                    ),
                  ],
                ),
              ],
            ),

            AppText(
              title:user.price+' '+user.currency,
              titleSize:isWin? FontSize.s16:FontSize.s12,
              titleAlign: TextAlign.start,
              titleColor: ColorManager.black,
              fontWeightType:isWin? FontWeightType.extraBold:FontWeightType.regular,
            ),
          ],
        ),

          // const AppSizeBox(height: 4,),


        const Divider(color: ColorManager.divider, thickness: 1,)



      ],
    );
  }
}
