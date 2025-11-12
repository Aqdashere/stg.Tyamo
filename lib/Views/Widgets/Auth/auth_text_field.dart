import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthTextField extends StatelessWidget {
  final TextInputType keyboardType;
  final String labelText;
  final bool obscureText;
  final IconData icon;
  final double labelSize;
  final double fontSize;
  final double iconSize;

  const AuthTextField({
    super.key,
    required this.keyboardType,
    required this.labelSize,
    required this.labelText,
    required this.obscureText,
    required this.icon,
    required this.iconSize,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.start,
      textInputAction: TextInputAction.none,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
      ),
      obscureText: obscureText,
      autofocus: false,
      keyboardType: keyboardType,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
          fillColor: Color(0xffE7E7F2),
          filled: true,
          prefixIcon: Icon(
            icon,
            size: iconSize,
          ),
          prefixIconColor: Color(0xff00205C),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
            borderSide: BorderSide
                .none, //After Floating label removal the arrow comes down thats why we use this
            borderRadius: BorderRadius.circular(10),
          ),
          label: Text(
            labelText,
            style: GoogleFonts.poppins(
              fontSize: labelSize,
            ),
          )),
    );
  }
}
