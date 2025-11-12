import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool more = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            'MY PROFILE',
            textScaler: TextScaler.linear(1),
            style: GoogleFonts.nunito(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 22,
                letterSpacing: 2),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/dashboard/doodle.png'),
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill),
            ),
            child: CircularProfileAvatar(
              'imageUrl',
              backgroundColor: Colors.cyan,
              borderWidth: 1,
              borderColor: Colors.deepPurpleAccent,
              elevation: 20,
              radius: 60,
              cacheImage: true,
              errorWidget: (context, url, error) {
                return Icon(
                  Icons.face,
                  size: 50,
                );
              },
              onTap: () {},
              animateFromOldImageOnUrlChange: true,
              placeHolder: (context, url) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Rana M Aqdas',
            style:
                GoogleFonts.nunito(fontWeight: FontWeight.w900, fontSize: 18),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            '@aqdas786',
            style:
                GoogleFonts.nunito(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              side: WidgetStateProperty.all<BorderSide>(
                  BorderSide(color: Color(0xff671AFC))),
              backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  //for rounded rectangular border shape
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              )),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Edit Profile Details",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600, color: Color(0xff671AFC)),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                CardDetailRow(
                    icon: Icon(Icons.alternate_email),
                    type: "Email",
                    val: "aqdaszoq@gmail.com",
                    clr: Colors.grey.shade200),
                CardDetailRow(
                    icon: Icon(Icons.outlined_flag),
                    type: "Country",
                    val: "Italy",
                    clr: Colors.transparent),
                CardDetailRow(
                    icon: Icon(Icons.phone_outlined),
                    type: "Phone Number",
                    val: "Not Currently Set",
                    clr: Colors.grey.shade200),
                more
                    ? CardDetailRow(
                        icon: Icon(
                          FontAwesomeIcons.venusMars,
                          size: 20,
                        ),
                        type: "Gender",
                        val: "Male",
                        clr: Colors.transparent)
                    : Container(),
                more
                    ? CardDetailRow(
                        icon: Icon(Icons.person_outline),
                        type: "Partner",
                        val: "Robbie Williams",
                        clr: Colors.grey.shade200)
                    : Container(),
                more
                    ? CardDetailRow(
                        icon: Icon(Icons.fingerprint),
                        type: "UID",
                        val: "UI223398769232121",
                        clr: Colors.transparent)
                    : Container(),
                more
                    ? CardDetailRow(
                        icon: Icon(Icons.schedule),
                        type: "Account Created",
                        val: "20-03-2025",
                        clr: Colors.grey.shade200)
                    : Container(),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      more = !more;
                    });
                  },
                  style: ButtonStyle(
                    side: WidgetStateProperty.all<BorderSide>(
                        BorderSide(color: Colors.grey)),
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.grey.shade200),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        //for rounded rectangular border shape
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      more ? "- Show Less" : "+ Show More",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xffff9966), Color(0xffff5e62)]),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Subscribed to',
                      style:
                          GoogleFonts.nunito(fontSize: 15, color: Colors.white),
                    ),
                    Text(
                      'Free Package',
                      style: GoogleFonts.nunito(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                    )
                  ],
                ),
              ),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Subscribed on',
                      style:
                          GoogleFonts.nunito(fontSize: 15, color: Colors.white),
                    ),
                    Text(
                      '20/03/2025',
                      style: GoogleFonts.nunito(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CardDetailRow extends StatelessWidget {
  final String type;
  final Icon icon;
  final String val;
  final Color clr;

  const CardDetailRow({
    super.key,
    required this.icon,
    required this.type,
    required this.val,
    required this.clr,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: clr,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        height: 50,
        width: double.infinity,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            icon,
            SizedBox(
              width: 10,
            ),
            Text(
              type,
              textScaler: TextScaler.linear(1),
              textAlign: TextAlign.left,
              style: GoogleFonts.nunito(),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    val,
                    textAlign: TextAlign.right,
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: val == "Not Currently Set"
                          ? Colors.red
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
