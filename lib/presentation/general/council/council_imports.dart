


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/presentation/general/council/widgets/widgets_imports.dart';

import '../../../app/contants.dart';
import '../../../app/enums.dart';
import '../../../app/utils.dart';
import '../../../app/validator.dart';
import '../../../components/buttons/text_button.dart';
import '../../../components/loading_manager.dart';
import '../../../components/no_data_available.dart';
import '../../../components/screen_loading.dart';
import '../../../components/text_field/general_appbar_logo.dart';
import '../../../components/text_field/text_field_imports.dart';
import '../../../domain/model/models/agreements_model.dart';
import '../../../domain/model/models/consultant_model.dart';
import '../../../domain/model/models/post_model.dart';
import '../../../providers/add_property_provider.dart';
import '../../../providers/agreements_provider.dart';
import '../../../providers/consultant_provider.dart';
import '../../../providers/council_provider.dart';
import '../../../utilites/color_manager.dart';
import '../../../utilites/font_manager.dart';
import '../../../utilites/image_manager.dart';
import '../../../utilites/styles_manager.dart';
import '../../../utilites/values_manager.dart';
import '../add_ad/widgets/widgetImports.dart';

part 'council_data.dart';
part 'council_screen.dart';
part 'add_consultant_agreement_screen.dart';