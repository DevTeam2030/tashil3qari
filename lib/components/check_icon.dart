import 'package:flutter/material.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

class CheckIcon extends StatelessWidget {
  final Color primaryColor;
  final Color fillColor;
  const CheckIcon({Key? key,required this.primaryColor,required this.fillColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      backgroundColor: primaryColor,
      radius: 14,
      child: CircleAvatar(
        backgroundColor: fillColor,
        radius: 13,
        child: Icon(
          Icons.check,
          color: primaryColor,
          size: AppSize.s18,),
      ),
    );
  }
}
class ConfirmIcon extends StatelessWidget {
  final Color primaryColor;
  final Color iconColor;
  const ConfirmIcon({Key? key,required this.primaryColor,required this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      backgroundColor: primaryColor,
      radius: 14,
      child: Icon(
        Icons.check,
        color: iconColor,
        size: AppSize.s18,),
    );
  }
}

class CustomCircleIcon extends StatelessWidget {
  final Color primaryColor;
  final Color iconColor;
  final IconData iconData;
  const CustomCircleIcon({Key? key,required this.primaryColor,required this.iconColor,required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      backgroundColor: primaryColor,
      radius: 14,
      child: Icon(
        iconData,
        color: iconColor,
        size: AppSize.s18,),
    );
  }
}
class CircleMoreIcon extends StatelessWidget {
  final Color primaryColor;
  final Color fillColor;
  const CircleMoreIcon({Key? key,required this.primaryColor,required this.fillColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      backgroundColor: primaryColor,
      radius: 14,
      child: CircleAvatar(
        backgroundColor: fillColor,
        radius: 13,
        child: Icon(
          Icons.more_horiz,
          color: primaryColor,
          size: AppSize.s18,),
      ),
    );
  }
}
class CircleIcon extends StatelessWidget {
  final Color primaryColor;
  final Color fillColor;
  const CircleIcon({Key? key,required this.primaryColor,required this.fillColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      backgroundColor: primaryColor,
      radius: 14,
      child: CircleAvatar(
        backgroundColor: fillColor,
        radius: 13,
        // child: Icon(
        //   Icons.more_horiz,
        //   color: primaryColor,
        //   size: AppSize.s18,),
      ),
    );
  }
}

class GoIcon extends StatelessWidget {
  final Color primaryColor;
  final Color fillColor;
  const GoIcon({Key? key,required this.primaryColor,required this.fillColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      backgroundColor: primaryColor,
      radius: 14,
      child: CircleAvatar(
        backgroundColor: fillColor,
        radius: 13,
        child: Icon(
          Icons.keyboard_arrow_right,
          color: primaryColor,
          size: AppSize.s18,),
      ),
    );
  }
}