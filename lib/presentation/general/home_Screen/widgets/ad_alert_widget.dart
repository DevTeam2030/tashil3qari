part of'widget_imports.dart';


class AdAlertWidget extends StatefulWidget {
  final GeneralPropertyModel property;
  final Function afterOnTap;
  const AdAlertWidget({super.key, required this.property,required this.afterOnTap});

  @override
  State<AdAlertWidget> createState() => _AdAlertWidgetState();
}

class _AdAlertWidgetState extends State<AdAlertWidget> {
  ValueNotifier<int> page = ValueNotifier<int>(0);
  ValueNotifier<bool> wishlist = ValueNotifier<bool>(false);
  var images=[ImageManager.spaceSvg,ImageManager.bedSvg,ImageManager.bathroomsSvg,ImageManager.kitchensSvg,];
  var values=[];
@override
  void initState() {
  super.initState();
  wishlist.value=widget.property.wishlist;
  values=[widget.property.propertySize, widget.property.roomsNo,widget.property.bathroomsNo,widget.property.kitchensNo];
  }
  @override
  void dispose() {
    super.dispose();

  }



@override
Widget build(BuildContext context) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.only(bottom:100.0),
      child: Material(
        color: ColorManager.primary,
        child:  InkWell(
          onTap: (){
            Navigator.pop(context);
            widget.afterOnTap();
            MyRoute().navigate(context: context, route:  AdScreen(propertyId: widget.property.id));
            // MyRoute().navigate(context: context, route:  LanguageScreen());
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 12,horizontal: 14),
            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 4),
            width: 1.0.sw,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(RadiusManager.r14),
              color: ColorManager.textGrey,
            ),
            // height: 200,
            child: Stack(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 1,
                      child:Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 90.0,width: 120,
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: 90.0,width: 120,
                                  child: PageView.builder(
                                      itemCount: widget.property.gallery.length,
                                      onPageChanged: (index) {
                                        page.value = index;
                                      },
                                      itemBuilder: (context, index) => CachedImage(
                                    url:widget.property.gallery[index],
                                    height: 90.0,width: 120,
                                    fit: BoxFit.cover,
                                    borderRadius: BorderRadius.circular(RadiusManager.r14),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      ValueListenableBuilder(valueListenable: wishlist,
                                          builder: (context, value, child) => InkWell(
                                            splashColor: ColorManager.white,
                                            highlightColor:ColorManager.white ,
                                            onTap: (){
                                              if(Utils.checkIsLogin()){
                                                value?context.read<WishlistProvider>().unWishlist(context: context,adId: widget.property.id):
                                                context.read<WishlistProvider>().wishlist(context: context,adId: widget.property.id);
                                                wishlist.value=!value;
                                              }

                                            } ,
                                            child: CircleAvatar(
                                              radius: 12,
                                              backgroundColor: ColorManager.white,
                                              child: Icon(
                                                Icons.favorite,
                                                color: value?ColorManager.red: ColorManager.grey,
                                                size: 12,
                                              ),
                                            ),
                                          ),)
                                    ],
                                  ),
                                ),
                                if(widget.property.type=='sale'||widget.property.type=='rent')
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        // width: 120,
                                        // height: 40,
                                        // alignment: Alignment.center,
                                        decoration: Utils.returnDropdownButtonDecoration(ColorManager.icons2,
                                            ColorManager.icons2,8),
                                        margin:  const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                                        child: InkWell(
                                            splashColor: ColorManager.white,
                                            highlightColor:ColorManager.white ,
                                            onTap: (){
                                              // MyRoute().navigate(context: context, route: const SearchListScreen());
                                            } ,
                                            child: AppText(
                                                title:widget.property.type=='sale'?'ForSale'.tr():'ForRent'.tr(),
                                                titleAlign: TextAlign.center,
                                                titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                                                titleSize: FontSize.s8,titleColor: ColorManager.white)
                                        ),
                                      ),
                                    ],
                                  ),
                                ),


                                if(widget.property.isAuction)
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CircleAvatar(
                                        radius: 12,
                                        backgroundColor: ColorManager.primary,
                                        child: InkWell(
                                            splashColor: ColorManager.white,
                                            highlightColor:ColorManager.white ,
                                            onTap: (){
                                              // if(Utils.checkIsLogin(context))
                                              //   AutoRouter.of(context).push( const NotificationsRoute());
                                            } ,
                                            child: SvgPicture.asset(ImageManager.applyAuctions)
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),


                          const AppSizeBox(height: 4,),
                          ValueListenableBuilder(valueListenable: page,
                              builder: (context, value, child) =>    Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: widget.property.gallery.map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return  Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                        child: CircleAvatar(
                                          radius: value==widget.property.gallery.indexOf(i)?2.5:1.5,
                                          backgroundColor:value==widget.property.gallery.indexOf(i)?ColorManager.primary: ColorManager.grey,
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ))

                        ],
                      ),
                    ),
                    const AppSizeBox(width: 4,),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: AppText(
                              title:widget.property.propertyTitle,
                              titleMaxLines: 1,
                              titleSize: FontSize.s16,
                              titleAlign: TextAlign.start,
                              titleColor: ColorManager.black,
                              fontWeightType: FontWeightType.medium,
                            ),
                          ),


                          // const AppSizeBox(height: 2,),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.location_on,size: 12,color: ColorManager.icons,),
                              AppText(
                                title:widget.property.country +' , '+widget.property.city,
                                titleSize: FontSize.s8,
                                titleAlign: TextAlign.start,
                                titleColor: ColorManager.black,
                                titleHeight: 1.4,
                                fontWeightType: FontWeightType.medium,
                              ),
                            ],
                          ),

                          // const AppSizeBox(height: 2,),
                          Padding(
                            padding: Constants.isArabic?const EdgeInsets.only(left: 20,):const EdgeInsets.only(right: 20,),
                            child: AppText(
                              title:widget.property.propertyDescription,
                              titleSize: FontSize.s8,
                              titleMaxLines: 4,
                              titleHeight: 1.4,
                              titleAlign: TextAlign.start,
                              titleColor: ColorManager.black,
                              fontWeightType: FontWeightType.medium,
                            ),
                          ),
                          // const AppSizeBox(height: 2,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              for(var item in images)Row(
                                children: [
                                  SvgPicture.asset(item,height: 12,width: 12,),
                                  const AppSizeBox(width: 2,),
                                  AppText(
                                    title:values[images.indexOf(item)].toString(),
                                    titleSize: FontSize.s10,
                                    titleAlign: TextAlign.start,
                                    titleColor: ColorManager.textField,
                                    fontWeightType: FontWeightType.extraBold,
                                  ),
                                ],
                              ),


                            
                            ],
                          ),
                          const AppSizeBox(height: 4,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [

                              AppText(
                                title:widget.property.price.toString()+' '+widget.property.currency,
                                titleSize: FontSize.s16,
                                titleAlign: TextAlign.start,
                                titleColor: ColorManager.black,
                                fontWeightType: FontWeightType.extraBold,
                              ),


                            
                            ],
                          )
                        ],
                      ),
                    ),
                    const AppSizeBox(width: 4,),
                    // Expanded(
                    //   flex: 1,
                    //   child: Column(
                    //     mainAxisSize: MainAxisSize.min,
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [
                    //
                    //     ],
                    //   ),
                    // ),




                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.star,size: 16,color: ColorManager.starColor,),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: AppText(
                        title: '${widget.property.rate}',
                        titleSize: FontSize.s10,
                        titleAlign: TextAlign.start,
                        titleColor: ColorManager.black,
                        fontWeightType: FontWeightType.extraBold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}


}
