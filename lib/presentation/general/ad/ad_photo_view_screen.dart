part of'ad_imports.dart';


class AdPhotoViewScreen extends StatefulWidget {
  final   PropertyInfoModel propertyInfo;
  final int? currentImageIndex ;
  const AdPhotoViewScreen({Key? key,required this.propertyInfo,this.currentImageIndex}) : super(key: key);

  @override
  State<AdPhotoViewScreen> createState() => _AdPhotoViewScreenState();
}

class _AdPhotoViewScreenState extends State<AdPhotoViewScreen> {
  late  PageController _controller = PageController(initialPage: widget.currentImageIndex??0,);


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
    return Scaffold(

      // appBar: GeneralAppBar(title: 'AddAd'.tr(),showChatNotify: false,showDivider: false),

      body: Stack(
        children: [
          PageView.builder(
              controller: _controller,
              itemCount: widget.propertyInfo.gallery.length,
              onPageChanged: (index) {
                // page.value = index;
              },
              itemBuilder: (context, index) => PhotoViewWidget(image:widget.propertyInfo.gallery[index])
          ),
          // SizedBox(
          //   height: 1.0.sh,
          //   width: 1.0.sw,
          //
          //  child: PhotoViewWidget(image: widget.propertyInfo.gallery[widget.currentImageIndex??0],)
          //),




          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    for(int i=0;i<widget.propertyInfo.gallery.length;i++)
                      AddImageSquare(image: widget.propertyInfo.gallery[i],onTap: (){

                      },),


                  ],
                ),
              ),
            ),
          ),


          Align(
            alignment: Alignment.bottomRight,
            child: PhotoViewAdvertiserDataWidget(propertyInfo: widget.propertyInfo,)
          ),


          Align(
            alignment: Alignment.centerRight,
            child:InkWell(
                onTap: (){
                  _controller.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                },child: SvgPicture.asset(ImageManager.moveNextSvg )),
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
                onTap: (){
                  _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                },
                child: SvgPicture.asset(ImageManager.moveBackSvg )),
          ),


          Align(
            alignment: Alignment.topCenter,
            child:Padding(
              padding: const EdgeInsets.only(top: 40,left: 16,right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  BackAppBarButton(),


                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
