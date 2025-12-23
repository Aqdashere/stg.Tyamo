import 'package:flutter/material.dart';

class RegisterServices {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController referralCodeController = TextEditingController();



  void dispose(){
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    usernameController.dispose();
    referralCodeController.dispose();
  }

 // Future<bool> registerUserToFirebase(String email, String password) {}
}