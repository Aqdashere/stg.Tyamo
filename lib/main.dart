import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tyamo/Views/Auth/Features/Deviceinfo/BatteryInfo/battery_info.dart';
import 'package:tyamo/Views/Auth/Features/Deviceinfo/GeneralInfo/general_info.dart';
import 'package:tyamo/Views/Auth/Features/Deviceinfo/UserStatus/user_status.dart';
import 'package:tyamo/Views/Auth/Features/Deviceinfo/device_info.dart';
import 'package:tyamo/Views/Auth/login.dart';
import 'package:tyamo/Views/Auth/register.dart';
import 'package:tyamo/Views/Auth/forgot_password.dart';
import 'package:tyamo/Views/Homepage/dashboard.dart';
import 'package:tyamo/Views/Homepage/homepage.dart';
import 'package:tyamo/Views/Invitation/accept_invite.dart';
import 'package:tyamo/Views/Invitation/invite_friend.dart';
import 'package:tyamo/Views/Profile/profile.dart';
import 'package:tyamo/Views/Profile/profile_setting.dart';
import 'package:tyamo/Views/Profile/profile_setup.dart';

void main() {
  runApp(const Tyamo());
}

class Tyamo extends StatelessWidget {
  const Tyamo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Tyamo App',
          home: GeneralInfo(),
        );
      },
    );
  }
}
