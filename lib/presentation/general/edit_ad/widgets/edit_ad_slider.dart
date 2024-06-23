part of'widgets_imports.dart';


class EditAdSlider extends StatefulWidget {
  final EditAdData editAdData;
  const EditAdSlider({super.key,required this.editAdData});

  @override
  State<EditAdSlider> createState() => _EditAdSliderState();
}

class _EditAdSliderState extends State<EditAdSlider> {
  ValueNotifier<int> imageIndex = ValueNotifier<int>(0);
  double height= .42.sh;
  @override
  Widget build(BuildContext context) {

    return Container(
      height: height,
      width: 1.0.sw,
      color: Colors.white,
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height:height,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: false,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                imageIndex.value=index;
              },
            ),
            items:widget.editAdData.userAd.gallery.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return CachedImage(
                    url: i.url,
                    fit: BoxFit.cover,
                  );
                },
              );
            }).toList(),
          ),









          Align(
            alignment: Alignment.topCenter,
            child:Padding(
              padding: const EdgeInsets.only(top: 40,left: 16,right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackAppBarButton(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                    decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: ColorManager.black.withOpacity(.16),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          )
                        ]
                    ),
                    child: AppText(
                        title: 'Edit property data'.tr(),
                        titleAlign: TextAlign.center,
                        titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
                        titleSize: FontSize.s14,titleColor: ColorManager.black),
                  ),



                  if(widget.editAdData.userAd.gallery.length>1)
                  InkWell(
                    onTap: ()=>widget.editAdData.deleteImageFromAd(image:widget.editAdData.userAd.gallery[imageIndex.value],
                    context: context,
                    onDelete: ()async{
                      Navigator.pop(context);
                     bool data=await context.read<AddPropertyProvider>().
                      deleteImageFromAd(context: context, imageId:widget.editAdData.userAd.gallery[imageIndex.value].id,);
                     if(data){
                       widget.editAdData.userAd.gallery.remove(widget.editAdData.userAd.gallery[imageIndex.value]);
                       setState(() {});
                     }
                    }),
                    child:  Container(
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorManager.textGrey,
                        // borderRadius: BorderRadius.circular(AppSize.s12)
                      ),
                      child: const Icon(Icons.delete_rounded,
                          color: ColorManager.icons,size: AppSize.s18),
                    ),
                  )
                  else AppSizeBox(width: 0,),
                  if(false)
                  EditAdMoreDropdownButton(editAdData: widget.editAdData,)
                ],
              ),
            ),
          ),




        ],
      )
    );
  }
}
