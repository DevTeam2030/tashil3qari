import 'package:flutter/material.dart';
import 'package:rate/rate.dart';

import '../utilites/color_manager.dart';


class BuildRateWidget extends StatelessWidget {
  final double rate,iconSize;
  final bool readOnly;
  final Function(double v)? onChange;
  const BuildRateWidget({super.key,required this.rate,this.readOnly=true,this.onChange,this.iconSize=16});

  @override
  Widget build(BuildContext context) {
    return Rate(
      iconSize: iconSize,
      color: ColorManager.orange,
      allowHalf: false,
      allowClear: true,
      initialValue: rate,
      readOnly: readOnly,
      onChange: (value) {
        if(onChange!=null) onChange!(value);
      },
    );
  }
}
