part of'widgets_imports.dart';


class HomeMapAuctionButton extends StatelessWidget {
  final HomeMapProvider provider;
  final  Function(bool) onTap;
  const HomeMapAuctionButton({super.key,required this.provider,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:Constants.isArabic? Alignment.bottomRight:Alignment.bottomLeft,
      child: Container(
        width: 120,
        height: 40,
        decoration: Utils.returnDropdownButtonDecoration(ColorManager.primary,
          ColorManager.primary,10),
        margin:  const EdgeInsets.only(bottom: 80,right: 10,left: 10),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: provider.showAuctionOnMap?
            InkWell(
              splashColor: ColorManager.white,
              highlightColor:ColorManager.white ,
              onTap: ()=>onTap(false) ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                      title:'all'.tr(),
                      // title:'advertisements'.tr(),
                      titleAlign: TextAlign.start,
                      titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                      titleSize: FontSize.s14,titleColor: ColorManager.white)
                ],

              ),
            )
                :InkWell(
              splashColor: ColorManager.white,
              highlightColor:ColorManager.white ,
              onTap: ()=>onTap(true) ,
              child: Row(
                children: [

                  CircleAvatar(
                    radius: 16,
                    backgroundColor: ColorManager.white,
                    child: SvgPicture.asset(ImageManager.auctionSvg,height: 18,width: 18,color:ColorManager.primary ,),
                  ),
                  const AppSizeBox(width: 8,),
                  AppText(
                      title:'Auctions'.tr(),
                      titleAlign: TextAlign.start,
                      titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                      titleSize: FontSize.s14,titleColor: ColorManager.white)
                ],

              ),
            ),
      ),
    );
  }
}

