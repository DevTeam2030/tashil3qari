import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/extentions.dart';
import 'package:tashil_agary/components/size_box_height.dart';

import '../../../../app/enums.dart';
import '../../../../app/utils.dart';
import '../../../../components/buttons/back_button.dart';
import '../../../../components/buttons/text_button.dart';
import '../../../../components/cach_image.dart';
import '../../../../components/loading_manager.dart';
import '../../../../domain/model/models/auction_data_model.dart';
import '../../../../providers/wishlist_provider.dart';
import '../../../../utilites/color_manager.dart';
import '../../../../utilites/font_manager.dart';
import '../../../../utilites/image_manager.dart';
import '../../../../utilites/route_manager.dart';
import '../../../../utilites/styles_manager.dart';
import '../../../../utilites/values_manager.dart';
import '../../../../app/validator.dart';
import '../../../../components/text_field/text_field_imports.dart';
import '../../ad/ad_imports.dart';
import '../../your_consultant/your_consultant_imports.dart';
import '../bid_imports.dart';


part 'bid_slider.dart';
part 'remaining_time.dart';
part 'bids_widget.dart';
part 'bid_person_widget.dart';
