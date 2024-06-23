import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/components/cach_image.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/presentation/general/app_screens/language_screen.dart';
import 'package:tashil_agary/presentation/drawer/drawer_item.dart';
import 'package:tashil_agary/presentation/notifications/notifications_screen.dart';
import 'package:tashil_agary/presentation/orders/orders_screen.dart';
import 'package:tashil_agary/providers/auth_provider.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import 'package:tashil_agary/utilites/route_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class DrawerScreen extends StatelessWidget {
  final PagesEnum currentPagesEnum;
  const DrawerScreen({Key? key,required this.currentPagesEnum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Material(
      color: ColorManager.white,
      // borderRadius: const BorderRadius.only(
      //     topRight: Radius.circular(AppSize.s20),
      //     bottomRight: Radius.circular(AppSize.s20)
      // ),
      borderRadius: Constants.isArabic?
      BorderRadius.only(
          topLeft: Radius.circular(AppSize.s20),
          bottomLeft: Radius.circular(AppSize.s20)
      )
          : BorderRadius.only(
          topRight: Radius.circular(AppSize.s20),
          bottomRight: Radius.circular(AppSize.s20)
      ),
      child: SizedBox(
        width: .3.sw,
        height: 1.0.sh,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppSizeBox(height: AppSize.s20,),




              Container(
                // ImageManager.logoPng,
                height: AppSize.s60,
                width: AppSize.s60,
               decoration: BoxDecoration(
                   shape: BoxShape.circle,
                 image: DecorationImage(
                   image: AssetImage(ImageManager.logoPNG_1),
                   fit: BoxFit.fill,
                 ),
               ),
              ),
              const AppSizeBox(height: AppSize.s4,),

              if(Constants.isLogin)
              Consumer<AuthProvider>(
                builder: (context, provider, child) =>Constants.userDataModel!=null?AppSizeBox(height: 0,): AppText(
                    title:Constants.userDataModel!.firstName+' '+Constants.userDataModel!.lastName,
                    titleAlign: TextAlign.start,
                    titleColor: ColorManager.text,
                    titleMaxLines: 2,
                    titleHeight: 1.1,
                    fontWeightType: FontWeightType.medium,
                    titleSize: FontSize.s12),
              ),


              const AppSizeBox(height: AppSize.s10,),

              DrawerItem(
                  title: 'Home'.tr(),
                  iconsData: Icons.home_filled,
                  isCurrentPage: currentPagesEnum==PagesEnum.home,
                  isActive: true,
                  onTap: (){
                // if(Utils.checkIfUserLogin(context: context))
                    gotoIntro(currentIndexScreen: 0,context: context);
              }),
              DrawerItem(
                  title: 'Profile'.tr(),
                  iconsData: FontAwesomeIcons.userLarge,
                  isCurrentPage: currentPagesEnum==PagesEnum.profile,
                  isActive: true,
                  onTap: (){
                    // if(Utils.checkIfUserLogin(context: context))
                    gotoIntro(currentIndexScreen: 3,context: context);
              }),

              DrawerItem(
                  title: 'Notification'.tr(),
                  iconsData: Icons.notifications,
                  isCurrentPage: currentPagesEnum==PagesEnum.notification,
                  isActive: true,
                  onTap: (){
                    // if(Utils.checkIfUserLogin(context: context))
                    Navigator.pop(context);
                    MyRoute().navigate(context: context, route: const NotificationsScreen());
                  }),

              DrawerItem(
                  title: 'Order'.tr(),
                  iconsData: Icons.shopping_cart,
                  isCurrentPage: currentPagesEnum==PagesEnum.order,
                  isActive: true,
                  onTap: (){
                    // if(Utils.checkIfUserLogin(context: context))
                    Navigator.pop(context);
                    MyRoute().navigate(context: context, route: const OrdersScreen());
                  }),
              DrawerItem(
                  title: 'Favorite'.tr(),
                  iconsData: Icons.favorite,
                  isCurrentPage: currentPagesEnum==PagesEnum.favorite,
                  isActive: true,
                  onTap: (){
                    // if(Utils.checkIfUserLogin(context: context))

                    gotoIntro(currentIndexScreen: 2,context: context);
                  }),
              DrawerItem(
                  title: 'Language'.tr(),
                  iconsData: Icons.language,
                  isCurrentPage: currentPagesEnum==PagesEnum.language,
                  isActive: true,
                  onTap: (){
                    Navigator.pop(context);
                    MyRoute().navigate(context: context, route: const LanguageScreen());
                  }),

              DrawerItem(
                  title: Constants.isLogin?'LogOut'.tr():"LogIn".tr(),
                  iconsData: Icons.logout,
                  isCurrentPage: currentPagesEnum==PagesEnum.logout,
                  isActive: true,
                  onTap: (){
                    Utils.logOut(context);
                    // if(Utils.checkIfUserLogin(context: context)) MyRoute().navigate(context: context, route: const ViewProfileScreen());
                  }),


              Image.asset(ImageManager.logoPNG_1,height: 70.0.h,width: 70,)
              // DrawerItem(title: 'MyAppointments'.tr(),onTap: (){
              //   if(Utils.checkIfUserLogin(context: context))  MyRoute().navigate(context: context, route: const AppointmentsScreen());
              // }),
              // DrawerItem(title: 'MyFavorites'.tr(),onTap: (){
              //   if(Utils.checkIfUserLogin(context: context))  MyRoute().navigate(context: context, route: const FavoriteScreen());
              // }),
              // DrawerItem(title: 'Setting'.tr(),onTap: (){
              //   MyRoute().navigate(context: context, route: const SettingsScreen());
              // }),
              //
              // DrawerItem(title: 'CustomerSupport'.tr(),onTap: ()=>MyRoute().navigate(context: context, route: const CustomerSupportScreen())),
              // DrawerItem(title: 'Language'.tr(),onTap: ()=>MyRoute().navigate(context: context, route: const LanguageScreen())),
              // DrawerItem(title:Constants.isLogin?'LogOut'.tr(): 'LogIn'.tr(),onTap: ()=>Utils.logOut(context), isLastItem: true),
              //
            ],
          ),
        ),
      ),
    );
  }
}
