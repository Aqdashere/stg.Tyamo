import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter_balloon_slider/flutter_balloon_slider.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_tile_more_customizable/list_tile_more_customizable.dart';

class AlbumPost extends StatelessWidget {
  const AlbumPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60)),
                child: Container(
                  height: 500,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/bg.jpg'),
                          fit: BoxFit.cover)),
                  child: BackdropFilter(
                    filter: ui.ImageFilter.blur(sigmaX: 7, sigmaY: 14),
                    child: Container(
                      color: Colors.black.withOpacity(0.7),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.asset('assets/images/tiamo.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'assets/images/bg.jpg',
                                  height: 250,
                                )),
                          ),
                          SizedBox(
                            width: 250,
                            height: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                BalloonSlider(
                                  value: 0,
                                  onChanged: (value) {},
                                  onChangeEnd: (value) {},
                                  onChangeStart: (value) {},
                                  showRope: false,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Caption',
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w900, color: Colors.cyan),
                        ),
                        GestureDetector(
                          child: const Icon(
                            Icons.edit,
                            color: Colors.cyan,
                          ),
                          onTap: () {
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.scale,
                              dialogType: DialogType.noHeader,
                              body: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 20),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: "Edit Caption",
                                      labelStyle: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Nunito"),
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
                                    maxLines: 1,
                                    minLines: null,
                                  ),
                                ),
                              ),
                              btnOkOnPress: () {}, //On press of button
                              btnCancelOnPress: () {},
                            ).show();
                          },
                        ),
                      ],
                    ),
                    FocusedMenuHolder(
                      menuWidth: MediaQuery.of(context).size.width * 0.5,
                      duration: const Duration(milliseconds: 100),
                      blurSize: 2.0,
                      menuItemExtent: 45,
                      menuBoxDecoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      animateMenuItems: true,
                      blurBackgroundColor: Colors.black54,
                      menuOffset: 10.0,
                      bottomOffsetHeight: 80.0,
                      menuItems: [
                        FocusedMenuItem(
                          title: Text("Copy",
                              style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              )),
                          trailingIcon: const Icon(FontAwesomeIcons.copy),
                          onPressed: () {},
                        ),
                        FocusedMenuItem(
                          title: Text("Edit",
                              style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              )),
                          trailingIcon: const Icon(FontAwesomeIcons.edit),
                          onPressed: () {
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.scale,
                              dialogType: DialogType.noHeader,
                              body: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 20),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: "Edit Caption",
                                      labelStyle: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Nunito"),
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
                                    maxLines: 1,
                                    minLines: null,
                                  ),
                                ),
                              ),
                              btnOkOnPress: () {}, //On press of button
                              btnCancelOnPress: () {},
                            ).show();
                          },
                        ),
                      ],
                      onPressed: () {},
                      child: ExpandableText(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        expandText: "Show more",
                        collapseText: "Show less",
                        maxLines: 2,
                        linkColor: Colors.orange,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Comments",
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            letterSpacing: 1,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return FocusedMenuHolder(
                              menuWidth: MediaQuery.of(context).size.width * 0.5,
                              duration: const Duration(milliseconds: 100),
                              blurSize: 2.0,
                              menuItemExtent: 45,
                              menuBoxDecoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              animateMenuItems: true,
                              blurBackgroundColor: Colors.black54,
                              menuOffset: 10.0,
                              bottomOffsetHeight: 80.0,
                              menuItems: [
                                FocusedMenuItem(
                                  title: Text("Copy",
                                      style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black,
                                      )),
                                  trailingIcon:
                                      const Icon(FontAwesomeIcons.copy),
                                  onPressed: () {},
                                ),
                                FocusedMenuItem(
                                  title: Text("Edit",
                                      style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black,
                                      )),
                                  trailingIcon:
                                      const Icon(FontAwesomeIcons.edit),
                                  onPressed: () {
                                    AwesomeDialog(
                                      context: context,
                                      animType: AnimType.scale,
                                      dialogType: DialogType.noHeader,
                                      body: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0,
                                              vertical: 20),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              labelText: "Edit Caption",
                                              labelStyle: const TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: "Nunito"),
                                              fillColor: Colors.black,
                                              enabledBorder:
                                                  OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide:
                                                    const BorderSide(
                                                  color: Colors.green,
                                                ),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              focusedBorder:
                                                  OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide:
                                                    const BorderSide(
                                                  color: Colors.deepPurple,
                                                ),
                                              ),
                                            ),
                                            keyboardType:
                                                TextInputType.multiline,
                                            maxLines: 1,
                                            minLines: null,
                                          ),
                                        ),
                                      ),
                                      btnOkOnPress: () {},
                                      btnCancelOnPress: () {},
                                    ).show();
                                  },
                                ),
                              ],
                              onPressed: () {},
                              child: ListTileMoreCustomizable(
                                title: Text(
                                  "@RanaAqdas",
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Colors.cyan,
                                  ),
                                ),
                                leading: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.orange,
                                  ),
                                ),
                                horizontalTitleGap: 0.0,
                                minVerticalPadding: 10.0,
                                minLeadingWidth: 60,
                                contentPadding: const EdgeInsets.all(5),
                                subtitle: const Text(
                                  'This is a comment',
                                  textAlign: TextAlign.left,
                                ),
                                trailing: const Text("1 min ago"),
                              ),
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextField(
                keyboardType: TextInputType.multiline,
                textCapitalization: TextCapitalization.sentences,
                maxLines: 3,
                minLines: 1,
                style: const TextStyle(
                  color: Colors.white,
                ),
                onChanged: (val) {},
                decoration: InputDecoration(
                    hintText: "Start a Conversation",
                    hintStyle:
                        const TextStyle(color: Colors.white, fontFamily: "Nunito"),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.all(20),
                    filled: true,
                    fillColor: Colors.orange),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios, color: Colors.black),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
