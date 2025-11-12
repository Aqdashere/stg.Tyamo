import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopBanner extends StatelessWidget {
  final String title;
  final List<Color> clr;

  const TopBanner({super.key, required this.clr, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: clr),
      ),
      child: Text(
        title,
        style: GoogleFonts.nunito(
          fontWeight: FontWeight.w900,
          fontSize: 20,
          color: Colors.white,
          letterSpacing: 2,
        ),
      ),
    );
  }
}
