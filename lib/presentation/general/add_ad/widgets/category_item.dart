import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/extentions.dart';
import '../../../../app/contants.dart';
import '../../../../app/enums.dart';
import '../../../../components/size_box_height.dart';
import '../../../../domain/model/models/home_catogery_model.dart';
import '../../../../utilites/color_manager.dart';
import '../../../../utilites/font_manager.dart';
import '../../../../utilites/styles_manager.dart';
import '../../../../utilites/values_manager.dart';


class CategoryItem extends StatelessWidget {
  final ValueNotifier<HomeCatogeryModel>  notifier;
  final bool enabled ;
  final Color? color,valueColor;
  const CategoryItem({
    Key? key,
   required this.notifier,
    this.enabled=true,
    this.color,
    this.valueColor,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: notifier,
        builder: (context, value, child) => Container(

          // margin: EdgeInsets.only(top: 110),
          padding: const EdgeInsets.symmetric(
              vertical: PaddingManager.p12, horizontal: PaddingManager.p16),
          width: 1.0.sw,
          // height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(RadiusManager.r12),
            color:color??ColorManager.textGrey,
            // boxShadow: Constants.kBoxShadow
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                title: 'Category'.tr()+' :',
                titleSize: FontSize.s16,
                titleAlign: TextAlign.start,
                titleColor:
                ColorManager.black,
                fontWeightType: FontWeightType.regular,
              ),

              const AppSizeBox(width: 10,),

              Expanded(
                child: Wrap(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: Constants.settingModel.categories.where((element) => element.id!=0)
                      .map((e) =>  Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        FocusScope.of(context).requestFocus( FocusNode());
                        if(enabled){
                          notifier.value = e;
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                           CircleAvatar(
                            radius: 5,
                            backgroundColor: notifier.value == e?ColorManager.primary:ColorManager.grey,
                            child: CircleAvatar(
                              radius:4,
                              backgroundColor:notifier.value == e?ColorManager.primary: ColorManager.textGrey,
                            ),
                          ),

                          const AppSizeBox(width: 4,),
                          AppText(
                            title: e.name,
                            titleSize: FontSize.s12,
                            titleAlign: TextAlign.start,
                            titleColor:
                            ColorManager.black,
                            fontWeightType: FontWeightType.regular,
                          ),
                        ],
                      ),
                    ),
                  ),).toList(),
                ),
              ),



            ],
          ),
        ),);

  }


}
