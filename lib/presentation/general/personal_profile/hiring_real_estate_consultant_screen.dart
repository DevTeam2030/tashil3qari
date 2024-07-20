part of'personal_profile_imports.dart';

class HiringRealEstateConsultantScreen extends StatefulWidget {
  final int propertyId;
  const HiringRealEstateConsultantScreen({Key? key,required this.propertyId}) : super(key: key);

  @override
  State<HiringRealEstateConsultantScreen> createState() => _HiringRealEstateConsultantScreenState();
}

class _HiringRealEstateConsultantScreenState extends State<HiringRealEstateConsultantScreen> {
 ConsultantModel? selectedConsultant;
 TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    context.read<ConsultantProvider>().getConsultants(notify: false,context: context,);
  }


  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(title: 'HiringRealEstateConsultant'.tr(),showChatNotify: false,showDivider: false),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextButton(title: 'Confirm payment of 250 riyals'.tr().
            replaceFirst('250', Constants.settingModel.consultantFess.toString()),
                size: Size( .8.sw,  47),
                radius: 6,
                fontWeightType: FontWeightType.bold,
                titleSize: FontSize.s18,
                primaryColor: ColorManager.primary,
                titleColor: ColorManager.white,
                onPressed: (){
                  FocusScope.of(context).requestFocus( FocusNode());
                  if(selectedConsultant!=null) {
                    hiringRealEstateConsultantForAd(context: context);

                  }
                  else{
                    LoadingDialog.showToastNotification('PleaseEnterAllDataCorrectly'.tr());
                  }
                }),
          ],
        ),
      ),
      body: InkWell(
    splashColor:ColorManager.white,
    focusColor: ColorManager.white,
    onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
    child:Consumer<AddPropertyProvider>(
        builder: (context, addPropertyprovider, child) => Consumer<ConsultantProvider>(
          builder: (context, provider, child) => ScreenLoading(
            isLoading: provider.isLoading||addPropertyprovider.isLoading,
            height: 1.0.sh,
            width: 1.0.sw,
            child: (provider.isLoading||addPropertyprovider.isLoading)&&provider.filterConsultants.isEmpty?AppSizeBox(width: 0,):
            Container(
              height: 1.0.sh,
              width: 1.0.sw,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: CustomScrollView(
                // shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                slivers: [

                  SliverList(
                    delegate: SliverChildListDelegate([


                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: DefaultTextFormField(
                                controller: searchController,
                                hintTitle: 'search'.tr(),
                                labelTitle: 'search'.tr(),
                                textInputAction: TextInputAction.search,
                                textInputType: TextInputType.text,
                                hintFontSize: FontSize.s12,
                                hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                                textSize: FontSize.s12,
                                fillColor: ColorManager.textGrey,
                                borderColor: ColorManager.textGrey,
                                borderRadius: RadiusManager.r10,
                                prefixIcon: const Icon(Icons.search,color: ColorManager.icons,size: AppSize.s20,),
                                validator: (v) {},
                                onChanged: (v) {
                                  provider.searchConsultants(name: v);
                                },
                              ),
                            ),

                            const AppSizeBox(width: 10,),
                            InkWell(
                                onTap: (){
                                  Utils.showModalBottomSheetApp(widget:ConsultantFilterBottomSheet(
                                    onSelectedConsultant: (consultant){
                                      selectedConsultant=consultant;
                                      Navigator.pop(context);
                                      searchController.clear();
                                      if(!provider.filterConsultants.contains(consultant))provider.filterConsultants=provider.allConsultants;
                                      hiringRealEstateConsultantForAd(context: context);
                                    },
                                  ));
                                },
                                child: Image.asset(ImageManager.filter,height: 30,width: 30,)),



                          ],
                        ),
                      ),

                      if(provider.filterConsultants.isEmpty)
                        Padding(
                            padding: EdgeInsets.only(top: .25.sh),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                NoDataCurrentlyAvailable(),
                              ],
                            )
                        ),
                    ]),
                  ),





                  SliverGrid(
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 2,
                      childAspectRatio: .74,
                    ),
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        return RealEstateConsultantWidget(
                          consultant: provider.filterConsultants[index],
                          isSelected: selectedConsultant==provider.filterConsultants[index],
                          onSelected: (){
                            setState(() {
                              selectedConsultant=provider.filterConsultants[index];
                            });
                          },);
                      },
                      // childCount:widget.cat.subCategories.length,
                      childCount:provider.filterConsultants.length,
                    ),
                  ),


                ],
              ),



            ),
          ),
        ),
      )),


    );
  }

 hiringRealEstateConsultantForAd({required BuildContext context,}){

    context.read<AddPropertyProvider>().hiringRealEstateConsultantForAd(context: context,consultantId: selectedConsultant!.id,
    adId: widget.propertyId);

  }
}
