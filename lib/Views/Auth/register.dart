import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tyamo/Controller/UserController/user_controller.dart';
import 'package:tyamo/Interfaces/Auth/register_services.dart';
import 'package:tyamo/Views/Auth/login.dart';
import '../Widgets/Auth/auth_heading.dart';
import '../Widgets/Auth/auth_text_field.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final RoundedLoadingButtonController _registerBtnController =
      RoundedLoadingButtonController();

  late final RegisterServices registerServices;

  @override
  void initState() {
    super.initState();
    registerServices = RegisterServices();
  }

  @override
  void dispose() {
    registerServices.dispose();
    super.dispose();
  }

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
          backgroundColor: const Color.fromARGB(255, 2, 7, 80),
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
                  fontSize: 18,
                  logo: "assets/images/logo.jpg",
                  logoHeight: 30,
                ), //Heading Text
                const SizedBox(
                  height: 40,
                ),
                AuthTextField(
                    key: const ValueKey('email_field'),
                    controller: registerServices.emailController,
                    keyboardType: TextInputType.emailAddress,
                    labelSize: 15,
                    labelText: 'Email',
                    obscureText: false,
                    icon: Icons.alternate_email,
                    iconSize: 16,
                    fontSize: 15), //Email Textbox
                const SizedBox(
                  height: 10,
                ),
                AuthTextField(
                    key: const ValueKey('username_field'),
                    controller: registerServices.usernameController,
                    keyboardType: TextInputType.emailAddress,
                    labelSize: 15,
                    labelText: 'Username',
                    obscureText: false,
                    icon: Icons.abc,
                    iconSize: 16,
                    fontSize: 15),
                const SizedBox(
                  height: 10,
                ),
                AuthTextField(
                    key: const ValueKey('password_field'),
                    controller: registerServices.passController,
                    keyboardType: TextInputType.visiblePassword,
                    labelSize: 15,
                    labelText: 'Password',
                    obscureText: true,
                    icon: Icons.password,
                    iconSize: 16,
                    fontSize: 15),
                const SizedBox(
                  height: 10,
                ),
                AuthTextField(
                    key: const ValueKey('confirm_password_field'),
                    controller: registerServices.confirmPassController,
                    keyboardType: TextInputType.visiblePassword,
                    labelSize: 15,
                    labelText: 'Confirm Password',
                    obscureText: true,
                    icon: Icons.replay,
                    iconSize: 16,
                    fontSize: 15),
                const SizedBox(
                  height: 10,
                ),
                AuthTextField(
                    key: const ValueKey('referral_code_field'),
                    controller: registerServices.referralCodeController,
                    keyboardType: TextInputType.visiblePassword,
                    labelSize: 15,
                    labelText: 'Referral Code',
                    obscureText: true,
                    icon: Icons.card_giftcard,
                    iconSize: 16,
                    fontSize: 15),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "*You can skip this if you are not referred by anyone",
                    style: GoogleFonts.poppins(
                        color: const Color(0xffC1272D),
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                        letterSpacing: 0.5),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Hero(
                  tag: "Auth",
                  child: RoundedLoadingButton(
                    disabledColor: const Color(0xff2F76EA),
                    width: 500,
                    borderRadius: 10,
                    color: const Color(0xff00C1AA),
                    controller: _registerBtnController,
                    onPressed: () {
                      if (registerServices.passController.text ==
                          registerServices.confirmPassController.text) {
                        UserController().registerUser(
                            registerServices.emailController.text,
                            registerServices.passController.text,
                            registerServices.usernameController.text,
                            registerServices.referralCodeController.text);
                      } else {
                        print('Password Do not Match');
                      }
                    },
                    child: Text('Register',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "By signing up you agree to our terms and conditions",
                    style: GoogleFonts.poppins(
                        color: Colors.black54,
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        letterSpacing: 0.5),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
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
                            fontSize: 14),
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
