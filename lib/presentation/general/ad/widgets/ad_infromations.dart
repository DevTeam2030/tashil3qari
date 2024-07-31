part of'widgets_imports.dart';


class AdInformations extends StatelessWidget {
  final PropertyInfoModel propertyInfo;
  final  double? distance;
  final LatLng? currentLocation;
  final ProductProvider provider;
  const AdInformations({super.key,required this.propertyInfo,required this.distance,required this.currentLocation,required this.provider});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
          child: AppText(
            title:'Property information'.tr(),
            titleMaxLines: 2,
            titleHeight: 1.3,
            titleSize: FontSize.s16,
            titleAlign: TextAlign.start,
            titleColor: ColorManager.black,
            fontWeightType: FontWeightType.extraBold,
          ),
        ),


        InformationsItem(title: 'space'.tr(),value:'${propertyInfo.propertySize} ${'meter'.tr()}',color: ColorManager.textGrey,),

        InformationsItem(title: 'Lengths'.tr(),
          value:'${propertyInfo.length} ${'meter1'.tr()} ${'Length'.tr()} - ${propertyInfo.width} ${'meter1'.tr()} ${'width'.tr()}',
          color: ColorManager.textGrey,),




        if(provider.adCategory!=null)
          Column(
            children: [
              if(provider.adCategory!.options.floor)
              InformationsItem(title: 'Floor'.tr(),value:propertyInfo.floor,color: ColorManager.white,),

              if(provider.adCategory!.options.roomsNo)
              InformationsItem(title: 'bedrooms'.tr(),value:'${propertyInfo.roomsNo} ${'rooms'.tr()}',color: ColorManager.white,),

              if(provider.adCategory!.options.bathroomsNo)
              InformationsItem(title: 'Bathrooms'.tr(),value:'${propertyInfo.bathroomsNo} ${'Bathrooms1'.tr()}',color: ColorManager.textGrey,),

              if(provider.adCategory!.options.kitchensNo)
              InformationsItem(title: 'kitchen'.tr(),value:'${propertyInfo.kitchensNo} ${'kitchen1'.tr()}',color: ColorManager.white,),

              if(provider.adCategory!.options.receptionsNo)
              InformationsItem(title: 'receptionsNo'.tr(),value:'${propertyInfo.receptionsNo}',color: ColorManager.white,),

              if(provider.adCategory!.options.apartmentsNo)
              InformationsItem(title: 'apartmentsNo'.tr(),value:'${propertyInfo.apartmentsNo}',color: ColorManager.white,),

              if(provider.adCategory!.options.storesNo)
              InformationsItem(title: 'storesNo'.tr(),value:'${propertyInfo.storesNo}',color: ColorManager.white,),

              if(provider.adCategory!.options.buildingAge)
              InformationsItem(title: 'buildingAge'.tr(),value:'${propertyInfo.buildingAge} ${'year'.tr()}',color: ColorManager.white,),

              if(provider.adCategory!.options.direction)
              InformationsItem(title: 'direction'.tr(),value:'${propertyInfo.direction.isEmpty?'':'${propertyInfo.direction}'.tr()}',color: ColorManager.white,),

              if(provider.adCategory!.options.streetWidth)
              InformationsItem(title: 'streetWidth'.tr(),value:'${propertyInfo.streetWidth} ${'meter1'.tr()}',color: ColorManager.white,),

            ],
          ),


        // InformationsItem(title: 'Finishing'.tr(),value:propertyInfo.finishingType,color: ColorManager.textGrey,),
        InformationsItem(title: 'Advertising license'.tr(),value:propertyInfo.license,color: ColorManager.white,),
        InformationsItem(title: 'Advertisement number'.tr(),value:propertyInfo.adNo,color: ColorManager.textGrey,),
        InformationsItem(title: 'Last updated'.tr(),value:propertyInfo.lastUpadte,color: ColorManager.white,),
        InformationsItem(title: 'PostAd'.tr(),value:propertyInfo.timeAgo,color: ColorManager.textGrey,),
        InformationsItem(title: 'Views'.tr(),value:'${propertyInfo.viewNo}  ${'Views1'.tr()}',color: ColorManager.white,isLAst: true),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
          child: AppText(
            title:'Property location'.tr(),
            titleMaxLines: 2,
            titleHeight: 1.3,
            titleSize: FontSize.s16,
            titleAlign: TextAlign.start,
            titleColor: ColorManager.black,
            fontWeightType: FontWeightType.extraBold,
          ),
        ),

        const AppSizeBox(height: 8,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14,),
          child: InkWell(
            onTap: ()=>Utils.openMapsSheet(latLng: LatLng(propertyInfo.latitude,propertyInfo.longitude),
            context: context,title: propertyInfo.propertyTitle,description: propertyInfo.propertyDescription),
            // onTap: ()=>UrlLauncherMethods.launchMapByLat(location: LatLng(propertyInfo.latitude,propertyInfo.longitude)),
            child: Row(
              children: [

                const CircleAvatar(
                    radius: 30,
                    backgroundColor:ColorManager.textGrey,
                    child: Icon(Icons.location_on_outlined,size: 24,color: ColorManager.primary,)
                ),
                const AppSizeBox(width: 6,),
                Flexible(
                  child: AppText(
                    title:propertyInfo.country +', '+propertyInfo.city,
                    titleMaxLines: 4,
                    titleHeight: 1.6,
                    titleSize: FontSize.s12,
                    titleAlign: TextAlign.start,
                    titleColor: ColorManager.black,
                    fontWeightType: FontWeightType.medium,
                  ),
                ),
              ],
            ),
          ),
        ),
        if(distance!=null)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 0),
          child: Row(
            children: [

              CircleAvatar(
                  radius: 30,
                  backgroundColor:ColorManager.white,
                  child: Icon(Icons.location_on,size: 24,color: ColorManager.icons2,)
              ),
              const AppSizeBox(width: 6,),
              Flexible(
                child: AppText(
                  title:'locationِway'.tr().replaceFirst('num', '$distance'),
                  titleMaxLines: 4,
                  titleHeight: 1.6,
                  titleSize: FontSize.s12,
                  titleAlign: TextAlign.start,
                  titleColor: ColorManager.icons,
                  fontWeightType: FontWeightType.medium,
                ),
              ),
            ],
          ),
        ),





        const Divider(color:ColorManager.divider,thickness: 2),

        const AppSizeBox(height: 10,),
        if(distance!=null&&currentLocation!=null)
        AdInformationsMap(propertyInfo: propertyInfo,currentLocation: currentLocation!,),

        // Container(
        //   width: 1.0.sw,height: .25.sh,
        //   margin: const EdgeInsets.symmetric(horizontal: 14),
        //   child: Stack(
        //     children: [
        //       ClipRRect(
        //         borderRadius: BorderRadius.circular(RadiusManager.r8),
        //         child: Image.asset(ImageManager.driverLocation,width: 1.0.sw,height: .25.sh,fit: BoxFit.fill,),
        //       ),
        //
        //       Align(
        //         alignment: Alignment.bottomCenter,
        //         child: Padding(
        //           padding: const EdgeInsets.symmetric(vertical:10.0),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               MyTextButton(title: 'Show on map'.tr(),
        //                   size: Size( .72.sw,  40),
        //                   radius: 6,
        //                   fontWeightType: FontWeightType.medium,
        //                   titleSize: FontSize.s12,
        //                   primaryColor: ColorManager.textGrey,
        //                   titleColor: ColorManager.icons3,
        //                 onPressed: ()=>Utils.openMapsSheet(latLng: LatLng(propertyInfo.latitude,propertyInfo.longitude),
        //                     context: context,title: propertyInfo.propertyTitle,description: propertyInfo.propertyDescription),),
        //             ],
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // ),



        Padding(
          padding: const EdgeInsets.only(top:16.0,bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextButton(title: 'ShareAd'.tr(),
                  size: Size( 0.9.sw,  50),
                  radius: 14,
                  fontWeightType: FontWeightType.medium,
                  titleSize: FontSize.s12,
                  primaryColor: ColorManager.white,
                  titleColor: ColorManager.icons4,
                  borderColor: ColorManager.icons4,
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SvgPicture.asset(ImageManager.shareAd),
                      const AppSizeBox(width: 4,),
                      AppText(
                        title:'ShareAd'.tr(),
                        titleMaxLines: 4,
                        titleHeight: 1.6,
                        titleSize: FontSize.s16,
                        titleAlign: TextAlign.start,
                        titleColor: ColorManager.icons4,
                        fontWeightType: FontWeightType.medium,
                      ),
                    ],
                  ),
                  onPressed: (){
                Utils.createDynamicLink(image: propertyInfo.image,
                    id: propertyInfo.id, description: propertyInfo.propertyDescription,
                    title: propertyInfo.propertyTitle);
                   
                  }),
            ],
          ),
        ),
        if(Constants.userDataModel!=null&&Constants.userDataModel!.isUser!=false)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextButton(title: 'Report ad'.tr(),
                size: Size( 0.9.sw,  50),
                radius: 14,
                fontWeightType: FontWeightType.medium,
                titleSize: FontSize.s12,
                primaryColor: ColorManager.white,
                titleColor: ColorManager.red,
                borderColor: ColorManager.red,
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SvgPicture.asset(ImageManager.problemSvg),
                    const AppSizeBox(width: 4,),
                    AppText(
                      title:'Report ad'.tr(),
                      titleMaxLines: 4,
                      titleHeight: 1.6,
                      titleSize: FontSize.s16,
                      titleAlign: TextAlign.start,
                      titleColor: ColorManager.red,
                      fontWeightType: FontWeightType.medium,
                    ),
                  ],
                ),
                onPressed: (){
                  MyRoute().navigate(context: context, route: AddComplaintScreen(propertyId: propertyInfo.id,));
                }),
          ],
        ),

      ],
    );
  }
}
