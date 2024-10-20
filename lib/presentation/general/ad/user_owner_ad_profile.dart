part of 'ad_imports.dart';

class UserOwnerAdProfileScreen extends StatefulWidget {
  final PropertyInfoModel propertyInfo;
  const UserOwnerAdProfileScreen({super.key,required this.propertyInfo});

  @override
  State<UserOwnerAdProfileScreen> createState() =>
      _UserOwnerAdProfileScreenState();
}

class _UserOwnerAdProfileScreenState extends State<UserOwnerAdProfileScreen> {
  bool showAsList = true;
  bool showAdsTab = false;

  @override
  void initState() {
    super.initState();
    context.read<ProductProvider>().getOwnerProperties(context: context,ownerId: widget.propertyInfo.userId,isNotify: false);
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, provider, child) => ScreenLoading(
        isLoading: provider.isLoading,
        height: 1.0.sh,
        width: 1.0.sw,
        child:Scaffold(
          appBar: GeneralAppBar(title:widget.propertyInfo.userName,
              showChatNotify: false),
          body: ScreenLoading(
            isLoading: provider.isLoading,
            height: 1.0.sh,
            width: 1.0.sw,
            child: SizedBox(
              height: 1.0.sh,
              width: 1.0.sw,
              // padding: const EdgeInsets.symmetric(horizontal: 14),
              child: CustomScrollView(
                // shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate([
                      UserProfileDataWidget(propertyInfo: widget.propertyInfo ),



                      if (!showAdsTab)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  AppText(
                                      title: ' ${ provider.ownerProperties.length} ',
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


                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(RadiusManager.r14),
                                    color: ColorManager.textGrey
                                  // boxShadow: Constants.kBoxShadow
                                ),
                                child: InkWell(
                                    onTap: () => setState(() => showAsList = !showAsList),
                                    child: Image.asset(
                                      showAsList ? ImageManager.grid : ImageManager.list,
                                      height: 30,
                                      width: 30,
                                      color: ColorManager.primary,
                                    )),
                              )
                            ],
                          ),
                        ),

                      if (!showAdsTab&& provider.ownerProperties.isEmpty&&!provider.isLoading)
                        const Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: NoDataCurrentlyAvailable(),
                        ),

                    ]),
                  ),


                  // if (!showAdsTab)
                    if (showAsList)
                      SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          sliver: SliverList(
                              delegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int index) {
                                  return AdListItem(property: provider.ownerProperties[index],
                                    onFavoriteTap: (property){
                                      if(property.wishlist) {
                                        provider.unWish(context: context, property: property);
                                      } else {
                                        provider.wish(context: context, property: property);
                                      }
                                    },);
                                },
                                childCount: provider.ownerProperties.length,
                              )))
                    else
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        sliver:  SliverGrid(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 1,
                            crossAxisSpacing: 2,
                            childAspectRatio: .74,
                          ),
                          delegate: SliverChildBuilderDelegate(
                                (context, index) {
                              return AdGridItem(property: provider.ownerProperties[index],
                              onFavoriteTap: (property){
                                if(property.wishlist) {
                                  provider.unWish(context: context, property: property);
                                } else {
                                  provider.wish(context: context, property: property);
                                }
                              },);
                            },
                            // childCount:widget.cat.subCategories.length,
                            childCount: provider.ownerProperties.length,
                          ),
                        ),)


                  // else     SliverList(
                  //   delegate: SliverChildListDelegate([
                  //
                  //     PersonalDataWidget(consultantInfo: provider.consultantInfo!,)
                  //   ]),
                  // ),

                ],
              ),
            ),
          )

        )
      ),
    );
  }
}
