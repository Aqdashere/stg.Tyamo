import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tyamo/Views/Auth/Features/Album/album_main.dart';
import 'package:tyamo/Views/Auth/Features/Album/album_post.dart';
import 'package:tyamo/Views/Auth/Features/Deviceinfo/DeviceSpecs/device_specs.dart';
import 'package:tyamo/Views/Homepage/dashboard.dart';
import 'package:tyamo/Views/Homepage/homepage.dart';

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
          title: 'Tyamo App', //Git 10,10,2025
          home: AlbumPost(),
        );
      },
    );
  }
}
