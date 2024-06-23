import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/extentions.dart';

import '../../../../app/enums.dart';
import '../../../../components/buttons/text_button.dart';
import '../../../../components/size_box_height.dart';
import '../../../../utilites/color_manager.dart';
import '../../../../utilites/font_manager.dart';
import '../../../../utilites/route_manager.dart';
import '../../../../utilites/styles_manager.dart';
import '../../../../utilites/values_manager.dart';
import '../../../dashboard/dash_board_screen.dart';

class VisitorButton extends StatelessWidget {
  const VisitorButton({super.key,});

  @override
  Widget build(BuildContext context) {
    return
      MyTextButton(title: 'visitor'.tr(),
        size: Size( .8.sw,  47),
        radius: 8,
        fontWeightType: FontWeightType.extraBold,
        titleSize: FontSize.s14,
        primaryColor: ColorManager.white,
        titleColor: ColorManager.primary,
        borderColor: ColorManager.primary,
        onPressed: (){
    MyRoute().navigate(context: context, route: const DashBoardScreen(currentIndexScreen: 0),);
    });}

}
