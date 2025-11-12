import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrSettingHeading extends StatelessWidget {
  final String headingText;

  const PrSettingHeading({super.key, required this.headingText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerLeft,
      child: Text(
        headingText,
        textScaler: TextScaler.linear(1),
        style: GoogleFonts.nunito(
          fontSize: 16,
          fontWeight: FontWeight.w900,
          color: Color(0xff671AFC),
        ),
      ),
    );
  }
}
