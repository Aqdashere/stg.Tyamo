import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyamo/Root/root.dart';
import 'package:tyamo/Views/Widgets/Auth/splash_loader_animation.dart';
import '../../../Controller/UserController/user_controller.dart';

class Splash extends StatelessWidget {
 UserController userController = UserController();

  @override
  Widget build(BuildContext context) {

    if (userController.currentUser.uid == null){
      userController = Provider.of<UserController>(context, listen: false);
     return FutureBuilder(
         future: userController.checkUserSigninInfo(),
         builder: (context, snapshot){
           if (snapshot.hasData){
           return Root();
         } else {
           return SplashAnimator();
           }
         }
     );
    }else {
      return Root();
    }
  }
}
