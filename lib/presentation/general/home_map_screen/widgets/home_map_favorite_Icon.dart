part of'widgets_imports.dart';




class HomeMapFavoriteIcon extends StatelessWidget {
  final HomeMapProvider provider;
  const HomeMapFavoriteIcon({super.key,required this.provider});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:Constants.isArabic? Alignment.bottomLeft:Alignment.bottomRight,
      child: Padding(
        padding:  EdgeInsets.only(bottom: .15.sh,right: 10,left: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            provider.selectedCity==null?  const AppSizeBox(height: 20,): CircleAvatar(
                  radius: 18,
                  backgroundColor: ColorManager.primary,
                  child:InkWell(
                    splashColor: ColorManager.white,
                    highlightColor:ColorManager.white ,
                    onTap: ()=>provider.onChangeMapType() ,
                    // onTap: ()=>onSatelliteSelected() ,
                    child:Icon(Icons.satellite_alt,
                      color:  provider.mapType== MapType.normal?ColorManager.white:ColorManager.red,size: 18,) ,
                  ),
                ),

            const AppSizeBox(height: 10,),
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

