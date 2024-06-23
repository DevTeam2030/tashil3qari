part of'widgetImports.dart';

class ConsultantFilterBottomSheet extends StatefulWidget {
  final Function (ConsultantModel consultant) onSelectedConsultant;
  const ConsultantFilterBottomSheet({Key? key,required this.onSelectedConsultant}) : super(key: key);

  @override
  State<ConsultantFilterBottomSheet> createState() => _ConsultantFilterBottomSheetState();
}

class _ConsultantFilterBottomSheetState extends State<ConsultantFilterBottomSheet> {

  late CountryModel selectedCountry;
  late CityModel selectedCity;
  LatLng? currentLocation;
  double rate=5;
  List<ConsultantModel> dealingConsultant=[];
  @override
  void initState() {
    super.initState();
    selectedCountry= context.read<GeneralProvider>().userCountry;
    selectedCity= context.read<GeneralProvider>().userCity;
    dealingConsultant=context.read<ConsultantProvider>().allConsultants.where((element) => element.dealingConsultant).toList();
  }

  @override
  Widget build(BuildContext context) {
    return  Material(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(RadiusManager.r20),
          topRight: Radius.circular(RadiusManager.r20),
        ),
        color: ColorManager.white,
        child: Container(
          padding: const EdgeInsets.all(PaddingManager.p20),
          // height:  .75.sh,
          width:  1.0.sw,

          constraints: BoxConstraints(
            maxHeight: .8.sh,
            minHeight: .2.sh,
          ),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(RadiusManager.r20),
              topRight: Radius.circular(RadiusManager.r20),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p8,vertical: 16),
                  child: Row(
                    children: [
                      AppText(
                        title: 'Filter by'.tr()+' :',
                        titleSize: FontSize.s17,
                        titleAlign: TextAlign.start,
                        titleColor: ColorManager.black,
                        fontWeightType: FontWeightType.extraBold,
                      ),
                    ],
                  ),
                ),

                SearchSelectLocationButton(
                    selectedCity: selectedCity,
                    selectedCountry: selectedCountry,
                    onTap: (country,city,location){
                      selectedCountry=country;
                      selectedCity=city;
                      currentLocation=location;
                      setState(() {});
                    }
                ),

                const AppSizeBox(height: AppSize.s14,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      title: 'Evaluation'.tr()+' :',
                      titleSize: FontSize.s13,
                      titleAlign: TextAlign.start,
                      titleColor: ColorManager.black,
                      fontWeightType: FontWeightType.bold,
                    ),

                    Row(
                      children: [
                        for(int i=1;i<=5;i++)
                          InkWell(
                              onTap: (){
                                rate=i.toDouble();
                                setState(() {});
                                print(rate);
                              },
                              child:  Icon(Icons.star,
                                color:i<=rate? ColorManager.starReviewColor:ColorManager.notificationsBody,size: AppSize.s20,)),
                      ],
                    )
                  ],
                ),

                const AppSizeBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyTextButton(title: 'Search 20 real estate consultants'.tr().
                    replaceFirst('20', context.read<ConsultantProvider>().allConsultants.length.toString()),
                        size: Size( .8.sw,  47),
                        radius: 6,
                        fontWeightType: FontWeightType.bold,
                        titleSize: FontSize.s14,
                        primaryColor: ColorManager.primary,
                        titleColor: ColorManager.white,
                        onPressed: (){
                          Navigator.pop(context);
                          context.read<ConsultantProvider>().filterAllConsultants(countryId: selectedCountry.id,
                              cityId: selectedCity.id, rate: rate);
                          // var allConsultants= context.read<ConsultantProvider>().allConsultants;
                          // context.read<ConsultantProvider>().filterConsultants=
                          //     allConsultants.where((element) =>
                          //     element.countryId==selectedCountry.id||
                          //     element.cityId==selectedCity.id||
                          //     element.rate==rate
                          //     ).toList();
                          // print('------------------------------------');
                          // context.read<ConsultantProvider>().notifyListeners();
                        }),
                  ],
                ),

                const AppSizeBox(height: AppSize.s16,),

                if(dealingConsultant.isNotEmpty)
                Column(
                  children: [
                    Row(
                      children: [
                        AppText(
                          title: 'Consultants have been dealt with previously'.tr(),
                          titleSize: FontSize.s13,
                          titleAlign: TextAlign.start,
                          titleColor: ColorManager.black,
                          fontWeightType: FontWeightType.bold,
                        ),
                      ],
                    ),
                    const AppSizeBox(height: AppSize.s10,),

                    for(int i=0;i< dealingConsultant.length;i++)
                      HorizontalRealEstateConsultantWidget(
                        consultant: context.read<ConsultantProvider>().allConsultants[i],
                        onSelected: ()=>widget.onSelectedConsultant(dealingConsultant[i]),
                      ),
                  ],
                )



                // const AppSizeBox(height: 20,),



              ],
            ),
          )),

    );
  }
}
