import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import '../../../../app/contants.dart';
import '../../../../app/enums.dart';
import '../../../../app/utils.dart';
import '../../../../domain/model/models/country_model.dart';
import '../../../../domain/model/models/general_property_model.dart';
import '../../../../utilites/color_manager.dart';
import '../../../../utilites/font_manager.dart';
import '../../../../utilites/route_manager.dart';
import '../../../../utilites/styles_manager.dart';
import '../../search_list/search_list_screen.dart';




class HomeShowAll extends StatelessWidget {
  final List<GeneralPropertyModel> properties;
  final CityModel city;
  const HomeShowAll({super.key,required this.properties,required this.city});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:Constants.isArabic? Alignment.bottomRight:Alignment.bottomLeft,
      child: Container(
        width: 120,
        height: 40,
        decoration: Utils.returnDropdownButtonDecoration(ColorManager.primary,
          ColorManager.primary,10),
        margin:  const EdgeInsets.only(bottom: 30,right: 10,left: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: InkWell(
          splashColor: ColorManager.white,
          highlightColor:ColorManager.white ,
          onTap: (){
            // MyRoute().navigate(context: context, route:  SearchListScreen(properties: properties,));
            MyRoute().navigate(context: context, route:  SearchListScreen(properties: const [],city:city));
          } ,
          child: Row(
            children: [
              SvgPicture.asset(ImageManager.filterSvg,height: 18,width: 18,),
              const AppSizeBox(width: 4,),
              AppText(
                  title: 'View all'.tr(),
                  titleAlign: TextAlign.start,
                  titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                  titleSize: FontSize.s12,titleColor: ColorManager.white)
            ],

          )
        ),
      ),
    );
  }
}

