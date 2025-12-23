import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tyamo/Model/my_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tyamo/Service/user_database.dart';

class UserController {
  MyUser currentUser = MyUser();

  FirebaseAuth auth = FirebaseAuth.instance;
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
      UserCredential loginResult =
      await auth.signInWithEmailAndPassword(email: email, password: pass);


    if (loginResult.user!= null){
     currentUser = await UserDatabase().getUserInfobyId(loginResult.user!.uid);
    print(currentUser.email);
    }
      return true;
    } catch (e) {
      print(e);
      return false;
    }

  }

Future<bool> signout() async {
    try{
      await auth.signOut();
    return true;
    } catch (e){
      print(e);
      return false;
    }

}

Future<MyUser> checkUserSigninInfo() async{

    try{
      MyUser myUser = MyUser();
      myUser.isLoadingStartupData = true;
      currentUser = myUser;
      auth.authStateChanges().listen((event) async {
        if(event?.uid == null){
          myUser.uid == null;
          myUser.isLoadingStartupData= false;
          currentUser = myUser;
        } else {
          myUser.uid = event?.uid;
          myUser = await UserDatabase().getUserInfobyId(auth.currentUser!.uid);
          myUser.isLoadingStartupData=false;
          currentUser = myUser;

        }
      });
      return myUser;
    } catch(e){
      print(e);
      return null!;
    }

}

}

