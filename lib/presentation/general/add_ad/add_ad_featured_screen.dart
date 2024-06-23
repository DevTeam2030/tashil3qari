part of'add_ad_imports.dart';

class AddAdFeaturedScreen extends StatefulWidget {
  final int propertyId;

  const AddAdFeaturedScreen({Key? key,required this.propertyId,}) : super(key: key);

  @override
  State<AddAdFeaturedScreen> createState() => _AddAdFeaturedScreenState();
}

class _AddAdFeaturedScreenState extends State<AddAdFeaturedScreen> {



 List<FeaturedPlansModel> plans=[];
 late FeaturedPlansModel selectedFeaturedPlan;
  @override
  void initState() {
    super.initState();

    plans=Constants.settingModel.featuredPlans;
    selectedFeaturedPlan=Constants.settingModel.featuredPlans.first;
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: ()async{
        return false;
      },
      child: Scaffold(

        appBar: GeneralAppBar(title: 'Feature your ad'.tr(),
          showBack: false,
          showChatNotify: false,showDivider: false,),

        body: Consumer<AddPropertyProvider>(
          builder: (context, provider, child) => ScreenLoading(
            isLoading: provider.isLoading,
            height: 1.0.sh,
            width: 1.0.sw,
            child:   Container(
                height: 1.0.sh,
                width: 1.0.sw,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child:SingleChildScrollView(
                  child: Column(
                    children: [

                      Container(
                        width: 1.0.sw,
                          padding:const EdgeInsets.only(top:18.0),
                          child: AppText(
                              title: 'Do you want to feature the ad'.tr() ,
                              titleAlign: TextAlign.center,
                              titleMaxLines: 4,fontWeightType: FontWeightType.bold,
                              titleSize: FontSize.s20,
                              titleHeight: 1.6,
                              titleColor: ColorManager.icons3)),
                      const AppSizeBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                              title: 'ChooseDuration'.tr(),
                              titleAlign: TextAlign.start,
                              titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
                              titleSize: FontSize.s16,
                              titleColor:ColorManager.black),


                        ],
                      ),
                      const AppSizeBox(height: 14,),
                      Wrap(
                        children: [
                          for(var item in plans)
                          InkWell(
                            onTap: () =>setState(()=>selectedFeaturedPlan=item),
                            child: Container(
                              // height: 45,
                              width: .4.sw,
                              margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                              padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 12),
                              // padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 12),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(RadiusManager.r4),
                                  color: selectedFeaturedPlan==item?ColorManager.primary:ColorManager.white,
                                  border: Border.all(color: ColorManager.textGrey,width: 1.6)
                                // boxShadow: Constants.kBoxShadow
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                               Flexible(child:    AppText(
                                   title:item.name ,
                                   titleAlign: TextAlign.center,
                                   titleMaxLines: 2,fontWeightType: FontWeightType.medium,
                                   titleSize: FontSize.s14,
                                   titleColor: selectedFeaturedPlan==item?ColorManager.white:ColorManager.black),),
                                  AppText(
                                      title:item.price +' '+ item.currency ,
                                      titleAlign: TextAlign.center,
                                      titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                                      titleSize: FontSize.s12,
                                      titleColor: selectedFeaturedPlan==item?ColorManager.white:ColorManager.black),
                                ],
                              )
                            ),
                          ),
                        ],
                      ),

                      const Padding(
                        padding: EdgeInsets.symmetric(vertical:18.0),
                        child: Divider(
                          height: 2,
                          thickness: 1.2,
                          color: ColorManager.divider,
                        ),
                      ),





                      const AppSizeBox(height: 30,),




                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MyTextButton(title: 'Confirm'.tr(),
                              size: Size( .4.sw,  45),
                              radius: 8,
                              fontWeightType: FontWeightType.bold,
                              titleSize: FontSize.s18,
                              primaryColor: ColorManager.primary,
                              titleColor: ColorManager.white,
                              onPressed: (){
                                MakeAdFeaturedModel model=MakeAdFeaturedModel(
                                  propertyId: widget.propertyId,
                                  featuredPlanId: selectedFeaturedPlan.id,
                                );
                                context.read<AddPropertyProvider>().makeAdFeatured(context: context, model: model);
                                // gotoIntro(context: context);

                              }),
                          MyTextButton(title: 'IDontWant'.tr(),
                              size: Size( .4.sw,  45),
                              radius: 8,
                              fontWeightType: FontWeightType.bold,
                              titleSize: FontSize.s18,
                              primaryColor: ColorManager.red,
                              titleColor: ColorManager.white,
                              onPressed: (){
                                gotoIntro(context: context);
                              }),
                        ],
                      ),




                    ],
                  ),
                )


            ),
          ),
        ),

      ),
    );
  }
}
