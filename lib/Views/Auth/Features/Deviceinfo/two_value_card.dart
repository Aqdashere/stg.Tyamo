import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TwoValueCard extends StatelessWidget {
  final String text;
  final String value;
  final Widget? subWidget;
  final Color? clr;
  final Color? textclr;

  const TwoValueCard(
      {super.key,
      required this.text,
      required this.value,
      this.clr,
      this.subWidget,
      this.textclr});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      width: double.infinity,
      child: Card(
        elevation: 10,
        color: clr ?? Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            subWidget ??
                Text(
                  value,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w900,
                      color: textclr ?? Color(0xFFF57D7C),
                      fontSize: 18),
                ),
          ],
        ),
      ),
    );
  }
}
