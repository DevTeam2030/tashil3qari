part of'home_imports.dart';

class CountWidget extends StatelessWidget {
  const CountWidget({super.key, required this.count});
  final int count;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Text('$count'),
    );
  }
}

class MarkerWidget extends StatelessWidget {
  const MarkerWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,width: 100,
      decoration: const BoxDecoration(
        color: Colors.red,
        image: DecorationImage(
          image: AssetImage(
            ImageManager.chat,
          ),
          fit: BoxFit.cover,

        ),
      )
    );
  }
}

class TextOnImage extends StatelessWidget {
  const TextOnImage({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // const Image(
        //   image: AssetImage(
        //     ImageManager.home,
        //   ),
        //   height: 150,
        //   width: 150,
        // ),
        Text(
          'text',
          style: const TextStyle(color: Colors.black),
        )
      ],
    );
  }
}


class MoreIcon extends StatelessWidget {
  final int number;
  const MoreIcon({super.key,required this.number});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.all(3),
          decoration: const BoxDecoration(
            color: ColorManager.primary,
            shape: BoxShape.circle,
          ),
          child: Container(
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ColorManager.white,
              shape: BoxShape.circle,
            ),
            child:    Text(
              '$number',
              style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
            )
            // Icon(Icons.more_horiz,color: ColorManager.primary,),
          ),
        ),
        Image.asset(
          ImageManager.polygon,
          width: 25,
          height: 25,
          fit: BoxFit.cover,
          color: ColorManager.primary)
      ],
    );
  }
}
// class MoreTextPrice extends StatelessWidget {
//   const MoreTextPrice({
//     super.key,
//     required this.ads
//   });
//   final List<GeneralPropertyModel>ads;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       constraints:  BoxConstraints(
//         maxWidth: 100,
//         minWidth: 25,
//         minHeight: 30,
//         maxHeight:type==MapAdType.premium?100: 75
//       ),
//       child: Stack(
//         fit: StackFit.loose,
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//
//               Container(
//                 margin:
//                     auction==true? EdgeInsets.only(top:type==MapAdType.premium?27:10,left: 9):
//                 type==MapAdType.premium?
//                 const EdgeInsets.only(top:10,left: 10):EdgeInsets.zero,
//                 // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                 width: 100,
//                 height: 40,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: type==MapAdType.primary?ColorManager.primary:ColorManager.white,
//                   border: Border.all(
//                     color: type==MapAdType.premium?ColorManager.premium:
//                     (type==MapAdType.primary?ColorManager.primary:ColorManager.other),
//                     width: 1.6,
//                   ),
//                 ),
//                 child:  AppText(
//                     title: '$price $currency',
//                     titleAlign: TextAlign.start,
//                     titleMaxLines: 1,
//                     fontWeightType: FontWeightType.medium,
//                     titleSize: FontSize.s14,
//                     titleColor: type==MapAdType.premium?ColorManager.premium:
//                     (type==MapAdType.primary?ColorManager.white:ColorManager.other),),
//               ),
//               Image.asset(
//                 ImageManager.polygon,
//                 width: 25,
//                 height: 25,
//                 fit: BoxFit.cover,
//                 color: type==MapAdType.premium?ColorManager.premium:
//               (type==MapAdType.primary?ColorManager.primary:ColorManager.other),)
//             ],
//           ),
//
//           if(type==MapAdType.premium)
//           Row(
//             children: [
//               Image.asset(
//                 ImageManager.tag,
//                 width: 30,
//                 height: 30,
//                 fit: BoxFit.cover,
//               )
//             ],
//           ),
//
//           if(auction==true)
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               CircleAvatar(
//                 radius: 12,
//                 backgroundColor: ColorManager.white,
//                 child: SvgPicture.asset(ImageManager.applyAuctions,color: ColorManager.primary,),
//               ),
//
//               SizedBox(   height: 10,)
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

class TextPrice extends StatelessWidget {
  const TextPrice({
    super.key,
    required this.price,
    required this.currency,
    required this.type,
    this.auction=false
  });
  final String price,currency;
  final MapAdType type;
  final bool? auction;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:  BoxConstraints(
          maxWidth: 100,
          minWidth: 25,
          minHeight: 30,
          maxHeight:type==MapAdType.premium?100: 75
      ),
      child: Stack(
        fit: StackFit.loose,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [

              Container(
                margin:
                auction==true? EdgeInsets.only(top:type==MapAdType.premium?27:10,left: 9):
                type==MapAdType.premium?
                const EdgeInsets.only(top:10,left: 10):EdgeInsets.zero,
                // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                width: 100,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: type==MapAdType.primary?ColorManager.primary:ColorManager.white,
                  border: Border.all(
                    color: type==MapAdType.premium?ColorManager.premium:
                    (type==MapAdType.primary?ColorManager.primary:ColorManager.other),
                    width: 1.6,
                  ),
                ),
                child:  AppText(
                  title: '$price $currency',
                  titleAlign: TextAlign.start,
                  titleMaxLines: 1,
                  fontWeightType: FontWeightType.medium,
                  titleSize: FontSize.s14,
                  titleColor: type==MapAdType.premium?ColorManager.premium:
                  (type==MapAdType.primary?ColorManager.white:ColorManager.other),),
              ),
              Image.asset(
                ImageManager.polygon,
                width: 25,
                height: 25,
                fit: BoxFit.cover,
                color: type==MapAdType.premium?ColorManager.premium:
                (type==MapAdType.primary?ColorManager.primary:ColorManager.other),)
            ],
          ),

          if(type==MapAdType.premium)
            Row(
              children: [
                Image.asset(
                  ImageManager.tag,
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                )
              ],
            ),

          if(auction==true)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: ColorManager.white,
                  child: SvgPicture.asset(ImageManager.applyAuctions,color: ColorManager.primary,),
                ),

                SizedBox(   height: 10,)
              ],
            )
        ],
      ),
    );
  }
}


class TextBoxWidget extends StatelessWidget {
  const TextBoxWidget({
    super.key,
    required this.text,

  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
          // height: 40,
          // width: 50,
          // alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorManager.primary.withOpacity(.5),
            border: Border.all(
              color: ColorManager.primary,
              width: 1,
            ),
          ),


          child:AppText(
              title: text,
              titleAlign: TextAlign.center,
              titleMaxLines: 2,
              titleHeight: 1.4,
              fontWeightType: FontWeightType.medium,
              titleSize: FontSize.s12,
              titleColor: ColorManager.white),),
            Image.asset(
              ImageManager.polygon2,
              width: 20,
              height: 20,
              fit: BoxFit.fill,
              color:ColorManager.primary

        ),


          ],
        );
  }
}

class TextBoxWidget2 extends StatelessWidget {
  const TextBoxWidget2({
    super.key,
    required this.text,

  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [


        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
          // height: 30,
          // width: 30,
          // alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorManager.primary.withOpacity(.8),
            border: Border.all(
              color: ColorManager.primary,
              width: 1,
            ),
          ),


          child:AppText(
              title: text,
              titleAlign: TextAlign.center,
              titleMaxLines: 2,
              titleHeight: 1.4,
              fontWeightType: FontWeightType.medium,
              titleSize: FontSize.s12,
              titleColor: ColorManager.white),),
            Image.asset(
              ImageManager.polygon2,
              width: 20,
              height: 20,
              fit: BoxFit.fill,
              color:ColorManager.primary

        ),


          ],
        );
  }
}
class TextImage extends StatelessWidget {
  const TextImage({
    super.key,
    required this.image,
    required this.text,

  });
  final String image,text;

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [


            Container(
              // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              width: 50,height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:ColorManager.white,
                border: Border.all(
                  color: ColorManager.primary,
                  width: 1,
                ),
              ),


              child:  Stack(
                children: [
                  // Container(
                  //     width: 50,height: 50,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     color:ColorManager.primary,
                  //     image: DecorationImage(
                  //       image: AssetImage(
                  //         ImageManager.country,
                  //       ),
                  //       fit: BoxFit.cover,
                  //   ),
                  // )),
                  Container(
                      width: 50,height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:ColorManager.primary,
                      image: DecorationImage(
                        image: NetworkImage(
                            image
                        ),
                        fit: BoxFit.cover,
                    ),
                  )),
                  // if(false)
                  // CachedImage(
                  //   url:image,
                  //   width: 50,height: 50,
                  //   fit: BoxFit.cover,
                  //   borderRadius: BorderRadius.circular(10),
                  //   border: Border.all(
                  //     color: ColorManager.primary,
                  //     width: 1,
                  //   ),
                  // ),
                  Center(
                    child: AppText(
                        title: text,
                        titleAlign: TextAlign.center,
                        titleMaxLines: 1,
                        fontWeightType: FontWeightType.extraBold,
                        titleSize: FontSize.s12,
                        titleColor: ColorManager.white),
                  ),
                ],
              ),),
            Image.asset(
              ImageManager.polygon,
              width: 30,
              height: 30,
              fit: BoxFit.cover,
              color:ColorManager.primary

        ),


      ],
    )]);
  }
}





// Uint8List createCustomMarkerIcon(String text, String image) {
//   // إنشاء صورة بيانية (Bitmap) للماركر باستخدام CustomMarker
//   final iconSize = 80;
//   final widget = TextImage(text: text,image:image ,);
//   final pictureRecorder = PictureRecorder();
//   final canvas = Canvas(pictureRecorder, Rect.fromPoints(Offset(0.0, 0.0), Offset(iconSize.toDouble(), iconSize.toDouble())));
//   widget.paint(canvas, Size(iconSize.toDouble(), iconSize.toDouble()));
//
//   final picture = pictureRecorder.endRecording();
//   final img = picture.toImage(iconSize, iconSize);
//   final pngBytes = img.toByteData(format: ImageByteFormat.png);
//
//   return Uint8List.view(pngBytes!.buffer);
// }
