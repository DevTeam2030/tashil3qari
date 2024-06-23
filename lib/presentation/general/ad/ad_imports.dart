import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/presentation/general/ad/widgets/widgets_imports.dart';
import 'package:tashil_agary/providers/notifications_provider.dart';
import 'package:tashil_agary/utilites/image_manager.dart';
import '../../../app/contants.dart';
import '../../../app/utils.dart';
import '../../../components/buttons/back_button.dart';
import '../../../components/cach_image.dart';
import '../../../components/screen_loading.dart';
import '../../../components/size_box_height.dart';
import '../../../components/text_field/general_appbar_logo.dart';
import 'package:photo_view/photo_view.dart';

import '../../../domain/model/models/general_property_model.dart';
import '../../../domain/model/models/property_info_model.dart';
import '../../../providers/product_provider.dart';
import '../../../utilites/color_manager.dart';
import '../../../utilites/values_manager.dart';


part 'ad_data.dart';
part 'ad_screen.dart';
part 'ad_photo_view_screen.dart';