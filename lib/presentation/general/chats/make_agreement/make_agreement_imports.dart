import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/app/validator.dart';
import 'package:tashil_agary/components/buttons/text_button.dart';
import 'package:tashil_agary/components/screen_loading.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/components/text_field/text_field_imports.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

import '../../../../app/contants.dart';
import '../../../../components/loading_manager.dart';
import '../../../../components/remember_password.dart';
import '../../../../components/text_field/general_appbar_logo.dart';
import '../../../../domain/model/agreement/accept_agreement_model.dart';
import '../../../../domain/model/agreement/add_consultant_agreement_model.dart';
import '../../../../domain/model/agreement/agreement_details_model.dart';
import '../../../../domain/model/models/consultant_model.dart';
import '../../../../providers/agreements_provider.dart';
import '../../../../providers/chat_agreement_provider.dart';
import '../../../../providers/consultant_provider.dart';
import '../../../../utilites/route_manager.dart';
import '../model/chat_message_model.dart';
import '../widgets/widgets_imports.dart';


part 'make_agreement_data.dart';
part 'make_agreement_screen.dart';
part 'add_consultant_agreement_2screen.dart';
part 'previous_consults_widget.dart';