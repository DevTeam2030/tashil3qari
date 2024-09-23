

import 'package:provider/provider.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/app/validator.dart';
import 'package:tashil_agary/components/loading_manager.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/components/text_field/text_field_imports.dart';
import 'package:tashil_agary/domain/model/models/user_data_model.dart';
import 'package:tashil_agary/presentation/dashboard/dash_board_screen.dart';
import 'package:tashil_agary/providers/auth_provider.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/route_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginData{
  final formKey = GlobalKey<FormState>();
  // TextEditingController userNameController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool rememberPassword=false;

  login({required BuildContext context}){

    FocusScope.of(context).requestFocus( FocusNode());

    if(formKey.currentState!.validate()){
      context.read<AuthProvider>().login(context: context, idNumber: idNumberController.text.trim(),
          password: passwordController.text.trim(),);
    }
  }
  visitor({required BuildContext context}){
    MyRoute().navigate(context: context, route: const DashBoardScreen(currentIndexScreen: 0),);
  }

}