import 'package:flutter/material.dart';

class AppSizeBox extends StatelessWidget {
  final double? height;
  final double? width;
  const AppSizeBox({Key? key, this.height,this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height??0,
      width: width??0,
    );
  }
}
