import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser {
  String? uid;
  String? email;
  String? password;
  String? username;
  String? displayName;
  String? phone;
  String? avatarUrl;
  String? friendUid;
  String? chatRoomId;
  String? gender;
  String? referralCode;
  bool? isLoadingStartupData;
  Timestamp? accountCreated;

  MyUser( //constructor
      {this.uid,
      this.email,
      this.password,
      this.username,
      this.displayName,
      this.phone,
      this.avatarUrl,
      this.friendUid,
      this.chatRoomId,
      this.gender,
      this.referralCode,
      this.accountCreated});
}
