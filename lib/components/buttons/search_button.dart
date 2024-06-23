import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/presentation/search/search_screen.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/route_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.0.sw,
      height: AppSize.s40,
      padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p12,),
      decoration: Utils.returnDropdownButtonDecoration(),
      child: InkWell(
        onTap: ()async{

          MyRoute().navigate(context: context, route: const SearchScreen(cat: null, subCat: null,));
        },
        child: Row(
          children: [
            const Icon(Icons.search,color: ColorManager.green,size: AppSize.s25,),
            const AppSizeBox(width: AppSize.s2,),
            AppText(title: 'search'.tr(),
              titleSize: FontSize.s14,
              titleMaxLines: 1,
              titleColor: ColorManager.text,
              titleAlign: TextAlign.start,
              fontWeightType: FontWeightType.regular,),
          ],
        ),
      ),
    );
  }
}
