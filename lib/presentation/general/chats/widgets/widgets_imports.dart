
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/cach_image.dart';
import 'package:tashil_agary/components/size_box_height.dart';
import 'package:tashil_agary/presentation/general/your_consultant/your_consultant_imports.dart';
import 'package:tashil_agary/providers/chat_provider.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:tashil_agary/utilites/route_manager.dart';
import 'package:tashil_agary/utilites/styles_manager.dart';
import 'package:tashil_agary/utilites/values_manager.dart';

import '../../../../app/url_luncher.dart';
import '../../../../app/utils.dart';
import '../../../../components/buttons/back_button.dart';
import '../../../../components/buttons/text_button.dart';
import '../../../../components/loading_manager.dart';
import '../../../../components/text_field/text_field_imports.dart';
import '../../../../domain/model/agreement/agreement_details_model.dart';
import '../../../../domain/model/models/agreements_model.dart';
import '../../../../domain/model/models/consultant_model.dart';
import '../../../../providers/agreements_provider.dart';
import '../../../../providers/chat_agreement_provider.dart';
import '../../../../utilites/image_manager.dart';
import '../chat/chat.dart';
import '../make_agreement/make_agreement_imports.dart';
import '../model/chat_message_model.dart';



part 'chat_appbar.dart';
part 'one_chat_item.dart';
part 'delete_chat_widget.dart';
// part 'message_chat_item.dart';
part 'reject_reason_argeement_widget.dart';
part 'agreement_chat_item.dart';
part 'agreement_consultant_widget.dart';
part 'agreement_added_consultant_widget.dart';