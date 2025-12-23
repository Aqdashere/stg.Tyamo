import 'package:cloud_firestore/cloud_firestore.dart';
import '../Model/my_user.dart';

class UserDatabase {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<bool> createUserInDb(MyUser user) async {
    try {
      await firestore.collection("users").doc(user!.uid).set({
        "uid": user.uid,
        "email": user.email,
        "password": user.password,
        "username": user.username,
        "accountCreated": Timestamp.now(),
        "avatarUrl": user.avatarUrl,
        "friendUid": user.friendUid,
        "chatRoomId": user.chatRoomId,
        "gender": user.gender,
        "displayName": user.displayName,
        "phone": user.phone,
        "referralCode": user.referralCode,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<MyUser> getUserInfobyId(String uid) async {
    MyUser myUser = MyUser();
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await firestore.collection("users").doc(uid).get();

    myUser.uid = documentSnapshot.data()!["uid"];
    myUser.email = documentSnapshot.data()!["email"];
    myUser.username = documentSnapshot.data()!["username"];
    myUser.avatarUrl = documentSnapshot.data()!["avatarUrl"];
    myUser.displayName = documentSnapshot.data()!["displayName"];
    myUser.friendUid = documentSnapshot.data()!["friendUid"];
    myUser.chatRoomId = documentSnapshot.data()!["chatRoomId"];
    myUser.gender = documentSnapshot.data()!["gender"];
    myUser.phone = documentSnapshot.data()!["phone"];

    return myUser;
  }
}
