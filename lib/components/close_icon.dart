import 'package:flutter/material.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class CloseIcon extends StatelessWidget {
  const CloseIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     InkWell(
      onTap: ()=>Navigator.pop(context),
      child: CircleAvatar(
          backgroundColor: ColorManager.red,
          radius: 17,
          child: CircleAvatar(
              radius: 16,
              backgroundColor: ColorManager.white,
              child: const Icon(Icons.close_sharp,
                color: ColorManager.red,size: AppSize.s25,))),
    );
  }
}
