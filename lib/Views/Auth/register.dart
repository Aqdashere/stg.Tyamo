import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tyamo/Views/Auth/login.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Widgets/Auth/auth_heading.dart';
import '../Widgets/Auth/auth_text_field.dart';

class Register extends StatelessWidget {
  final RoundedLoadingButtonController _registerBtnController =
      RoundedLoadingButtonController();

  Register({super.key});

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
            padding: const EdgeInsets.only(top: 0, left: 30, right: 30),
            child: Column(
              children: [
                AuthHeading(
                  mainText: 'Sign up to Tyamo',
                  subText: 'Get connected with \nyour partner',
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
                  height: 10,
                ),
                AuthTextField(
                    keyboardType: TextInputType.emailAddress,
                    labelSize: 15.sp,
                    labelText: 'Username',
                    obscureText: false,
                    icon: Icons.abc,
                    iconSize: 16.sp,
                    fontSize: 15.sp),
                SizedBox(
                  height: 10,
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
                  height: 10,
                ),
                AuthTextField(
                    keyboardType: TextInputType.visiblePassword,
                    labelSize: 15.sp,
                    labelText: 'Confirm Password',
                    obscureText: true,
                    icon: Icons.replay,
                    iconSize: 16.sp,
                    fontSize: 15.sp),
                SizedBox(
                  height: 10,
                ),
                AuthTextField(
                    keyboardType: TextInputType.visiblePassword,
                    labelSize: 15.sp,
                    labelText: 'Referral Code',
                    obscureText: true,
                    icon: Icons.card_giftcard,
                    iconSize: 16.sp,
                    fontSize: 15.sp),
                SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "*You can skip this if you are not referred by anyone",
                    style: GoogleFonts.poppins(
                        color: const Color(0xffC1272D),
                        fontWeight: FontWeight.normal,
                        fontSize: 13.sp,
                        letterSpacing: 0.5),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Hero(
                  tag: "Auth",
                  child: RoundedLoadingButton(
                    width: 500,
                    borderRadius: 10,
                    color: Color(0xff00C1AA),
                    controller: _registerBtnController,
                    onPressed: () {},
                    child: Text('Register',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "By signing up you agree to our terms and conditions",
                    style: GoogleFonts.poppins(
                        color: Colors.black54,
                        fontWeight: FontWeight.normal,
                        fontSize: 12.sp,
                        letterSpacing: 0.5),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                        color: const Color(0xff5A5B5B),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade, child: Login()),
                        );
                      },
                      child: Text(
                        "Sign In",
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

class _btnController {}
