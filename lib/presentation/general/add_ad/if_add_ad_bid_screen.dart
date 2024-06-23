part of'add_ad_imports.dart';

class IfAddAdBidScreen extends StatelessWidget {
  final int propertyId;
  final bool isPropertyFeatured;
  const IfAddAdBidScreen({Key? key,required this.propertyId,this.isPropertyFeatured=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        return false;
      },
      child: Scaffold(

        appBar:AppBar(
          title:     Row(
            children: [
              InkWell(
                onTap: (){
                  if(isPropertyFeatured){
                    gotoIntro(context: context);
                  }else{
                    MyRoute().navigate(context: context, route: AddAdFeaturedScreen(propertyId: propertyId,));
                  }
                },
                child: AppText(
                    title: 'Skip'.tr(),
                    titleAlign: TextAlign.center,
                    titleMaxLines: 1,fontWeightType: FontWeightType.semiBold,
                    titleSize: FontSize.s17,titleColor: ColorManager.black),
              ),
            ],
          ),
          actions: [],
          leading: AppSizeBox(width: 0),
          leadingWidth: 10,
        ),

        body: Container(
            height: 1.0.sh,
            width: 1.0.sw,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child:SingleChildScrollView(
              child: Column(
                children: [
                  const AppSizeBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                          title: 'likeBidAd'.tr(),
                          titleAlign: TextAlign.start,
                          titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
                          titleSize: FontSize.s16,
                          titleColor:ColorManager.black),


                    ],
                  ),




                  const AppSizeBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyTextButton(title: 'YesIWant'.tr(),
                          size: Size( .4.sw,  45),
                          radius: 8,
                          fontWeightType: FontWeightType.bold,
                          titleSize: FontSize.s18,
                          primaryColor: ColorManager.primary,
                          titleColor: ColorManager.white,
                          onPressed: (){
                            MyRoute().navigate(context: context, route: AddAdBidScreen(propertyId: propertyId,isPropertyFeatured: isPropertyFeatured,));
                          }),

                      MyTextButton(title: 'IDontWant'.tr(),
                          size: Size( .4.sw,  45),
                          radius: 8,
                          fontWeightType: FontWeightType.bold,
                          titleSize: FontSize.s18,
                          primaryColor: ColorManager.red,
                          titleColor: ColorManager.white,
                          onPressed: (){
                            if(isPropertyFeatured){
                              gotoIntro(context: context);
                            }else{
                              MyRoute().navigate(context: context, route: AddAdFeaturedScreen(propertyId: propertyId,));
                            }

                          }),
                    ],
                  ),
                  const AppSizeBox(height: 20,),








                ],
              ),
            )


        ),
      ),
    );
  }
}
