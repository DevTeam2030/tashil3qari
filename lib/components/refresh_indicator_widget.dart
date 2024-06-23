import 'package:flutter/material.dart';
import 'package:tashil_agary/utilites/color_manager.dart';

class RefreshIndicatorWidget extends StatelessWidget {
  final Function onRefresh;
  final Widget child;
  const RefreshIndicatorWidget({Key? key,required this.onRefresh,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => onRefresh(),
      backgroundColor: ColorManager.primary,
      color: ColorManager.textFormFieldFillColor,
      child: child
    );
  }
}
