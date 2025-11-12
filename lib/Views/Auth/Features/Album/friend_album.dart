import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:tyamo/Views/Auth/Features/Album/my_album.dart';

import '../../../Homepage/dashboard.dart';

class FriendAlbum extends StatelessWidget {
  const FriendAlbum({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GalleryHeader(
            context: context,
            tuVal: "0",
            toVal: "6",
            name: "Eshal Khan",
            description: "Tell your partner what this album means to you",
            isEditable:
                false, //if its false the purple edit button will dissappear
          ),
          Container(
            child: StaggeredGridView.countBuilder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              crossAxisCount: 4,
              itemCount: 2,
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));
                    }),
                    FocusedMenuItem(title: Text("Share"),trailingIcon: Icon(Icons.share) ,onPressed: (){}),
                    FocusedMenuItem(title: Text("Favorite"),trailingIcon: Icon(Icons.favorite_border) ,onPressed: (){}),
                    FocusedMenuItem(title: Text("Delete",style: TextStyle(color: Colors.redAccent),),trailingIcon: Icon(Icons.delete,color: Colors.redAccent,) ,onPressed: (){}),
                  ],
                  onPressed: (){},
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Expanded(child: Image.asset("assets/images/invite.png",fit: BoxFit.cover,)),
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
