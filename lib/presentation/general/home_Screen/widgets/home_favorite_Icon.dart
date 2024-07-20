part of'widget_imports.dart';




class HomeFavoriteIcon extends StatelessWidget {
  final HomeData homeData;
  final Function() onSatelliteSelected;
  const HomeFavoriteIcon({super.key,required this.homeData,required this.onSatelliteSelected});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:Constants.isArabic? Alignment.bottomLeft:Alignment.bottomRight,
      child: Padding(
        padding:  EdgeInsets.only(bottom: .15.sh,right: 10,left: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ValueListenableBuilder(valueListenable: homeData.selectedCity,
                builder: (context, value, child) => value==null?  AppSizeBox(height: 20,): CircleAvatar(
                  radius: 18,
                  backgroundColor: ColorManager.primary,
                  child:InkWell(
                    splashColor: ColorManager.white,
                    highlightColor:ColorManager.white ,
                    onTap: ()=>onSatelliteSelected() ,
                    child:Icon(Icons.satellite_alt,
                      color: homeData.mapType== MapType.normal?ColorManager.white:ColorManager.red,size: 18,) ,
                  ),
                ),
            ),

            AppSizeBox(height: 10,),
            CircleAvatar(
              radius: 18,
              backgroundColor: ColorManager.primary,
              child: InkWell(
                splashColor: ColorManager.white,
                highlightColor:ColorManager.white ,
                onTap: (){

                  // if(Utils.checkIsLogin())gotoIntro(context: context,currentIndexScreen: 3);
                  if(Utils.checkIsLogin())   MyRoute().navigate(context: context, route: const FavoritesScreen());
                } ,
                child: Icon(
                  Icons.favorite,
                  color: ColorManager.white,
                  size: 18,
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

