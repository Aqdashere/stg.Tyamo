import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Dashboard/dashboard_gradient_feature.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              'DASHBOARD',
              textScaler: TextScaler.linear(1),
              style: GoogleFonts.nunito(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 22,
                  letterSpacing: 2),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 25),
            alignment: Alignment.centerLeft,
            child: Text(
              'Your Friend',
              style: GoogleFonts.nunito(
                  color: Color(0xff990099),
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  letterSpacing: 1),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: Card(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: 25, top: 25, bottom: 25, right: 15),
                          child: CircularProfileAvatar(
                            '',
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
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.fiber_manual_record,
                                      color: Colors.grey,
                                      size: 22,
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      'Rana M Aqdas',
                                      style: GoogleFonts.nunito(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.blue,
                                        size: 35,
                                      ),
                                      // SizedBox(width: 7),
                                      Expanded(
                                        child: Text(
                                          'Contrada Mortelle Messina, Sicilia, Italia',
                                          style: GoogleFonts.nunito(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(
                                  'Status',
                                  textScaler: TextScaler.linear(1),
                                  style: GoogleFonts.nunito(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Offline',
                                  textScaler: TextScaler.linear(1),
                                  style: GoogleFonts.nunito(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          width: 2,
                          child: Container(
                            color: Colors.deepPurple,
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(
                                  'User status',
                                  textScaler: TextScaler.linear(1),
                                  style: GoogleFonts.nunito(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'N/A',
                                  textScaler: TextScaler.linear(1),
                                  style: GoogleFonts.nunito(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          width: 2,
                          child: Container(
                            color: Colors.deepPurple,
                          ),
                        ),
                        Flexible(
                            child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: Text(
                                'Mood N/A',
                                textScaler: TextScaler.linear(1),
                                style: GoogleFonts.nunito(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              Flexible(
                  child: DashboardGradientFeature(
                btnText: "Device Info",
                iconImg: "assets/images/logo.jpg",
                clr: [Color(0xff4FC174), Color(0xff00D7A9)],
              )),
              Flexible(
                  child: DashboardGradientFeature(
                btnText: "Gallery",
                iconImg: "assets/images/logo.jpg",
                clr: [Color(0xffF7D800), Color(0xffF7A100)],
              )),
              Flexible(
                  child: DashboardGradientFeature(
                btnText: "Mood",
                iconImg: "assets/images/logo.jpg",
                clr: [Color(0xff9A01D6), Color(0xffC701D6)],
              )),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Our Features",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xff004C99),
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  letterSpacing: 1),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Flexible(
                  child: DashboardGradientFeature(
                    btnText: "Playlist",
                    clr: [Colors.white, Colors.white],
                    iconImg: "assets/images/logo.jpg",
                    weight: FontWeight.w900,
                  ),
                ),
                Flexible(
                  child: DashboardGradientFeature(
                      btnText: "Location",
                      clr: [Colors.white, Colors.white],
                      iconImg: "assets/images/logo.jpg",
                    weight: FontWeight.w900,),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Flexible(
                  child: DashboardGradientFeature(
                    btnText: "To-do List",
                    clr: [Colors.white, Colors.white],
                    iconImg: "assets/images/logo.jpg",
                    weight: FontWeight.w900,
                  ),
                ),
                Flexible(
                  child: DashboardGradientFeature(
                    btnText: "Diary",
                    clr: [Colors.white, Colors.white],
                    iconImg: "assets/images/logo.jpg",
                    weight: FontWeight.w900,),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Flexible(
                  child: DashboardGradientFeature(
                    btnText: "Surprise Notes",
                    clr: [Colors.white, Colors.white],
                    iconImg: "assets/images/logo.jpg",
                    weight: FontWeight.w900,
                  ),
                ),
                Flexible(
                  child: DashboardGradientFeature(
                    btnText: "Horoscopes",
                    clr: [Colors.white, Colors.white],
                    iconImg: "assets/images/logo.jpg",
                    weight: FontWeight.w900,),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
