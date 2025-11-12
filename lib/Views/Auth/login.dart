import 'dart:async';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:tyamo/Views/Auth/forgot_password.dart';
import 'package:tyamo/Views/Auth/register.dart';
import 'package:tyamo/Views/Profile/profile_setup.dart';
import 'package:tyamo/Views/Widgets/Auth/auth_heading.dart';
import 'package:tyamo/Views/Widgets/Auth/auth_text_field.dart';
import 'package:page_transition/page_transition.dart';

class Login extends StatelessWidget {
  final RoundedLoadingButtonController _loginBtnController =
      RoundedLoadingButtonController();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
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
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                AuthHeading(
                  mainText: 'Sign in to Tyamo',
                  subText: 'To connect with \nyour partner',
                  fontSize: 18.sp,
                  logo: "assets/images/logo.jpg",
                  logoHeight: 30.sp,
                ), //Heading Text
                SizedBox(
                  height: 40,
                ),
                AuthTextField(
                    keyboardType: TextInputType.emailAddress,
                    labelSize: 15.sp,
                    labelText: 'Email',
                    obscureText: false,
                    icon: Icons.alternate_email,
                    iconSize: 16.sp,
                    fontSize: 15.sp), //Email Textbox
                SizedBox(
                  height: 20,
                ),
                AuthTextField(
                    keyboardType: TextInputType.visiblePassword,
                    labelSize: 15.sp,
                    labelText: 'Password',
                    obscureText: true,
                    icon: Icons.password,
                    iconSize: 16.sp,
                    fontSize: 15.sp),
                SizedBox(
                  height: 20,
                ),
                Hero(
                  tag: "Auth",
                  child: RoundedLoadingButton(
                    width: 500,
                    borderRadius: 10,
                    color: Color(0xff00C1AA),
                    controller: _loginBtnController,
                    onPressed: () {
                      Timer(Duration(seconds: 2), (){
                        _loginBtnController.success();
                        Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: ProfileSetup()),);
                      });
                    },
                    child: Text('Login',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                        )),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: ForgotPassword()),);
                    },
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.poppins(
                          color: const Color(0xffC1272D),
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          letterSpacing: 0.5),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                        color: const Color(0xff5A5B5B),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: Register(),),);
                      },
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(
                            color: const Color(0xff2F76EA),
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp),
                      ),
                    ), // Text
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
