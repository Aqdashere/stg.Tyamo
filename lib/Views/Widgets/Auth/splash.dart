import 'package:flutter/material.dart';
import 'package:tyamo/Views/Widgets/Auth/splash_loader_animation.dart';
import '../../../Controller/UserController/user_controller.dart';

class Splash extends StatelessWidget {
 UserController userController = UserController();

  @override
  Widget build(BuildContext context) {

    if (userController.currentUser.uid == null){
     return FutureBuilder(
         future: userController.checkUserSigninInfo(),
         builder: (context, snapshot){
           if (snapshot.hasData){
           return Container();
         } else {
           return SplashAnimator();
           }
         }
     );
    }else {
      return Container();
    }
  }
}
