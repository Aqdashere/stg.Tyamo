import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthHeading extends StatelessWidget {
  final String mainText;
  final String subText;
  final String logo;
  final double fontSize;
  final double logoHeight;

  const AuthHeading(
      {super.key,
      required this.fontSize,
      required this.logo,
      required this.logoHeight,
      required this.mainText,
      required this.subText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
        ),
        Row(
          children: [
            Text(
              mainText,
              style: GoogleFonts.poppins(
                  fontSize: fontSize,
                  color: Color(0xff000221),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 30,
              height: logoHeight,
              child: Image.asset(
                logo,
                filterQuality: FilterQuality.high,
              ),
            ),
          ],
        ),
        Text(
          subText,
          style: GoogleFonts.poppins(
              fontSize: fontSize,
              color: Color(0xff000221),
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
