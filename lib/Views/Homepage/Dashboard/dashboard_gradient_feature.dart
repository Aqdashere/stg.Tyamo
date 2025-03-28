import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardGradientFeature extends StatelessWidget {
final String iconImg;
final String btnText;
final List<Color> clr;
final FontWeight? weight;

DashboardGradientFeature({required this.btnText, required this.clr, required this.iconImg, this.weight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 3.0),
                blurRadius: 3.0,
              ),
            ],
            gradient: LinearGradient(colors: clr),),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(iconImg),
            Flexible(
              child: Text(
                btnText,
                style:
                GoogleFonts.nunito(fontWeight: weight ?? FontWeight.w300),
              ),
            )
          ],
        ),
      ),
    );
  }
}