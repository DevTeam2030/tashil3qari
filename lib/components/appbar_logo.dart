import 'package:flutter/material.dart';
import 'package:tashil_agary/utilites/image_manager.dart';

class AppbarLogo extends StatelessWidget {
  const AppbarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return    Image.asset(ImageManager.splash_logo,width: 100,height: 35);
  }
}


