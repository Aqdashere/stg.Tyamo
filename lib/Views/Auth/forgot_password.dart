import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:tyamo/Interfaces/Auth/forgot_pass_services.dart';
import 'package:tyamo/Views/Widgets/Auth/auth_heading.dart';
import 'package:tyamo/Views/Widgets/Auth/auth_text_field.dart';

class ForgotPassword extends StatelessWidget {
  final RoundedLoadingButtonController _forgotPassBtnController =
      RoundedLoadingButtonController();

  ForgotPassServices forgotPassServices = ForgotPassServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tyamo',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 2, 7, 80),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              AuthHeading(
                  fontSize: 18.sp,
                  logo: 'assets/images/logo.jpg',
                  logoHeight: 30.sp,
                  mainText: "Forgot you Password?",
                  subText: ""),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 25.h,
                width: 25.w,
                child: Image.asset('assets/images/forgot_pass.png'),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "To request for a new one, type your email address below. A link to reset the password will be sent.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 13.sp,
                    letterSpacing: 0.5),
              ),
              SizedBox(
                height: 25,
              ),
              AuthTextField(
                controller: forgotPassServices.emailController,
                  keyboardType: TextInputType.emailAddress,
                  labelSize: 15,
                  labelText: 'Email',
                  obscureText: false,
                  icon: Icons.alternate_email,
                  iconSize: 16,
                  fontSize: 15),
              SizedBox(
                height: 25,
              ),
              Hero(
                tag: "Auth",
                child: RoundedLoadingButton(
                  width: 500,
                  borderRadius: 10,
                  color: Color(0xff00C1AA),
                  controller: _forgotPassBtnController,
                  onPressed: () {},
                  child: Text('Send',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
