import 'dart:io';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/presentation/dashboard/bottom_dash_board_item2.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import 'package:tashil_agary/utilites/route_manager.dart';
import '../../app/contants.dart';
import '../../app/enums.dart';
import '../../components/loading_manager.dart';
import '../general/add_ad/add_ad_imports.dart';
import '../general/council/council_imports.dart';
import '../general/home_Screen/home_imports.dart';
import '../general/personal_profile/personal_profile_imports.dart';
import '../general/services/services_imports.dart';
import '../general/your_consultant/your_consultant_imports.dart';


class DashBoardScreen extends StatefulWidget {
  final int? currentIndexScreen;
  const DashBoardScreen({Key? key,this.currentIndexScreen}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
int screenIndex=0;
// List screens=[const HomeScreen(),const YourConsultantScreen(), const ServicesScreen(),const PersonalProfileScreen(),];
List screens=[const HomeScreen(),
  !Constants.isLogin||Constants.userDataModel==null||Constants.userDataModel!.isUser?
  const YourConsultantScreen():const CouncilScreen(),
  // const AuctionsScreen(),
  const ServicesScreen(),
  const PersonalProfileScreen(),];

  @override
  void initState() {
    super.initState();
    screens=[const HomeScreen(),
      !Constants.isLogin||Constants.userDataModel==null||Constants.userDataModel!.isUser?
      const YourConsultantScreen():const CouncilScreen(),
      // const AuctionsScreen(),
      const ServicesScreen(),
      const PersonalProfileScreen(),];
    // context.read<GeneralProvider>().setUserCountry(context: context);
    // context.read<HomeProvider>().initDataCitiesMarkers(context: context,);
if(widget.currentIndexScreen!=null)screenIndex=widget.currentIndexScreen!;
  }
List<String>images=[ImageManager.homeSvg,
  !Constants.isLogin||Constants.userDataModel==null||Constants.userDataModel!.isUser?ImageManager.advisorSvg:ImageManager.home2Svg,
  ImageManager.ourServicesSvg,
  // ImageManager.auctionSvg,
  ImageManager.userSvg];

List<String>titles=['Main'.tr(),
  !Constants.isLogin||Constants.userDataModel==null||Constants.userDataModel!.isUser?'Your advisor'.tr():'Council'.tr(),
  'Services'.tr(),
  // 'Auctions'.tr(),
  'MyAccount'.tr(),];

// List<String>titles=['Main'.tr(),'Your advisor'.tr(),'Our services'.tr(),'MyAccount'.tr(),];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if(screenIndex!=0){
          setState(()=>screenIndex=0);
          return false;
        }
        LoadingDialog().optionalAgreeAlertDialog(context: context,
          title: 'ExitApplication'.tr(),
          message: 'CloseApp'.tr(),
          okClick: (){
            exit(0);

          },
        );
        return false;
      },
      child: Scaffold(
        floatingActionButton: CircleAvatar(
          radius: 27,
          backgroundColor: ColorManager.primary.withOpacity(.6),
          child: InkWell(
            onTap: () {
              // _fabAnimationController.reset();
              // _borderRadiusAnimationController.reset();
              // _borderRadiusAnimationController.forward();
              // _fabAnimationController.forward();
              // screenIndex=4;
              if(Utils.checkIfUserLogin(context: context)){

              var  userType=Constants.userDataModel!.isUser?UserType.user:UserType.consultant;
              bool documented=Constants.userDataModel!.documented;
              if(userType==UserType.user){
                MyRoute().navigate(context: context, route: const AddAdScreen());
              }else{
                if(documented) {
                  MyRoute().navigate(context: context, route: const AddAdScreen());
                } else{
                  LoadingDialog().titleMessageAlert(
                    context: context,
                    title: 'AddAd'.tr(),
                    message: 'PleaseWaitForAccountVerification'.tr(),
                  );
                }
              }

              }
            },
            child: Icon(
              Icons.add,
              size: 30,
              color: ColorManager.white,
            ),
          ),

        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: images.length,
          height: 60,
          tabBuilder: (int index, bool isActive) {
              return DashBoardItem2(
                title: titles[index],
                image: images[index],
                isActive: screenIndex==index,
                onTap: (){
                  if(index!=3) {
                    setState(()=>screenIndex=index);
                  } else if(Utils.checkIfUserLogin(context: context)) {
                    setState(()=>screenIndex=index);
                  }
                },
              );
          },
          backgroundColor: ColorManager.white,
          activeIndex: screenIndex,
          // splashColor: ColorManager.activeNavigationBarColor,
          // notchAndCornersAnimation: borderRadiusAnimation,
          splashSpeedInMilliseconds: 300,
          notchSmoothness: NotchSmoothness.defaultEdge,
          gapLocation: GapLocation.center,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap: (index) => setState(() => screenIndex = index),
          // hideAnimationController: _hideBottomBarAnimationController,
          shadow: const BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 12,
            spreadRadius: 0.5,
            color: ColorManager.grey,
          ),
        ),

          body: Container(
            height: 1.0.sh,
            width: 1.0.sw,
            color: ColorManager.fff.withOpacity(.1),
            child: screens[screenIndex],
          ),
        // body:screens[screenIndex]
      ),
    );
  }


}
