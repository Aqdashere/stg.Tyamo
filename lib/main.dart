import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tyamo/Views/Auth/login.dart';
import 'package:tyamo/Views/Auth/register.dart';
import 'package:tyamo/Views/Widgets/Auth/splash.dart';
import 'package:tyamo/Views/Widgets/Auth/splash_loader_animation.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Tyamo());
}

class Tyamo extends StatelessWidget {
  const Tyamo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tyamo App',
      home: Splash(),
    );
  }
}
