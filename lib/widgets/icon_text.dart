import 'package:flutter/material.dart';

import '../utils/dimension.dart';
import './small_text.dart';

// ignore: must_be_immutable
class IconText extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  double iconsize;
  final String text;
  IconText({
    Key? key,
    required this.iconData,
    required this.text,
    required this.iconColor,
    this.iconsize = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          iconData,
          color: iconColor,
          size: iconsize == 0.0 ? Dimensions.height15 : iconsize,
        ),
        SizedBox(
          width: Dimensions.width05,
        ),
        SmallText(
          text: text,
          colors: iconColor,
        )
      ],
    );
  }
}
