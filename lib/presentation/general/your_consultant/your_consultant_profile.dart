part of 'your_consultant_imports.dart';

class YourConsultantProfileScreen extends StatefulWidget {
  final int consultantId;
  const YourConsultantProfileScreen({super.key,required this.consultantId});

  @override
  State<YourConsultantProfileScreen> createState() =>
      _YourConsultantProfileScreenState();
}

class _YourConsultantProfileScreenState extends State<YourConsultantProfileScreen> {
  bool showAsList = true;
  bool showAdsTab = false;

  @override
  void initState() {
    super.initState();
    context.read<ConsultantProvider>().getConsultantInfo(notify: false,context: context,consultantId: widget.consultantId);
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ConsultantProvider>(
      builder: (context, provider, child) => ScreenLoading(
        isLoading: provider.isLoading,
        height: 1.0.sh,
        width: 1.0.sw,
        child:Scaffold(
          appBar: GeneralAppBar(title: provider.consultantInfo!=null?
              // &&!provider.isLoading?
          '${provider.consultantInfo!.firstName} ${provider.consultantInfo!.lastName}' :'',
              showChatNotify: false),
          body: provider.consultantInfo==null?const AppSizeBox(height: 0):
          SizedBox(
            height: 1.0.sh,
            width: 1.0.sw,
            // padding: const EdgeInsets.symmetric(horizontal: 14),
            child: CustomScrollView(
              // shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    ConsultantProfileDataWidget(
                      consultantInfo: provider.consultantInfo!,
                      showAdsTab: showAdsTab,
                      onTabPressed: (value) => value==showAdsTab?null:setState(() => showAdsTab = value),
                    ),



                    if (!showAdsTab)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                AppText(
                                    title: ' ${ provider.consultantsAds.length} ',
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

                    if (!showAdsTab&& provider.consultantsAds.isEmpty&&!provider.isLoading)
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
                                return AdListItem(property: provider.consultantsAds[index],
                                  onFavoriteTap: (property){
                                    if(property.wishlist) {
                                      provider.unWish(context: context, property: property);
                                    } else {
                                      provider.wish(context: context, property: property);
                                    }
                                  },);
                              },
                              childCount: provider.consultantsAds.length,
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
                            return AdGridItem(property: provider.consultantsAds[index],
                            onFavoriteTap: (property){
                              if(property.wishlist) {
                                provider.unWish(context: context, property: property);
                              } else {
                                provider.wish(context: context, property: property);
                              }
                            },);
                          },
                          // childCount:widget.cat.subCategories.length,
                          childCount: provider.consultantsAds.length,
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
          )

        )
      ),
    );
  }
}
