import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyamo/Views/Widgets/profile/pr_setting_heading.dart';
import 'package:tyamo/Views/Widgets/profile/pr_setting_sub.dart';

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                height: 330,
                decoration: BoxDecoration(
                    color: Color(0xff671AFC),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width,
                          130), // for purple color rounded shape in bottom
                    )),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 23,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Settings",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.nunito(
                              fontSize: 23,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Row(
                              children: [
                                CircularProfileAvatar(
                                  'imageUrl',
                                  backgroundColor: Colors.transparent,
                                  borderWidth: 1,
                                  borderColor: Colors.deepPurpleAccent,
                                  elevation: 5,
                                  radius: 30,
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
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Rana M Aqdas',
                                  textScaler: TextScaler.linear(1),
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.nunito(
                                      letterSpacing: 0.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 5,
                            color: Colors.grey.shade300,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          PrSettingHeading(headingText: "Profile Settings"),
                          SizedBox(
                            height: 15,
                          ),
                          PrSettingSub(
                            title: "Edit Name",
                          ),
                          PrSettingSub(
                            title: "Edit Phone Number",
                          ),
                          PrSettingSub(
                            title: "Change Password",
                          ),
                          PrSettingSub(
                            title: "Email Status",
                            secondaryWidget: Row(
                              children: [
                                Text(
                                  "Not Verified",
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  FontAwesomeIcons.arrowRight,
                                  size: 14,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          PrSettingHeading(
                            headingText: "Notification Settings",
                          ),
                          PrSettingSub(
                            title: "Push Notifications",
                            secondaryWidget: GFToggle(
                              onChanged: (val) {},
                              enabledTrackColor: Colors.greenAccent,
                              type: GFToggleType.android,
                              value: true,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          PrSettingHeading(
                            headingText: "Application Settings",
                          ),
                          PrSettingSub(
                            title: "Background Updates",
                            secondaryWidget: Row(
                              children: [
                                Text(
                                  "Not Allowed",
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  FontAwesomeIcons.arrowRight,
                                  size: 14,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 120,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
