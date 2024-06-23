import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';
import 'package:flutter/material.dart';

class ScreenLoading extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget child;
  final bool isLoading;

  const ScreenLoading(
      {Key? key, this.width, this.height, required this.child, required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 1.0.sh,
      width: width ?? 1.0.sw,
   // color:  Constants.isDarkMode?ColorManager.darkMode:ColorManager.lightMode,
      child: Stack(
        children: [
          child,
          // if(isLoading)
          //   Container(
          //       height: height ?? 1.0.sh,
          //       width: width ?? 1.0.sw,
          //       color: ColorManager.transparent,
          //       child:  const AppProgressIndicator()),

          if(isLoading)
            Container(
              height: height ?? 1.0.sh,
              width: width ?? 1.0.sw,
              color: ColorManager.transparent,
              child:const SpinKitFadingCircleWidget(),
              // const AppProgressIndicator()
            ),
        ],
      ),
    );
  }
}
class SpinKitRippleWidget extends StatelessWidget {
  const SpinKitRippleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

      SpinKitRipple(
        // SpinKitSpinningCircle(
        // color: ColorManager.primaryButtonColor,
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index.isEven ?  ColorManager.primaryWithOpacity :  ColorManager.primary,
            ),
          );
        },

        size: AppSize.s55,


      );
  }
}
class SpinKitFadingCircleWidget extends StatelessWidget {
  const SpinKitFadingCircleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

      SpinKitThreeBounce(
        // SpinKitSpinningCircle(
        // color: ColorManager.primaryButtonColor,
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index.isEven ?  ColorManager.primary :  ColorManager.primaryWithOpacity,
            ),
          );
        },

        size: AppSize.s50,


      );
  }
}

class SpinThreeInOutWidget extends StatelessWidget {
  const SpinThreeInOutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

      SpinKitThreeInOut(
        // SpinKitSpinningCircle(
        color: ColorManager.primaryWithOpacity,
        size: AppSize.s50,


      );
  }
}