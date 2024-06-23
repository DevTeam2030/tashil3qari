import 'package:flutter/material.dart';
import '../../../../utilites/image_manager.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Align(
        alignment: Alignment.bottomCenter,
        child: Image.asset(ImageManager.loginButtomImage,fit: BoxFit.fill,));
  }
}
