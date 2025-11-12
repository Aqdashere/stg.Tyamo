import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientButtonContainer extends StatelessWidget {
  final String title;
  final List<Color> clr;
  final Color overlayColor;
  final bool isGradientVertical;

  const GradientButtonContainer(
      {super.key,
      required this.clr,
      required this.title,
      required this.overlayColor,
      required this.isGradientVertical});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: clr,
                    begin: isGradientVertical
                        ? Alignment.topCenter
                        : Alignment.centerLeft,
                    end: isGradientVertical
                        ? Alignment.bottomCenter
                        : Alignment.centerRight),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                )),
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                elevation: WidgetStateProperty.all<double>(0),
                overlayColor: WidgetStateProperty.all<Color>(
                  overlayColor,
                ),
                padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.all(0),
                ),
                backgroundColor: WidgetStateProperty.all<Color>(
                  Colors.transparent,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
