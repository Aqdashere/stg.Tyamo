import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tyamo/Views/Auth/Features/Album/album_main.dart';
import 'package:tyamo/Views/Auth/Features/Album/album_post.dart';
import 'package:tyamo/Views/Homepage/homepage.dart';

class MyAlbum extends StatelessWidget {
  const MyAlbum({super.key});
// To cover image in the whole box we can use fit boxfit.cover and use it withing expanded as done in friend album
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GalleryHeader(
            context: context,
            tuVal: "0",
            toVal: "6",
            name: "Rana Aqdas",
            description: "Tell your partner what this album means to you",
            isEditable: true, //if its false the purple edit button will dissappear
          ),
          Container(
            child: StaggeredGridView.countBuilder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                crossAxisCount: 4,
                itemCount: 6,
                itemBuilder: (context, index){
                return FocusedMenuHolder(
                    menuWidth: MediaQuery.of(context).size.width*0.50,
                    blurSize: 5.0,
                    menuItemExtent: 45,
                    menuBoxDecoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    duration: Duration(milliseconds: 100),
                    animateMenuItems: true,
                    blurBackgroundColor: Colors.black54,
                    openWithTap: true, // Open Focused-Menu on Tap rather than Long Press
                    menuOffset: 10.0, // Offset value to show menuItem from the selected item
                    bottomOffsetHeight: 80.0, // Offset height to consider, for showing the menu item ( for example bottom navigation bar), so that the popup menu will be shown on top of selected item.
                    menuItems: <FocusedMenuItem>[
                      // Add Each FocusedMenuItem  for Menu Options
                      FocusedMenuItem(title: Text("Open"),trailingIcon: Icon(Icons.open_in_new) ,onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
                      }),
                      FocusedMenuItem(title: Text("Share"),trailingIcon: Icon(Icons.share) ,onPressed: (){}),
                      FocusedMenuItem(title: Text("Favorite"),trailingIcon: Icon(Icons.favorite_border) ,onPressed: (){}),
                      FocusedMenuItem(title: Text("Delete",style: TextStyle(color: Colors.redAccent),),trailingIcon: Icon(Icons.delete,color: Colors.redAccent,) ,onPressed: (){}),
                    ],
                    onPressed: (){

                    },
                    child: Card(
                        child: Column(
                          children: <Widget>[
                            Image.asset("assets/images/acceptinvite.png"),
                          ],
                        ),),);
                },
                staggeredTileBuilder: (int index) => new StaggeredTile.count(2, index.isEven?2:3),
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 15.0,
            ),
          ),
        ],
      ),
    );
  }
}

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
                  onTap: () {
                    Navigator.push(context,PageTransition(type: PageTransitionType.fade,child: AlbumPost()));
                  },
                  child: Hero(tag: "https://imagekit.io/blog/content/images/2019/12/image-optimization.jpg", child: Image.network("https://imagekit.io/blog/content/images/2019/12/image-optimization.jpg",fit: BoxFit.cover,)),
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
