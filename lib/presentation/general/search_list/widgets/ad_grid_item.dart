import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/cach_image.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import 'package:tashil_agary/utilites/route_manager.dart';

import '../../../../app/enums.dart';
import '../../../../app/utils.dart';
import '../../../../domain/model/models/general_property_model.dart';
import '../../../../domain/model/models/user_ads_model.dart';
import '../../../../providers/profile_provider.dart';
import '../../../../utilites/color_manager.dart';
import '../../../../utilites/font_manager.dart';
import '../../../../utilites/styles_manager.dart';
import '../../../../utilites/values_manager.dart';
import '../../ad/ad_imports.dart';
import '../../add_bid/bid_imports.dart';
import '../../edit_ad/edit_ad_imports.dart';


class AdGridItem extends StatefulWidget {
  final GeneralPropertyModel property;
  final UserAdsModel? userAd;
  final bool showFavorite,showEdit,isRealEstateProfile;
  final double? width;
  final Function(GeneralPropertyModel property)? onFavoriteTap;
  const AdGridItem({super.key,required this.property,this.onFavoriteTap,
    this.userAd,
    this.showFavorite=true,this.showEdit=false,this.width,this.isRealEstateProfile=false});

  @override
  State<AdGridItem> createState() => _AdGridItemState();
}

class _AdGridItemState extends State<AdGridItem> {
  var images=[ImageManager.spaceSvg,ImageManager.bedSvg,ImageManager.bathroomsSvg,ImageManager.kitchensSvg,];
  var values=[];
  @override
  void initState() {
    super.initState();

    values=[widget.property.propertySize, widget.property.roomsNo,widget.property.bathroomsNo,widget.property.kitchensNo];
  }
@override
Widget build(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 4,horizontal: 4),
    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
    width:  widget.width?? 1.0.sw,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(RadiusManager.r14),
      color: ColorManager.textGrey,
    ),
    height: 130,
    child: InkWell(
      onTap: ()async{
    var x=Navigator.push(context, MaterialPageRoute(builder: (context) =>
        AdScreen(propertyId: widget.property.id,ad: widget.userAd),));
    if(widget.userAd!=null&&widget.showEdit)
    context.read<ProfileProvider>().getUserAds(context: context, notify: false);

    },
      // onTap: ()=>MyRoute().navigate(context: context, route: AdScreen(propertyId: widget.property.id,)),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              SizedBox(
                height: 130.0,
                // width: 120,
                child: Stack(
                  children: [
                    CachedImage(
                      url:widget.property.image,
                      height: 130.0,
                      // width: 120,
                      fit: BoxFit.cover,
                      borderRadius: BorderRadius.circular(RadiusManager.r14),
                    ),

                    if(widget.showFavorite)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          InkWell(
                            splashColor: ColorManager.white,
                            highlightColor:ColorManager.white ,
                            onTap: (){
                              if(widget.onFavoriteTap!=null){
                                widget.onFavoriteTap!(widget.property);
                              }

                            } ,
                            child: CircleAvatar(
                              radius: 14,
                              backgroundColor: ColorManager.white,
                              child: Icon(
                                Icons.favorite,
                                color: widget.property.wishlist?ColorManager.red: ColorManager.grey,
                                size: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    if(widget.showEdit&&widget.isRealEstateProfile==false&&widget.userAd!=null)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:8,vertical: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                          InkWell(
                          splashColor: ColorManager.white,
                          highlightColor:ColorManager.white ,
                          onTap: ()async{
                            // var x=Navigator.push(context, MaterialPageRoute(builder: (context) =>
                            //     EditAdScreen(userAd: widget.userAd!,),));
                            // context.read<ProfileProvider>().getUserAds(context: context, notify: false);
                            MyRoute().navigate(context: context, route:  EditAdScreen(userAd: widget.userAd!,));
                          },
                          child: CircleAvatar(
                                radius: 16,
                                backgroundColor: ColorManager.primary,
                                child: Icon(
                                  Icons.edit,
                                  color: ColorManager.white,
                                  size: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    if(widget.showEdit&&widget.isRealEstateProfile&&widget.userAd!=null)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:8,vertical: 35),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              // height: 20,
                              // width: 20,
                              margin: const EdgeInsets.all(4),
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(RadiusManager.r4),
                                color: ColorManager.primary,
                              ),
                              child: InkWell(
                                  splashColor: ColorManager.white,
                                  highlightColor:ColorManager.white ,
                                  onTap: ()async{
                                    // var x=Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                    //     EditAdScreen(userAd: widget.userAd!,),));
                                    context.read<ProfileProvider>().getUserAds(context: context, notify: false);
                                    // MyRoute().navigate(context: context, route:  EditAdScreen(userAd: widget.userAd!,));
                                  } ,
                                  child: Icon(
                                    Icons.edit,
                                    color: ColorManager.white,
                                    size: 12,
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 120,
                            // height: 40,
                            // alignment: Alignment.center,
                            decoration: Utils.returnDropdownButtonDecoration(ColorManager.primary,
                                ColorManager.primary,10),
                            margin:  const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 6),
                            child: InkWell(
                                splashColor: ColorManager.white,
                                highlightColor:ColorManager.white ,
                                onTap: (){
                                  // MyRoute().navigate(context: context, route: const SearchListScreen());
                                } ,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if(widget.property.isAuction) AppText(
                                      title:'Bid price'.tr()+' :',
                                      titleSize: FontSize.s8,
                                      titleAlign: TextAlign.start,
                                      titleColor: ColorManager.white,
                                      fontWeightType: FontWeightType.extraBold,
                                    ),
                                    Expanded(
                                      child: AppText(
                                          title: '${widget.property.price} ${widget.property.currency}',
                                          titleAlign: TextAlign.center,
                                          titleMaxLines: 2,fontWeightType: FontWeightType.medium,
                                          titleSize: FontSize.s10,titleColor: ColorManager.white),
                                    ),
                                  ],
                                )
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
              const AppSizeBox(height: 8,),
              Row(
                children: [
                  Flexible(
                    child: AppText(
                      title:widget.property.propertyTitle,
                      titleMaxLines: 1,
                      titleSize: FontSize.s14,
                      titleAlign: TextAlign.start,
                      titleColor: ColorManager.black,
                      fontWeightType: FontWeightType.medium,
                    ),
                  ),
                ],
              ),


              const AppSizeBox(height: 2,),
              Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
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

                  Icon(Icons.star,size: 10,color: ColorManager.starColor,),
                  AppText(
                    title: '${widget.property.rate}',
                    titleSize: FontSize.s8,
                    titleAlign: TextAlign.start,
                    titleColor: ColorManager.black,
                    fontWeightType: FontWeightType.extraBold,
                  )
                ],
              ),


              const AppSizeBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  for(var item in images)Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Row(
                      children: [
                        SvgPicture.asset(item,height: 12,width: 12,),
                        const AppSizeBox(width: 4,),
                        AppText(
                          title:values[images.indexOf(item)].toString(),
                          titleSize: FontSize.s10,
                          titleAlign: TextAlign.start,
                          titleColor: ColorManager.textField,
                          fontWeightType: FontWeightType.extraBold,
                        ),
                      ],
                    ),
                  ),



                ],
              ),

              if(widget.property.isAuction)
                Padding(
                  padding:const EdgeInsets.only(bottom: 4,top: 4),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(radius: 2,backgroundColor:  ColorManager.green,),
                          const AppSizeBox(width: 2,),
                          AppText(
                            title:'Remaining until the end of the auction'.tr(),
                            titleSize: FontSize.s8,
                            titleMaxLines: 1,
                            titleHeight: 1.4,
                            titleAlign: TextAlign.start,
                            titleColor: ColorManager.notificationsBody,
                            fontWeightType: FontWeightType.medium,
                          ),
                        ],
                      ),

                      const AppSizeBox(height: 4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const AppText(
                            title:'(',
                            titleSize: FontSize.s8,
                            titleMaxLines: 1,
                            titleHeight: 1.4,
                            titleAlign: TextAlign.start,
                            titleColor: ColorManager.notificationsBody,
                            fontWeightType: FontWeightType.medium,
                          ),

                          AppText(
                             title:widget.property.endDuration,
                            // title:'11${'hour'.tr()} : 35${'minute'.tr()} : 47${'second'.tr()}',
                            titleSize: FontSize.s8,
                            titleMaxLines: 1,
                            titleHeight: 1.4,
                            titleAlign: TextAlign.start,
                            titleColor: ColorManager.primary,
                            fontWeightType: FontWeightType.medium,
                          ),
                          AppText(
                            title:')',
                            titleSize: FontSize.s8,
                            titleMaxLines: 1,
                            titleHeight: 1.4,
                            titleAlign: TextAlign.start,
                            titleColor: ColorManager.notificationsBody,
                            fontWeightType: FontWeightType.medium,
                          ),
                        ],
                      ),

                      const AppSizeBox(height: 4,),
                      if(Constants.userDataModel!=null&&Constants.userDataModel!.id!=widget.property.userId)
                      Container(
                        height: 30,
                        width: .4.sw,
                        // margin: const EdgeInsets.only(top: 3),
                        decoration:Utils.returnDropdownButtonDecoration(
                            widget.property.isAuctionBefore? ColorManager.primary.withOpacity(.5): ColorManager.primary,
                            widget.property.isAuctionBefore? ColorManager.primary.withOpacity(.5): ColorManager.primary,
                            RadiusManager.r8
                        ),
                        child: InkWell(
                          onTap: (){
                            if(Utils.checkIsLogin()&&!widget.property.isAuctionBefore)
                            MyRoute().navigate(context: context, route:  BidScreen(adId: widget.property.id,
                            isBidBefore: widget.property.isAuctionBefore,));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText(title:widget.property.isAuctionBefore?'subscribed'.tr():'Bid now'.tr(),
                                titleSize: FontSize.s10,
                                titleMaxLines: 2,
                                titleAlign: TextAlign.start,
                                titleColor: ColorManager.white,
                                fontWeightType: FontWeightType.medium,),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              // if(widget.isRealEstateProfile)
              //   Padding(
              //     padding:const EdgeInsets.only(bottom: 4,top: 4),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         AppText(
              //           title:'PublicationDate'.tr()+' : 2023/11/30',
              //           titleSize: FontSize.s9,
              //           titleMaxLines: 1,
              //           titleHeight: 1.4,
              //           titleAlign: TextAlign.start,
              //           titleColor: ColorManager.notificationsBody,
              //           fontWeightType: FontWeightType.medium,
              //         ),
              //         AppText(
              //           title:'LatestUpdate'.tr()+' : 2023/11/30',
              //           titleSize: FontSize.s9,
              //           titleMaxLines: 1,
              //           titleHeight: 1.4,
              //           titleAlign: TextAlign.start,
              //           titleColor: ColorManager.notificationsBody,
              //           fontWeightType: FontWeightType.medium,
              //         ),
              //         AppText(
              //           title:'Views'.tr()+' : 500',
              //           titleSize: FontSize.s9,
              //           titleMaxLines: 1,
              //           titleHeight: 1.4,
              //           titleAlign: TextAlign.start,
              //           titleColor: ColorManager.notificationsBody,
              //           fontWeightType: FontWeightType.medium,
              //         ),
              //
              //
              //       ],
              //     ),
              //   ),

            ],
          ),


        ],
      ),
    ),
  );
}


}
