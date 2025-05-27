import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class OneValueCard extends StatelessWidget {
final String value;
final Color clr;

OneValueCard({required this.value, required this.clr});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 160,
      child: Card(
        elevation: 10,
        color: clr,
        child: Center(
          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.center,
            crossAxisAlignment:
            CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    value,
                    textScaler: TextScaler.linear(1),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                        fontWeight:
                        FontWeight.w500),
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