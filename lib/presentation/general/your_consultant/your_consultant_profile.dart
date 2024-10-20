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
  bool showAdsTab = true;

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



                    if (showAdsTab)
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

                    if (showAdsTab&& provider.consultantsAds.isEmpty&&!provider.isLoading)
                      const Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: NoDataCurrentlyAvailable(),
                      ),

                    if(!showAdsTab &&Constants.userDataModel!=null&&
                        widget.consultantId!=Constants.userDataModel!.id
                        &&provider.consultantInfo!.canRate
                    )
                      Padding(
                        padding: const EdgeInsets.only(right:16.0,left: 16,top: 14,bottom: 10),
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                                title: 'Add your rating'.tr(),
                                titleAlign: TextAlign.start,
                                titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                                titleSize: FontSize.s20,titleColor: ColorManager.black),


                            InkWell(
                              onTap: ()async{
                                  await LoadingDialog().widgetAlertDialog(context: context, widget: AddRateToConsultantWidget(
                                      consultantId: widget.consultantId));


                               
                              },
                              child: CircleAvatar(
                                radius: 16,
                                backgroundColor: ColorManager.primary,
                                child:  Icon(Icons.add,
                                    size: AppSize.s20,
                                    color: ColorManager.white),
                              ),
                            ),
                          ],
                        ),
                      )else const AppSizeBox(height: 14),

                    if (!showAdsTab&& provider.allConsultantRates.isEmpty&&!provider.isLoading)
                      const Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: NoDataCurrentlyAvailable(),
                      ),


                  ]),
                ),


                if (showAdsTab)YourConsultantAdsTab(showAsList: showAsList, provider: provider,)
                else YourConsultantCommentsTab(provider: provider,),
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
