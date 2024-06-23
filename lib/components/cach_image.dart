import 'package:cached_network_image/cached_network_image.dart';
import 'package:tashil_agary/components/screen_loading.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class CachedImage extends StatefulWidget {
  String url;
  String? errorholder;
  BoxFit? fit;
  double? height, width;
  BorderRadius? borderRadius;
  BoxBorder? border;
  ColorFilter? colorFilter;
  Color? colorImage;
  Alignment alignment;
  Widget? child;
  BoxShape boxShape;
  double verticalPadding;
  double horizontalPadding;
  final bool? showImageLoading;

  CachedImage(
      {Key? key,
      required this.url,
      this.fit,
      this.errorholder,
      // this.fit = BoxFit.fill,
      this.width,
      this.height,
      this.borderRadius,
      this.border,
      this.colorFilter,
      this.alignment = Alignment.center,
      this.child,
      this.colorImage,
      this.verticalPadding = 0,
      this.horizontalPadding = 0,
      this.showImageLoading = true,
      this.boxShape = BoxShape.rectangle})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CachedImageState();
}

class _CachedImageState extends State<CachedImage> {
  @override
  Widget build(BuildContext context) {
    return
// SizedBox(
//         width: widget.width,
//         height: widget.height,
//         child:   Image.asset(
//           widget.url,
//           width: widget.width,
//           height: widget.height,
//           fit: widget.fit??BoxFit.cover,
//
//
//         ) ,
//       )

        widget.url.contains('.svg')
            ? SizedBox(
                width: widget.width,
                height: widget.height,
                child: SvgPicture.network(
                  widget.url,
                  width: widget.width,
                  height: widget.height,
                  fit: widget.fit ?? BoxFit.cover,
                  color: widget.colorImage,
                  placeholderBuilder: (context) => Container(
                    width: widget.width,
                    height: widget.height,
                    alignment: Alignment.center,
                    child: const SpinKitRippleWidget(),
                  ),
                ),
              )
            : CachedNetworkImage(
                imageUrl: widget.url,
                width: widget.width,
                height: widget.height,
                color: widget.colorImage,
                imageBuilder: (context, imageProvider) => Container(
                  width: widget.width,
                  height: widget.height,
                  // padding: EdgeInsets.symmetric(vertical:widget.verticalPadding ,horizontal:widget.horizontalPadding ),
                  decoration: BoxDecoration(
                      // color: ColorManager.error,
                      image: DecorationImage(
                          image: imageProvider,
                          fit: widget.fit,
                          colorFilter: widget.colorFilter),
                      borderRadius: widget.borderRadius,
                      border: widget.border,
                      shape: widget.boxShape),
                  alignment: widget.alignment,
                  child: widget.child,
                ),
                placeholder: (context, url) => Container(
                  width: widget.width,
                  height: widget.height,
                  alignment: Alignment.center,
                  // color: widget.showImageLoading==false?ColorManager.primaryWithOpacity:null,
                  child: widget.showImageLoading == true
                      ? const SpinKitRippleWidget()
                      : Text(''),
                ),
                errorWidget: (context, url, error) => Container(
                    width: widget.width,
                    height: widget.height,
                    decoration: BoxDecoration(
                        // color: ColorManager.error,
                        image: DecorationImage(
                          // image: AssetImage(widget.errorholder??ImageManager.splashLogo),
                          image: const AssetImage(ImageManager.placeHolder),
                          fit: widget.fit,
                          // colorFilter: widget.colorFilter
                        ),
                        borderRadius: widget.borderRadius,
                        shape: widget.boxShape)
                    // alignment: Alignment.center,
                    // child: Image.asset(widget.errorholder??ImageManager.logo,fit: BoxFit.fill,)
                    ),
              );
  }
}
