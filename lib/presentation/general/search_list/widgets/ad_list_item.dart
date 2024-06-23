import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/cach_image.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/image_manager.dart';

import '../../../../app/contants.dart';
import '../../../../app/enums.dart';
import '../../../../app/utils.dart';
import '../../../../domain/model/models/general_property_model.dart';
import '../../../../domain/model/models/user_ads_model.dart';
import '../../../../utilites/color_manager.dart';
import '../../../../utilites/font_manager.dart';
import '../../../../utilites/route_manager.dart';
import '../../../../utilites/styles_manager.dart';
import '../../../../utilites/values_manager.dart';
import '../../ad/ad_imports.dart';
import '../../add_bid/bid_imports.dart';
import '../../edit_ad/edit_ad_imports.dart';

class AdListItem extends StatefulWidget {
  final GeneralPropertyModel property;
  final bool showFavorite,showEdit,isRealEstateProfile;
  final UserAdsModel? userAd;
  final Function(GeneralPropertyModel property)? onFavoriteTap;
  const AdListItem({super.key,this.showFavorite=true,this.showEdit=false,this.isRealEstateProfile=false,
  required this.property,this.onFavoriteTap,this.userAd});

  @override
  State<AdListItem> createState() => _AdListItemState();
}

class _AdListItemState extends State<AdListItem> {
double height=0;
double width=0;
var images=[ImageManager.spaceSvg,ImageManager.bedSvg,ImageManager.bathroomsSvg,ImageManager.kitchensSvg,];
var values=[];
@override
void initState() {
  super.initState();
  height=widget.property.isAuction? 165:(widget.isRealEstateProfile?160:130);
  width=widget.property.isAuction? .32.sw:.37.sw;

  values=[widget.property.propertySize, widget.property.roomsNo,widget.property.bathroomsNo,widget.property.kitchensNo];
}

@override
Widget build(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 6,),
    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
    width: 1.0.sw,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(RadiusManager.r14),
      color: ColorManager.textGrey,
    ),
    height:height,
    child:  InkWell(
      onTap: ()=>MyRoute().navigate(context: context, route: AdScreen(propertyId: widget.property.id,)),
      child: Stack(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: width,
                child:Stack(
                  children: [
                    CachedImage(
                      url:widget.property.image,
                      height: height,
                      width: .4.sw,
                      fit: BoxFit.cover,
                      borderRadius: BorderRadius.circular(RadiusManager.r14),
                    ),

                    if(widget.showFavorite)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
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
                           onTap: (){
                             // if(Utils.checkIsLogin(context))
                             MyRoute().navigate(context: context, route:  EditAdScreen(userAd: widget.userAd!,));
                           } ,
                              child: CircleAvatar(
                                radius: 14,

                                backgroundColor: ColorManager.primary,
                                child: Icon(
                                  Icons.edit,
                                  color: ColorManager.white,
                                  size: 12,
                                ),
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


                    // if(!widget.property.isAuction)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            // width: 120,
                            // height: 40,
                            // alignment: Alignment.center,
                            decoration: Utils.returnDropdownButtonDecoration(ColorManager.primary,
                                ColorManager.primary,10),
                            margin:  const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                            child: InkWell(
                                splashColor: ColorManager.white,
                                highlightColor:ColorManager.white ,
                                onTap: (){
                                  // MyRoute().navigate(context: context, route: const SearchListScreen());
                                } ,
                                child: AppText(
                                  title: widget.property.isAuction?'ForBid'.tr():(widget.property.type=='sale'?'ForSale'.tr():'ForRent'.tr()),
                                  titleAlign: TextAlign.center,
                                  titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                                  titleSize: FontSize.s12,titleColor: ColorManager.white)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ),
              const AppSizeBox(width: 4,),
              Expanded(
                flex: 5,
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


                    Padding(
                      padding: Constants.isArabic?const EdgeInsets.only(left: 20,top: 2,bottom: 4):
                      const EdgeInsets.only(right: 20,top: 2,bottom: 4),
                      child: AppText(
                        title:widget.property.propertyDescription,
                        titleSize: FontSize.s8,
                        titleMaxLines: widget.property.isAuction||widget.isRealEstateProfile?1:3,
                        titleHeight: 1.4,
                        titleAlign: TextAlign.start,
                        titleColor: ColorManager.black,
                        fontWeightType: FontWeightType.medium,
                      ),
                    ),

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

                    const AppSizeBox(height: 4,),

                    if(widget.property.isAuction)
                    Padding(
                      padding:const EdgeInsets.only(bottom: 4),
                      child: Row(
                        children: [
                          CircleAvatar(radius: 2,backgroundColor:  ColorManager.green,),
                          // AppSizeBox(width: 2,),
                          AppText(
                            title:'Remaining until the end of the auction'.tr()+'(',
                            titleSize: FontSize.s6,
                            titleMaxLines: 1,
                            titleHeight: 1.4,
                            titleAlign: TextAlign.start,
                            titleColor: ColorManager.notificationsBody,
                            fontWeightType: FontWeightType.medium,
                          ),

                          AppText(
                            title:widget.property.endDuration,
                            // title:'11${'hour'.tr()} : 35${'minute'.tr()} : 47${'second'.tr()}',
                            titleSize: FontSize.s7,
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
                    ),


                    // if(widget.isRealEstateProfile)
                    // Padding(
                    //   padding:const EdgeInsets.only(bottom: 4),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       AppText(
                    //         title:'PublicationDate'.tr()+' : 2023/11/30',
                    //         titleSize: FontSize.s9,
                    //         titleMaxLines: 1,
                    //         titleHeight: 1.4,
                    //         titleAlign: TextAlign.start,
                    //         titleColor: ColorManager.notificationsBody,
                    //         fontWeightType: FontWeightType.medium,
                    //       ),
                    //       AppText(
                    //         title:'LatestUpdate'.tr()+' : 2023/11/30',
                    //         titleSize: FontSize.s9,
                    //         titleMaxLines: 1,
                    //         titleHeight: 1.4,
                    //         titleAlign: TextAlign.start,
                    //         titleColor: ColorManager.notificationsBody,
                    //         fontWeightType: FontWeightType.medium,
                    //       ),
                    //       AppText(
                    //         title:'Views'.tr()+' : 500',
                    //         titleSize: FontSize.s9,
                    //         titleMaxLines: 1,
                    //         titleHeight: 1.4,
                    //         titleAlign: TextAlign.start,
                    //         titleColor: ColorManager.notificationsBody,
                    //         fontWeightType: FontWeightType.medium,
                    //       ),
                    //
                    //
                    //     ],
                    //   ),
                    // ),

                    if(widget.property.isAuction)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppText(
                            title:'Bid price'.tr()+' :',
                            titleSize: FontSize.s8,
                            titleAlign: TextAlign.start,
                            titleColor: ColorManager.black,
                            fontWeightType: FontWeightType.extraBold,
                          ),
                          AppText(
                            title:widget.property.price,
                            titleSize: FontSize.s12,
                            titleAlign: TextAlign.start,
                            titleColor: ColorManager.black,
                            fontWeightType: FontWeightType.extraBold,
                          ),
                          AppText(
                            title:widget.property.currency,
                            titleSize: FontSize.s10,
                            titleAlign: TextAlign.start,
                            titleColor: ColorManager.black,
                            fontWeightType: FontWeightType.extraBold,
                          ),
                        ],
                      ),
                    if(widget.property.isAuction&&!widget.isRealEstateProfile)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        Container(
                          height: 30,
                          width: 60,
                          // margin: const EdgeInsets.only(top: 3),
                          decoration:Utils.returnDropdownButtonDecoration(
                              ColorManager.primary,ColorManager.primary,RadiusManager.r8
                          ),
                          child: InkWell(
                            onTap: (){
                              MyRoute().navigate(context: context, route:  BidScreen(adId: widget.property.id,));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppText(title:'Bid now'.tr(),
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
                    )
                    else  Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AppText(
                            title:widget.property.price.toString(),
                            titleSize: FontSize.s20,
                            titleAlign: TextAlign.start,
                            titleColor: ColorManager.black,
                            fontWeightType: FontWeightType.extraBold,
                          ),
                          AppText(
                            title:widget.property.currency,
                            titleSize: FontSize.s10,
                            titleAlign: TextAlign.start,
                            titleColor: ColorManager.black,
                            fontWeightType: FontWeightType.extraBold,
                          ),
                        ],
                      ),
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
              if(widget.isRealEstateProfile==false)
              Icon(Icons.star,size: 16,color: ColorManager.starColor,),
              if(widget.isRealEstateProfile==false)
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


              if(widget.showEdit&&widget.isRealEstateProfile==true&&widget.userAd!=null)
                Container(
                  // height: 20,
                  // width: 20,
                  margin: const EdgeInsets.symmetric(horizontal:8,vertical: 50),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(RadiusManager.r4),
                    color: ColorManager.primary,
                  ),
                  child: InkWell(
                      splashColor: ColorManager.white,
                      highlightColor:ColorManager.white ,
                      onTap: (){
                        MyRoute().navigate(context: context, route:  EditAdScreen(userAd: widget.userAd!,));
                      } ,
                      child: Icon(
                        Icons.edit,
                        color: ColorManager.white,
                        size: 16,
                      )
                  ),
                ),
            ],
          ),
        ],
      ),
    ),
  );
}


}
