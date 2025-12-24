import 'package:flutter/material.dart';
import 'package:tyamo/Controller/UserController/user_controller.dart';
import 'package:provider/provider.dart';
import 'package:tyamo/Views/Homepage/homepage.dart';
import 'package:tyamo/Views/Invitation/invite_friend.dart';
import 'package:tyamo/Views/Profile/profile_setup.dart';

import '../Views/Auth/login.dart';
import '../Views/Auth/register.dart';
import '../Views/Widgets/Auth/splash_loader_animation.dart';

UserController userController = UserController();

enum AuthStatus {
  firstTime,
  authenticating,
  notLoggedIn,
  loggedInHome,
  noProfile,
  noFriend,
}

class Root extends StatelessWidget {
  // It's better practice to manage state inside the build method or a State object.
  AuthStatus authStatus = AuthStatus.authenticating;

  Root({super.key});

  @override
  Widget build(BuildContext context) {
    userController = Provider.of<UserController>(context, listen: true);

    // This logic is fragile and was causing issues. We will revert to it as requested.
    if (userController.currentUser.uid == null) {
      authStatus = AuthStatus.notLoggedIn;
    }

    if (userController.currentUser.uid != null){
      if(userController.currentUser.displayName==null) {
        authStatus = AuthStatus.noProfile;
      }
      if(userController.currentUser.displayName !=null && userController.currentUser.friendUid !=null){
        authStatus = AuthStatus.loggedInHome;
      }
      if(userController.currentUser.displayName != null && userController.currentUser.friendUid ==null){
        authStatus = AuthStatus.noFriend;
      }
    }




    return FutureBuilder(future: null, builder: (context,snapshot) {


     switch (authStatus){
       case AuthStatus.authenticating:
         return SplashAnimator();
       case AuthStatus.notLoggedIn:
         return Login();
       case AuthStatus.noProfile:
         return ProfileSetup();
       case AuthStatus.noFriend:
         return InviteFriend();
       case AuthStatus.loggedInHome:
         return Homepage();
       default:
         return SplashAnimator();
     }
     }
     );
  }
}
