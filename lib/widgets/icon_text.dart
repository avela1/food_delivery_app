import 'package:flutter/material.dart';

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
    this.iconsize = 14.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          iconData,
          color: iconColor,
          size: iconsize,
        ),
        const SizedBox(
          width: 5.0,
        ),
        SmallText(
          text: text,
          colors: iconColor,
        )
      ],
    );
  }
}
