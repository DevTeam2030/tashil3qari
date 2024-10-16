part of'add_ad_imports.dart';

class AddAdImagesScreen extends StatefulWidget {
  final AddAdtData addAdtData;
  const AddAdImagesScreen({Key? key,required this.addAdtData}) : super(key: key);

  @override
  State<AddAdImagesScreen> createState() => _AddAdImagesScreenState();
}

class _AddAdImagesScreenState extends State<AddAdImagesScreen> {

 late AddAdtData addAdtData;



  @override
  void initState() {
    super.initState();
    addAdtData=widget.addAdtData;
  }


  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(title: 'Add photos of property'.tr(),showChatNotify: false,showDivider: false),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextButton(title: 'PostAd'.tr(),
                size: Size( .8.sw,  47),
                radius: 6,
                fontWeightType: FontWeightType.bold,
                titleSize: FontSize.s18,
                primaryColor: ColorManager.primary,
                titleColor: ColorManager.white,
                onPressed: (){

              if(addAdtData.adImages.value.isNotEmpty) {
                  MyRoute().navigate(context: context, route: AddAdLocationScreen(addAdtData: addAdtData,));
              }else{
                MyRoute().navigate(context: context, route: AddAdLocationScreen(addAdtData: addAdtData,));
                LoadingDialog.showSimpleToast('PleaseEnterAllDataCorrectly'.tr());
              }
                }),
          ],
        ),
      ),
      body: InkWell(
        splashColor:ColorManager.white,
        focusColor: ColorManager.white,
        onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
        child: Container(
          height: 1.0.sh,
          width: 1.0.sw,
          padding: const EdgeInsets.symmetric(horizontal: 14),
         child:CustomScrollView(
           // shrinkWrap: true,
           physics: const ClampingScrollPhysics(),
           slivers: [
             SliverList(
               delegate: SliverChildListDelegate([
                 const AppSizeBox(height: 20,),
                 Row(

                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     AppText(
                         title: 'Add photos to your ad'.tr(),
                         titleAlign: TextAlign.start,
                         titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                         titleSize: FontSize.s20,titleColor: ColorManager.black),


                     InkWell(
                       onTap: ()async{
                         var photos=await Utils.pickMultiImage();
                         addAdtData.adImages.value.addAll(photos);
                             setState(() {});
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
                 const AppSizeBox(height: 20,),
               ]),
             ),

             ValueListenableBuilder(valueListenable: addAdtData.adImages,
                 builder: (context, value, child) => SliverGrid(
                   gridDelegate:
                   const SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2,
                     mainAxisSpacing: 4,
                     crossAxisSpacing: 6,
                     childAspectRatio: .95,
                   ),
                   delegate: SliverChildBuilderDelegate(
                         (context, index) {
                       return AdAImageWidget(imageFile: value[index],
                       onRemove: (){
                         widget.addAdtData.adImages.value.remove(value[index]);
                         // widget.addAdtData.adImages.value=widget.addAdtData.adImages.value;;
                         setState(() {});
                       },);
                     },
                     // childCount:widget.cat.subCategories.length,
                     childCount:value.length,
                   ),
                 ),),


             SliverList(
               delegate: SliverChildListDelegate([
                 const AppSizeBox(height: 30,),
                 Row(

                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     AppText(
                         title: 'Add video to your ad'.tr(),
                         titleAlign: TextAlign.start,
                         titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                         titleSize: FontSize.s20,titleColor: ColorManager.black),


                     InkWell(
                       onTap: ()async{
                         var video=await Utils.getVideo();
                         addAdtData.video.value=video;
                         // setState(() {});
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

                 ValueListenableBuilder(valueListenable: addAdtData.video,
                   builder: (context, value, child) =>value==null?AppSizeBox(width: 0,):
                   Padding(padding: EdgeInsets.symmetric(vertical: 30,),
                   child:Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Flexible(child: AppText(
                           title: value.path.split('/').last,
                           titleAlign: TextAlign.start,
                           titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                           titleSize: FontSize.s20,titleColor: ColorManager.black)),

                       AppSizeBox(width: 10,),
                       InkWell(
                         onTap: ()=>addAdtData.video.value=null,
                         child: Icon(Icons.delete,color: ColorManager.red,),
                       )
                     ],
                   ),),),

               ]),
             ),


           ],
         )


        ),
      ),
    );
  }
}
