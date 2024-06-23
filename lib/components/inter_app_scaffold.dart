import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/buttons/text_button.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import 'package:tashil_agary/utilites/responsive_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
class InterAppScaffold extends StatelessWidget {
  final Widget content;
  final EdgeInsetsGeometry? padding;
  const InterAppScaffold({super.key,required this.content,this.padding});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.serviceColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(AppSize.s64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Row(
              children: [
                const AppSizeBox(width: AppSize.s2,),
                InkWell(
                  onTap: ()=>Navigator.canPop(context)?Navigator.pop(context):(){},
                  // splashColor: ColorManager.transparent,
                  // hoverColor: ColorManager.transparent ,
                  // highlightColor:  ColorManager.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppSizeBox(width: AppSize.s10.w,),
                      Icon(Icons.arrow_back_ios_rounded,color: ColorManager.primaryWithOpacity,size: AppSize.s14),
                      AppSizeBox(width: AppSize.s8.w,),
                      AppText(title:'back'.tr(),
                        titleColor:ColorManager.primary ,titleMaxLines: 1, titleSize:FontSize.s14,),
                    ],
                  ),
                ),
                AppSizeBox(height: AppSize.s20.h,)
              ],
            ),
            AppSizeBox(height: AppSize.s20.h,)
          ],

        ),
      ),
      body: Container(
          height: 1.0.sh,
          width: 1.0.sw,
          padding:padding?? EdgeInsets.symmetric(horizontal: PaddingManager.p12.w),
          decoration: BoxDecoration(
              color: ColorManager.white,
              // borderRadius: const BorderRadius.only(
              //     topRight: Radius.circular(RadiusManager.r25),
              //     topLeft: Radius.circular(RadiusManager.r25)
              // )
          ),
          child:content
      ),

    );
  }
}


