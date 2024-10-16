part of 'personal_profile_imports.dart';

class PersonalProfileScreen extends StatefulWidget {
  final PersonalDataType? showDataTab;
  const PersonalProfileScreen({super.key,this.showDataTab});

  @override
  State<PersonalProfileScreen> createState() => _PersonalProfileScreenState();
}

class _PersonalProfileScreenState extends State<PersonalProfileScreen> {
  HomeData homeData = HomeData();
 late PersonalProfileData personalProfileData;



  @override
  void initState() {
    super.initState();
    personalProfileData = PersonalProfileData(showTab: widget.showDataTab??PersonalDataType.ads,context: context);
    context.read<ProfileProvider>().getAllProfileData(context: context, notify: false);
    // context.read<ProfileProvider>().getAgreements(context: context, notify: false);


  }

  @override
  void dispose() {
    personalProfileData.phoneController.dispose();
    personalProfileData.firstNameController.dispose();
    personalProfileData.lastNameController.dispose();
    personalProfileData.emailController.dispose();
    personalProfileData.idController.dispose();
    personalProfileData.oldPasswordController.dispose();
    personalProfileData.newPasswordController.dispose();
    personalProfileData.confirmNewPasswordController.dispose();
    personalProfileData.licenseNumberController.dispose();
    personalProfileData.desController.dispose();
    super.dispose();



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeBuildAppBar(
          homeData: homeData, showFilter: false, fromHeight: 70,isFromHome: Constants.userDataModel==null||Constants.userDataModel!.isUser),
      body: Consumer<AuthProvider>(
          builder: (context, authProvider, child) =>Consumer<ProfileProvider>(
              builder: (context, provider, child) =>ScreenLoading(
                isLoading:authProvider.isLoading|| provider.isLoading,
                child:      SizedBox(
                  height: 1.0.sh,
                  width: 1.0.sw,
                  // padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Constants.userDataModel==null?const AppSizeBox(width: 0,):CustomScrollView(
                    // shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    slivers: [
                      SliverList(
                        delegate: SliverChildListDelegate([


                          PersonalProfileDataWidget(
                            personalProfileData: personalProfileData,
                            showAdsTab: personalProfileData.showDataTab,
                            onTabPressed: (value) => value == personalProfileData.showDataTab
                                ? null
                                : setState(() => personalProfileData.showDataTab = value),
                          ),



                          if (personalProfileData.showDataTab == PersonalDataType.favorite ||
                              personalProfileData.showDataTab == PersonalDataType.ads)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14.0, vertical: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      AppText(
                                          title:personalProfileData.showDataTab == PersonalDataType.ads?
                                          ' ${provider.userAds.length} ':' ${provider.userWishList.length} ',
                                          titleAlign: TextAlign.start,
                                          titleMaxLines: 1,
                                          fontWeightType: FontWeightType.extraBold,
                                          titleSize: FontSize.s16,
                                          titleColor: ColorManager.primary),
                                      AppText(
                                          title: 'advertisement'.tr(),
                                          titleAlign: TextAlign.start,
                                          titleMaxLines: 1,
                                          fontWeightType: FontWeightType.extraBold,
                                          titleSize: FontSize.s16,
                                          titleColor: ColorManager.black),
                                    ],
                                  ),

                                  if(personalProfileData.showDataTab == PersonalDataType.ads)
                                    GridListItem(
                                      showAsList: personalProfileData.showAdsAsList ,
                                      onTap: (value)=> setState(() =>personalProfileData.showAdsAsList=value),
                                    ),

                                  if(personalProfileData.showDataTab == PersonalDataType.favorite)
                                    GridListItem(
                                      showAsList: personalProfileData.showFavoriteAsList ,
                                      onTap: (value)=> setState(() =>personalProfileData.showFavoriteAsList=value),
                                    ),

                                ],
                              ),
                            ),



                          if (personalProfileData.showDataTab == PersonalDataType.ads &&
                              provider.userAds.isEmpty&&provider.isLoading==false)
                            Padding(
                              padding: const EdgeInsets.only(top:50),
                              child: AppText(
                                  title: 'NoDataCurrentlyAvailable'.tr(),
                                  titleAlign: TextAlign.center,
                                  titleMaxLines: 1,
                                  fontWeightType: FontWeightType.extraBold,
                                  titleSize: FontSize.s16,
                                  titleColor: ColorManager.black),
                            ),


                          if (personalProfileData.showDataTab == PersonalDataType.favorite &&
                              provider.userWishList.isEmpty&&provider.isLoading==false)
                            Padding(
                              padding: const EdgeInsets.only(top:50),
                              child: AppText(
                                  title: 'NoDataCurrentlyAvailable'.tr(),
                                  titleAlign: TextAlign.center,
                                  titleMaxLines: 1,
                                  fontWeightType: FontWeightType.extraBold,
                                  titleSize: FontSize.s16,
                                  titleColor: ColorManager.black),
                            ),

                          if (personalProfileData.showDataTab == PersonalDataType.agreements &&provider.isLoading==false&& provider.agreements.isEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top:50),
                              child: AppText(
                                  title: 'NoDataCurrentlyAvailable'.tr(),
                                  titleAlign: TextAlign.center,
                                  titleMaxLines: 1,
                                  fontWeightType: FontWeightType.extraBold,
                                  titleSize: FontSize.s16,
                                  titleColor: ColorManager.black),
                            ),
                        ]),
                      ),





                      if (personalProfileData.showDataTab == PersonalDataType.ads)
                        if (personalProfileData.showAdsAsList)
                          SliverPadding(
                              padding: const EdgeInsets.symmetric(horizontal: 14),
                              sliver: SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                        (BuildContext context, int index) {
                                      GeneralPropertyModel ad=GeneralPropertyModel(
                                        endDuration: '',
                                        isAuctionBefore: provider.userAds[index].isAuctionBefore ,
                                        userId: provider.userAds[index].userId,
                                        gallery: provider.userAds[index].gallery.map((e) => e.url).toList(),
                                        id: provider.userAds[index].id,
                                        type: provider.userAds[index].type,
                                        category: provider.userAds[index].category,
                                        currency: provider.userAds[index].currency,
                                        propertyTitle: provider.userAds[index].propertyTitle,
                                        price: provider.userAds[index].price,
                                        roomsNo: provider.userAds[index].roomsNo,
                                        bathroomsNo: provider.userAds[index].bathroomsNo,
                                        kitchensNo: provider.userAds[index].kitchensNo,
                                        propertySize: provider.userAds[index].propertySize,
                                        floor: provider.userAds[index].floor,
                                        wishlist: provider.userAds[index].wishlist,
                                        show: provider.userAds[index].show,
                                        featured: provider.userAds[index].featured,
                                        latitude: provider.userAds[index].latitude,
                                        longitude: provider.userAds[index].longitude,
                                        rate: provider.userAds[index].rate,
                                        propertyDescription: provider.userAds[index].propertyDescription,
                                        cityId: provider.userAds[index].cityId,
                                        countryId: provider.userAds[index].countryId,
                                        city: provider.userAds[index].city,
                                        country: provider.userAds[index].country,
                                        image: provider.userAds[index].image,
                                        isAuction: provider.userAds[index].auction,

                                      );
                                      return Stack(
                                        children: [
                                          AdListItem(
                                            userAd: provider.userAds[index],
                                            property: ad,
                                            showEdit:true,
                                            // showEdit:!provider.userAds[index].auction,
                                            showFavorite: false,
                                            isRealEstateProfile: true,
                                            // isRealEstateProfile: Constants.userDataModel!.isUser==false,
                                            onFavoriteTap: (prop){
                                              if(prop.wishlist) provider.removeFromWishlist(context: context, property: prop);
                                              else provider.addToWishlist(context: context, property: prop);
                                            },
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal:14.0,vertical: 30),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                AdActionDropdownButton(
                                                  ad: provider.userAds[index],
                                                  personalProfileData: personalProfileData,)
                                              ],
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                    childCount: provider.userAds.length,
                                  )))
                        else
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            sliver: SliverGrid(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 1,
                                crossAxisSpacing: 2,
                                childAspectRatio:Constants.userDataModel!.isUser==false?0.62:
                                provider.userAds.where((element) => element.auction).toList().isNotEmpty?0.58:0.68,
                              ),
                              delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                  GeneralPropertyModel ad=GeneralPropertyModel(
                                    endDuration: '',
                                    isAuctionBefore: provider.userAds[index].isAuctionBefore ,
                                    userId: provider.userAds[index].userId,
                                    isAuction: provider.userAds[index].auction,
                                    gallery: provider.userAds[index].gallery.map((e) => e.url).toList(),
                                    id: provider.userAds[index].id,
                                    type: provider.userAds[index].type,
                                    category: provider.userAds[index].category,
                                    currency: provider.userAds[index].currency,
                                    propertyTitle: provider.userAds[index].propertyTitle,
                                    price: provider.userAds[index].price,
                                    roomsNo: provider.userAds[index].roomsNo,
                                    bathroomsNo: provider.userAds[index].bathroomsNo,
                                    kitchensNo: provider.userAds[index].kitchensNo,
                                    propertySize: provider.userAds[index].propertySize,
                                    floor: provider.userAds[index].floor,
                                    wishlist: provider.userAds[index].wishlist,
                                    show: provider.userAds[index].show,
                                    featured: provider.userAds[index].featured,
                                    latitude: provider.userAds[index].latitude,
                                    longitude: provider.userAds[index].longitude,
                                    rate: provider.userAds[index].rate,
                                    propertyDescription: provider.userAds[index].propertyDescription,
                                    cityId: provider.userAds[index].cityId,
                                    countryId: provider.userAds[index].countryId,
                                    city: provider.userAds[index].city,
                                    country: provider.userAds[index].country,
                                    image: provider.userAds[index].image,

                                  );
                                  return Stack(
                                    fit:StackFit.passthrough  ,
                                    children: [
                                      AdGridItem(
                                        userAd:  provider.userAds[index],
                                        property: ad,
                                        showEdit:true,
                                        // showEdit: !provider.userAds[index].auction,
                                        showFavorite: false,
                                        isRealEstateProfile: Constants.userDataModel!.isUser==false,
                                        onFavoriteTap: (prop){
                                          if(prop.wishlist) provider.removeFromWishlist(context: context, property: prop);
                                          else provider.addToWishlist(context: context, property: prop);
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal:14.0,vertical: 20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            AdActionDropdownButton(
                                              ad: provider.userAds[index],
                                              personalProfileData: personalProfileData,)
                                          ],
                                        ),
                                      )
                                    ],
                                  );
                                },
                                // childCount:widget.cat.subCategories.length,
                                childCount: provider.userAds.length,
                              ),
                            ),
                          ),


                      if (personalProfileData.showDataTab == PersonalDataType.favorite)
                        if (personalProfileData.showFavoriteAsList)
                          SliverPadding(
                              padding: const EdgeInsets.symmetric(horizontal: 14),
                              sliver: SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                        (BuildContext context, int index) {
                                      return AdListItem(
                                        property: provider.userWishList[index],
                                        showEdit: false,
                                        showFavorite: true,
                                        onFavoriteTap: (prop){
                                          provider.removeFromWishlist(context: context, property: prop);
                                        },
                                      );
                                    },
                                    childCount: provider.userWishList.length,
                                  )))
                        else
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            sliver: SliverGrid(
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 1,
                                crossAxisSpacing: 2,
                                childAspectRatio: .74,
                              ),
                              delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                  return AdGridItem(
                                    property: provider.userWishList[index],
                                    showEdit: false,
                                    showFavorite: true,
                                    onFavoriteTap: (prop){
                                      provider.removeFromWishlist(context: context, property: prop);
                                    },
                                  );
                                },
                                // childCount:widget.cat.subCategories.length,
                                childCount: provider.userWishList.length,
                              ),
                            ),
                          ),


                      // if (personalProfileData.showDataTab == PersonalDataType.agreements)
                      // SliverPadding(
                      //     padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
                      //     sliver: SliverList(
                      //         delegate: SliverChildBuilderDelegate(
                      //               (BuildContext context, int index) {
                      //             return AgreementItem(agreementModel: provider.agreements[index],);
                      //           },
                      //           childCount: provider.agreements.length,
                      //         ))),
                      if (personalProfileData.showDataTab == PersonalDataType.agreements)
                        SliverPadding(
                            padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
                            sliver: SliverList(
                                delegate: SliverChildBuilderDelegate(
                                      (BuildContext context, int index) {
                                    return AgreementDetailsItem(agreement:  provider.agreements[index]);
                                  },
                                  childCount: provider.agreements.length,
                                ))),
                      // if (personalProfileData.showDataTab == PersonalDataType.agreements)
                      //   SliverList(
                      //     delegate: SliverChildListDelegate([
                      //         Padding(
                      //           padding: const EdgeInsets.only(top:50),
                      //           child: AppText(
                      //               title: 'NoDataCurrentlyAvailable'.tr(),
                      //               titleAlign: TextAlign.center,
                      //               titleMaxLines: 1,
                      //               fontWeightType: FontWeightType.extraBold,
                      //               titleSize: FontSize.s16,
                      //               titleColor: ColorManager.black),
                      //         ),
                      //
                      //
                      //     ]),
                      //   ),

                      if (personalProfileData.showDataTab == PersonalDataType.personal)
                        SliverList(
                          delegate: SliverChildListDelegate([PersonalProfileDetailsTab(personalProfileData: personalProfileData,)]),
                        ),
                    ],
                  ),
                ),
              )
          )
      )


    );
  }
}
