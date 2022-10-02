import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  final String text;
  final Color? colors;
  double fontSize;
  double height;
  SmallText({
    Key? key,
    required this.text,
    this.colors = Colors.grey,
    this.fontSize = 14.0,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.aBeeZee(
        fontSize: fontSize,
        fontStyle: FontStyle.italic,
        color: colors,
      ).copyWith(
        height: height,
      ),
    );
  }
}
