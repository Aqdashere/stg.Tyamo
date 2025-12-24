import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:tyamo/Model/my_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tyamo/Service/user_database.dart';

class UserController with ChangeNotifier { //provider
  MyUser currentUser = MyUser();

  FirebaseAuth auth = FirebaseAuth.instance;

  UserController() {
    checkUserSigninInfo();
  }

  Future<bool> registerUser(String email, String pass, String username, String referralCode) async {

    MyUser user = MyUser();

    try {
      UserCredential authResult =
      await auth.createUserWithEmailAndPassword(email: email, password: pass);

      if (authResult.user != null) {
        print("Adding Info to Database");
        user.uid = authResult.user!.uid;
        user.email = authResult.user!.email;
        user.password = pass;
        user.username = username;
        user.referralCode = referralCode;

        UserDatabase().createUserInDb(user); //in Service/user_database.dart

      }
      return true;
    } catch (e){
      print(e);
      return false;
    }
  }

  Future<bool> loginUser(String email, String pass) async {
    try {
      // Only perform the sign-in. The authStateChanges listener will handle the rest.
      await auth.signInWithEmailAndPassword(email: email, password: pass);
      return true;
    } catch (e) {
      print(e);
      return false;
    }

  }

Future<bool> signout() async {
    try{
      // This is the only thing that should be here.
      // The authStateChanges listener will handle the state update.
      await auth.signOut();
    return true;
    } catch (e){
      print(e);
      return false;
    }

}


  void setCurrentUser(MyUser user){
    currentUser = user;
    notifyListeners();
  }


Future<MyUser> checkUserSigninInfo() async{

    try{
      auth.authStateChanges().listen((event) async {
        if(event == null){
          // User is signed out, set state to a new empty user
          setCurrentUser(MyUser());
        } else {
          // User is signed in, fetch their data
          MyUser myUser = await UserDatabase().getUserInfobyId(event.uid);
          myUser.isLoadingStartupData=false;
          setCurrentUser(myUser);
        }
      });
      // This function's return value isn't being used effectively,
      // but we return an empty user to satisfy the type.
      // The provider state is managed by the listener above.
      return MyUser();
    } catch(e){
      print(e);
      return MyUser();
    }

}

}
