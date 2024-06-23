part of'widgets_imports.dart';


class AddDetails extends StatelessWidget {
  final PropertyInfoModel propertyInfo;
  const AddDetails({super.key,required this.propertyInfo});

  @override
  Widget build(BuildContext context) {
    var images=[ImageManager.spaceSvg,ImageManager.bedSvg,ImageManager.bathroomsSvg,ImageManager.kitchensSvg,];
    var values=[propertyInfo.propertySize,propertyInfo.roomsNo,propertyInfo.bathroomsNo,propertyInfo.kitchensNo,];

    return Column(
      children: [
        Container(
          // height: height,
          width: 1.0.sw,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 14,vertical:0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppSizeBox(height: 24,),
              SizedBox(
                width: 1.0.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // width: 120,
                      // height: 40,
                      // alignment: Alignment.center,
                      decoration: Utils.returnDropdownButtonDecoration(ColorManager.primary,
                          ColorManager.primary,10),
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: InkWell(
                          splashColor: ColorManager.white,
                          highlightColor:ColorManager.white ,
                          onTap: (){
                            // MyRoute().navigate(context: context, route: const SearchListScreen());
                          } ,
                          child: AppText(
                              title:propertyInfo.type=='sale'?'ForSale'.tr():'ForRent'.tr(),
                              titleAlign: TextAlign.center,
                              titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
                              titleSize: FontSize.s6,titleColor: ColorManager.white)
                      ),
                    ),



                    AppText(
                      title:'${propertyInfo.price} ',
                      titleMaxLines: 1,
                      titleSize: FontSize.s20,
                      titleAlign: TextAlign.start,
                      titleColor: ColorManager.black,
                      fontWeightType: FontWeightType.extraBold,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: AppText(
                        title:propertyInfo.currency,
                        titleMaxLines: 1,
                        titleSize: FontSize.s16,
                        titleAlign: TextAlign.start,
                        titleColor: ColorManager.black,
                        fontWeightType: FontWeightType.semiBold,
                      ),
                    ),
                  ],
                ),
              ),
              const AppSizeBox(height: 4,),
              SizedBox(
                width: 1.0.sw,
                  child: AppText(
                    title:propertyInfo.propertyTitle,
                    titleMaxLines: 5,
                    titleHeight: 1.3,
                    titleSize: FontSize.s18,
                    titleAlign: TextAlign.start,
                    titleColor: ColorManager.black,
                    fontWeightType: FontWeightType.extraBold,

                ),
              ),

              const AppSizeBox(height: 4,),
              Row(
                children: [
                  Icon(Icons.watch_later_outlined,color: ColorManager.black,size: 12,),
                  AppText(
                    title:propertyInfo.adCreatedAt +' '+propertyInfo.timeAgo,
                    titleMaxLines: 2,
                    titleHeight: 1.3,
                    titleSize: FontSize.s8,
                    titleAlign: TextAlign.start,
                    titleColor: ColorManager.textField,
                    fontWeightType: FontWeightType.medium,
                  ),
                ],
              ),
              const AppSizeBox(height: 6,),

              Row(
                children: [
                  Icon(Icons.location_on,color: ColorManager.black,size: 12,),
                  AppText(
                    title:'${propertyInfo.country} , ${propertyInfo.city}',
                    titleMaxLines: 2,
                    titleHeight: 1.3,
                    titleSize: FontSize.s8,
                    titleAlign: TextAlign.start,
                    titleColor: ColorManager.icons,
                    fontWeightType: FontWeightType.medium,
                  ),
                ],
              ),
              const AppSizeBox(height: 6,),

              AppText(
                title:propertyInfo.propertyDescription,
                titleMaxLines: 4,
                titleHeight: 1.4,
                titleSize: FontSize.s12,
                titleAlign: TextAlign.start,
                titleColor: ColorManager.black,
                fontWeightType: FontWeightType.regular,
              ),

              const AppSizeBox(height: 6,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      for(var item in images)Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Row(
                          children: [
                            SvgPicture.asset(item,height: 16,width: 16,),
                            const AppSizeBox(width: 4,),
                            AppText(
                              title:values[images.indexOf(item)].toString(),
                              titleSize: FontSize.s16,
                              titleAlign: TextAlign.start,
                              titleColor: ColorManager.textField,
                              fontWeightType: FontWeightType.regular,
                            ),

                            const AppSizeBox(width: 10,),
                          ],
                        ),
                      ),



                    ],
                  ),


                  if(Constants.userDataModel!=null&& Constants.userDataModel!.id==propertyInfo.userId&&
                      !propertyInfo.isAuction)
                  MyTextButton(title: 'addToAuction'.tr(),
                      size: Size( .32.sw,  35),
                      fontWeightType: FontWeightType.regular,
                      titleSize: FontSize.s12,
                      radius: RadiusManager.r6,
                      primaryColor: ColorManager.primary,
                      titleColor: ColorManager.white,
                      onPressed: ()async{
                        MyRoute().navigate(context: context,
                            route: AddAdBidScreen(propertyId: propertyInfo.id,
                              isPropertyFeatured: propertyInfo.featured,));
                      }),
                ],
              ),


            ],
          )
        ),

        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Divider(color:ColorManager.divider,thickness: 2),
        ),
      ],
    );
  }
}
