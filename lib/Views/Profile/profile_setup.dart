import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:tyamo/Controller/UserController/user_controller.dart';
import 'package:tyamo/Model/my_user.dart';
import 'package:tyamo/Views/Invitation/invite_friend.dart';
import 'package:tyamo/Views/Widgets/Auth/auth_text_field.dart';
import 'package:image/image.dart' as Img;
import 'package:uuid/uuid.dart';

class ProfileSetup extends StatefulWidget {
  const ProfileSetup({super.key});

  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  final RoundedLoadingButtonController _profileSetupBtnController =
      RoundedLoadingButtonController();

  bool ismale = true;
  File? file;
  bool isUploading = false;
  ImagePicker img = ImagePicker();
  String postId = Uuid().v4();


  handleChooseFromGalley() async {
    var getImage = await img.pickImage(
        source: ImageSource.gallery, maxHeight: 1080, maxWidth: 1920);
    File io = File(getImage!.path);
    setState(() {
      file = io;
    });

    if (file != null) {
      uploadToStorage();
    }
  }

  updateAvatarInFirestore({String? mediaUrl, String? uid}) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).update({"avatarUrl": mediaUrl});
  }

  uploadToStorage() async {
    setState(() {
      isUploading = true;
    });

    await compressImage();

    String? mediaUrl = await uploadImage();
    if (mediaUrl != null) {
      await updateAvatarInFirestore(mediaUrl: mediaUrl, uid: myUser!.uid);
    }
  }

  Future<String?> uploadImage() async {
    UploadTask uploadTask = FirebaseStorage.instance
        .ref()
        .child("profilePictures/$postId.jpg")
        .putFile(file!);

    String? downloadUrl;

    return uploadTask.then((p0)=> p0.ref.getDownloadURL());
  }

  compressImage() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Img.Image? imageFile = Img.decodeImage(file!.readAsBytesSync());
    final compressedImageFile = File("$path/image_$postId.jpg")
      ..writeAsBytesSync(Img.encodeJpg(imageFile!, quality: 85));
    setState(() {
      file = compressedImageFile;
    });
  }

  MyUser? myUser;
  UserController? _currentUser;

  @override
  Widget build(BuildContext context) {
    _currentUser = Provider.of<UserController>(context, listen: false);

    setState(() {
      myUser = _currentUser!.getCurrentUser;
    });

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: SizedBox(
          height: 100,
          width: 100,
          child: Image.asset(
            'assets/images/tiamo.png',
            filterQuality: FilterQuality.high,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assetName',
                ), //For background which is not available currently
                filterQuality: FilterQuality.high),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: CircularProfileAvatar(
                  '',
                  onTap: () {},
                  backgroundColor: Colors.cyan,
                  initialsText: Text(
                    '+',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: AuthTextField(
                    controller: TextEditingController(),
                    keyboardType: TextInputType.text,
                    labelSize: 15,
                    labelText: 'Your Name',
                    obscureText: false,
                    icon: Icons.face,
                    iconSize: 16,
                    fontSize: 15),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: AuthTextField(
                    controller: TextEditingController(), //Fix later
                    keyboardType: TextInputType.text,
                    labelSize: 15,
                    labelText: 'Your Username',
                    obscureText: false,
                    icon: Icons.alternate_email,
                    iconSize: 16,
                    fontSize: 15),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        ismale = true;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: ismale ? Colors.cyan : Colors.grey,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(1.0, 9.0),
                                blurRadius: 30),
                          ]),
                      child: Icon(
                        Icons.male,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        ismale = false;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: !ismale ? Colors.purple : Colors.grey,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(1.0, 9.0),
                                blurRadius: 30),
                          ]),
                      child: Icon(
                        Icons.female,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Hero(
                tag: "Auth",
                child: RoundedLoadingButton(
                  width: 500,
                  borderRadius: 10,
                  color: Color(0xff00C1AA),
                  controller: _profileSetupBtnController,
                  onPressed: () {
                    Timer(Duration(seconds: 3), () {
                      _profileSetupBtnController.success();
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: InviteFriend()));
                    });
                  },
                  child: Text('Login',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
