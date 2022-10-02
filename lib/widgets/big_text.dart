import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  final String text;
  final Color? colors;
  double fontSize;
  TextOverflow overflow;
  BigText({
    Key? key,
    required this.text,
    this.colors = Colors.white,
    this.fontSize = 25.0,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: GoogleFonts.acme(
        fontWeight: FontWeight.w400,
        fontSize: fontSize,
        color: colors,
      ).copyWith(
        overflow: overflow,
      ),
    );
  }
}
