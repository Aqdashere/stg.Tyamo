import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OneValueCard extends StatelessWidget {
  final String value;
  final Color clr;
  final Color? txtClr;

  const OneValueCard(
      {super.key, required this.value, required this.clr, this.txtClr});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: 160,
      child: Card(
        elevation: 10,
        color: clr,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    value,
                    textScaler: TextScaler.linear(1),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                        fontSize: 15,
                        color: txtClr ?? Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
