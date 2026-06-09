
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'CustomStyle.dart';

class CustomText extends StatelessWidget {
  String txt;
  double size;
  Color color;
  bool isBold;

  CustomText({
    super.key,
    required this.txt,
    this.size = 15,
    this.color = Colors.white,
    this.isBold = true,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style:
        // Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 30)
        // Theme.of(context).textTheme.headlineMedium
      customStyle()
      // TextStyle(
      //   fontSize: size,
      //   color: color,
      //   fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal,
      // ),
    );
  }
}

class CustomFontText extends StatelessWidget {
  String txt;
  double size;
  Color color;
  bool isBold;

  CustomFontText({
    super.key,
    required this.txt,
    this.size = 15,
    this.color = Colors.white,
    this.isBold = true,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal,
        // fontFamily: 'customFont'
        fontFamily: GoogleFonts.playwriteGbJ().fontFamily,
      ),
    );
  }
}
