import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GalleryHeader extends StatelessWidget {

  final BuildContext context;
  final String tuVal;
  final String toVal;
  final String name;
  final String description;
  final bool isEditable;

  GalleryHeader({required this.context, required this.tuVal, required this.toVal, required this.name, required this.description, required this.isEditable});




  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFFAFAD2),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFF7DB00), Color(0xFFF7A100)],
                stops: [0.0, 0.5],
              ),
              borderRadius:
              BorderRadius.vertical(bottom: Radius.circular(50)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Gallery",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: Colors.white),
                ),
                CircularProfileAvatar(
                  "",
                  radius: 40,
                  backgroundColor: Colors.transparent,
                  borderWidth: 1,
                  borderColor: Colors.deepPurpleAccent,
                  elevation: 20.0,
                  errorWidget: (context, url, error) {
                    return const Icon(
                      Icons.face,
                      size: 20,
                    );
                  },
                  cacheImage: true,
                  onTap: () {},
                  animateFromOldImageOnUrlChange: true,
                  placeHolder: (context, url) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text('Total Uploads',
                        style: GoogleFonts.nunito(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        )),
                    Text(tuVal,
                        style: GoogleFonts.nunito(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        )),
                  ],
                ),
                isEditable ? GestureDetector(
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.scale,
                      dialogType: DialogType.noHeader,
                      body: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "Enter Album Description",
                              labelStyle: const TextStyle(
                                  color: Colors.black, fontFamily: "Nunito"),
                              fillColor: Colors.black,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.green,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Colors.deepPurple,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            minLines: 2,
                          ),
                        ),
                      ),
                      btnOkOnPress: () {}, //On press of button
                      btnCancelOnPress: () {},
                    ).show();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [
                          Color(0xff633494),
                          Color(0xff5656AC)
                        ])),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ) : Container(),
                Column(
                  children: [
                    Text('Times Opened',
                        style: GoogleFonts.nunito(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        )),
                    Text(
                      toVal,
                      style: GoogleFonts.nunito(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}