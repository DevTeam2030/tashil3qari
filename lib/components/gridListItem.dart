

import 'package:flutter/material.dart';
import 'package:tashil_agary/components/size_box_height.dart';

import '../utilites/color_manager.dart';
import '../utilites/image_manager.dart';
import '../utilites/values_manager.dart';

class GridListItem extends StatelessWidget {
  final bool showAsList;
final  Function(bool) onTap;
  const GridListItem({super.key,required this.showAsList,required this.onTap}) ;

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 35,
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 6),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RadiusManager.r18),
        color: ColorManager.textGrey,
        // boxShadow: Constants.kBoxShadow
      ),
      child: Row(
        children: [

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(RadiusManager.r12),
              color:showAsList?ColorManager.white: ColorManager.transparent,
              // boxShadow: Constants.kBoxShadow
            ),
            child:  InkWell(onTap: ()=>onTap(true),
                child: Image.asset(ImageManager.list,height: 30,width: 30,
                  color: showAsList?ColorManager.primary:null,)),

          ),
          const AppSizeBox(width: 10,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(RadiusManager.r12),
              color:!showAsList?ColorManager.white: ColorManager.transparent,
              // boxShadow: Constants.kBoxShadow
            ),
            child: InkWell(
                onTap: ()=>onTap(false),
                child: Image.asset(ImageManager.grid,height: 30,width: 30,
                  color: !showAsList?ColorManager.primary:null,)),

          ),
        ],
      ),

    );
  }
}
