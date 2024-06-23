part of'edit_ad_imports.dart';


class EditAdScreen extends StatefulWidget {
final UserAdsModel userAd;
  const EditAdScreen({Key? key,required this.userAd}) : super(key: key);

  @override
  State<EditAdScreen> createState() => _EditAdScreenState();
}

class _EditAdScreenState extends State<EditAdScreen> {

 late EditAdData editAdData=EditAdData(ad: widget.userAd);



  @override
  void initState() {

    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<AddPropertyProvider>(
      builder: (context, provider, child) => ScreenLoading(
        isLoading: provider.isLoading,
        height: 1.0.sh,
        width: 1.0.sw,
        child:Scaffold(

          // appBar: GeneralAppBar(title: 'AddAd'.tr(),showChatNotify: false,showDivider: false),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyTextButton(title: 'edit'.tr(),
                    size: Size( .8.sw,  47),
                    radius: 6,
                    fontWeightType: FontWeightType.bold,
                    titleSize: FontSize.s18,
                    primaryColor: ColorManager.primary,
                    titleColor: ColorManager.white,
                    onPressed: (){
                  editAdData.editProperty(context: context);
                      // MyRoute().navigate(context: context, route: AddAdImagesScreen(addAdtData: addAdtData,));
                    }),
              ],
            ),
          ),
          body: InkWell(
            splashColor:ColorManager.white,
            focusColor: ColorManager.white,
            onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
            child: SizedBox(
                height: 1.0.sh,
                width: 1.0.sw,

                child:SingleChildScrollView(
                  child: Form(
                    key: editAdData.formKey,
                    child: Column(
                      children: [
                        EditAdSlider(editAdData: editAdData),

                        // AdAdvertiserData(editAdData: editAdData),

                        AdDetailsData(editAdData: editAdData),
                        // BidWidget(editAdData: editAdData),




                        const AppSizeBox(height: 20,),
                      ],
                    ),
                  ),
                )


            ),
          ),
        )
      ),
    );
  }
}
