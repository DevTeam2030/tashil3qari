part of'widgets_imports.dart';


class AddSlider extends StatelessWidget {
  final PropertyInfoModel propertyInfo;
  const AddSlider({super.key,required this.propertyInfo});

  @override
  Widget build(BuildContext context) {
    List<String>gallery=propertyInfo.gallery.isEmpty?[propertyInfo.image]:propertyInfo.gallery;
    ValueNotifier<int> currentImageIndex = ValueNotifier<int>(0);
    ValueNotifier<bool> wishlist = ValueNotifier<bool>(propertyInfo.wishlist);
    double height= .42.sh;

    return Container(
      height: height,
      width: 1.0.sw,
      color: Colors.white,
      child: Stack(
        children: [
          CarouselSlider(
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
                currentImageIndex.value = index;
              },
            ),
            items:gallery.map((i) {
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
          if(false)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [0, 1, 2, 3].map((url) {
                int index = [0, 1, 2, 3].indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == 0 ? ColorManager.primary : ColorManager.textGrey,
                  ),
                );
              }).toList(),
            ),
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: const EdgeInsets.all(PaddingManager.p16),
              height: 25,
              width: 50,
              decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(RadiusManager.r12),
                color: ColorManager.primary
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: AppText(
                      title: '${propertyInfo.rate}',
                      titleSize: FontSize.s10,
                      titleAlign: TextAlign.start,
                      titleColor: ColorManager.white,
                      fontWeightType: FontWeightType.bold,
                    ),
                  ),
                  Icon(Icons.star,size: 12,color: ColorManager.starColor,),

                ],
              ),
            ),
          ),


          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for(int i=0;i<(gallery.length>2?2:gallery.length);i++)
                    AddImageSquare(image:gallery[i],
                      onTap: ()=>MyRoute().navigate(context: context, route: AdPhotoViewScreen(propertyInfo: propertyInfo,
                        currentImageIndex: i,)),
                    ),

                  AddImageSquare(image:gallery.last,
                    onTap: ()=>MyRoute().navigate(context: context, route: AdPhotoViewScreen(propertyInfo: propertyInfo,
                      currentImageIndex: 0,)),

                  childStack: Center(
                    child: AppText(
                      title: '+${gallery.length-(gallery.length>2?2:0)}',
                      titleSize: FontSize.s18,
                      titleAlign: TextAlign.center,
                      titleColor: ColorManager.white,
                      fontWeightType: FontWeightType.extraBold,
                    ),
                  ),
                  ),

                ],
              ),
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
                      InkWell(
                        onTap: ()async{
                          Utils.saveFile(context: context,documentUrl: gallery[currentImageIndex.value], );
                          // Utils.downloadImage(context: context,
                          // imageUrl: gallery[currentImageIndex.value],);
                        },
                        child: CircleAvatar(
                            radius: 20,
                            backgroundColor:ColorManager.white,
                            child: Icon(Icons.file_upload_outlined,size: 16,color: ColorManager.black,)
                        ),
                      ),

                      const AppSizeBox(width: 6,),
                      ValueListenableBuilder(valueListenable: wishlist,
                        builder: (context, value, child) =>    InkWell(
                          onTap: ()async{
                            if(Utils.checkIsLogin()){
                              value?context.read<WishlistProvider>().unWishlist(context: context,adId: propertyInfo.id):
                              context.read<WishlistProvider>().wishlist(context: context,adId: propertyInfo.id);
                              wishlist.value=!value;
                            }
                          },
                          child: CircleAvatar(
                              radius: 20,
                              backgroundColor:wishlist.value? ColorManager.white:ColorManager.notificationsBody,
                              child: Icon(Icons.favorite,size: 16,color:wishlist.value? ColorManager.red:ColorManager.white,)
                          ),
                        ),)

                    ],
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
