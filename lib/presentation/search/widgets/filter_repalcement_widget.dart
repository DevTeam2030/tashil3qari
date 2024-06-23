import 'package:flutter/material.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/components/remember_password.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/domain/model/popular_cat_model.dart';

import 'package:tashil_agary/presentation/search/widgets/botom_filter_header_item.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class FilterReplacementWidget extends StatefulWidget {
  final String title;
final List<PopularCatModel> sortList;
final Function(PopularCatModel) onSelected;
final Function(PopularCatModel) isSelected;
// final bool isSelected;
  final bool isCheckBox;
  const FilterReplacementWidget({Key? key,required this.title,
    required this.isSelected,   required this.onSelected,
    required this.sortList,this.isCheckBox=false}) : super(key: key);


  @override
  State<FilterReplacementWidget> createState() => _FilterReplacementWidgetState();
}

class _FilterReplacementWidgetState extends State<FilterReplacementWidget> {
  bool isVisible=true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const AppSizeBox(height: 10,),
        Visibility(
          visible: isVisible,
        replacement: InkWell(
          onTap: (){
            isVisible=!isVisible;
            setState(() {});
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  AppText(title:widget.title,
                    titleSize: FontSize.s18,
                    titleMaxLines: 2,
                    titleAlign: TextAlign.center,
                    titleColor: ColorManager.text,
                    fontWeightType: FontWeightType.medium,),
                  const AppSizeBox(width: 10,),
                  Icon(Icons.arrow_drop_up,color: ColorManager.black,size: 25,)
                ],
              ),

              if(widget.isCheckBox)
              for(var data in widget.sortList)
                CheckBoxWidget(
                  checkBoxValue: widget.isSelected(data),
                  title: data.name,
                  checkBoxFunction: (v)=>widget.onSelected(data),
                )else
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      for(var data in widget.sortList)
                      BottomFilterHeaderItem(
                        onPressed: ()=>widget.onSelected(data),
                        isSelected: widget.isSelected(data),
                        popularCatModel: data,)
                    ],
                  )


            ],
          ),
        ),
          child:InkWell(
            onTap: (){
              isVisible=!isVisible;
              setState(() {});
            },
            child:    Row(
              children: [
                AppText(title:widget.title,
                  titleSize: FontSize.s18,
                  titleMaxLines: 2,
                  titleAlign: TextAlign.center,
                  titleColor: ColorManager.text,
                  fontWeightType: FontWeightType.medium,),
                const AppSizeBox(width: 10,),
                Icon(Icons.arrow_drop_down_sharp,color: ColorManager.black,size: 25,)
              ],
            ),
          ),),

        const AppSizeBox(height: AppSize.s4,),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: PaddingManager.p4),
          child: Divider(height: 2,color: ColorManager.grey,),
        )
      ],
    ) ;
  }
}
