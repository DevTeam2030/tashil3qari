import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:im_animations/im_animations.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/presentation/general/auht/login/login_screen.dart';
import 'package:tashil_agary/presentation/dashboard/dash_board_screen.dart';
import 'package:tashil_agary/providers/home_provider.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import 'package:tashil_agary/utilites/responsive_manager.dart';
import 'package:tashil_agary/utilites/route_manager.dart';

import '../../../providers/general_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key,});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading=true;
  int splashSeconds=8;

  @override
  void initState() {
    super.initState();
    if(mounted) gotoScreen(context: context);

  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    ResponsiveManager().init(context);
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Stack(
        children: [
          Container(
            height: 1.0.sh,
            width: 1.0.sw,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageManager.background_splash),
                    fit: BoxFit.fill
                )
            ),
            // child:Image.asset(ImageManager.splash_logo)
          ),
          // if(isLoading)
          // Align(
          //     alignment: Alignment.bottomCenter,
          //     child: Padding(
          //       padding: const EdgeInsets.only(bottom:PaddingManager.p40),
          //       child: SizedBox(
          //           height: 100,
          //           width: 1.0.sw,
          //           child:  const SpinKitFadingCircleWidget(),),
          //     ))
        ],
      ),

    );
  }

  gotoScreen({required BuildContext context})async{
    context.read<GeneralProvider>().getSetting(isNotify: false);
    // Future.delayed(  Duration(seconds:splashSeconds)).then((value)async{
    //   // Constants.userDataModel==null?
    //   // MyRoute().navigate(context: context, route: const LoginScreen(),withReplace: true):
    //   MyRoute().navigate(context: context, route: const DashBoardScreen(currentIndexScreen: 0),withReplace: true);
    // });



}


}
