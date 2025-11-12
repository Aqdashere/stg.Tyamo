import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyamo/Views/Auth/Features/Deviceinfo/two_value_card.dart';

import '../UserInfo/one_value_card.dart';

class UserStatus extends StatefulWidget {
  const UserStatus({super.key});

  @override
  State<UserStatus> createState() => _UserStatusState();
}

class _UserStatusState extends State<UserStatus> {
  String selectedStatus = "AWAY";

  List<String> status1 = [
    "AWAY",
    "DO NOT DISTURB",
    "DRIVING",
    "EATING",
  ];

  List<String> status2 = [
    "MEETING",
    "OUTDOORS",
    "SLEEPING",
    "WORKING",
  ];

  @override
  Widget build(BuildContext context) {
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
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xFF86AAE8), Color(0xFF92E9E3)]),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Friends Status',
                          style: GoogleFonts.nunito(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: TwoValueCard(
                                        text: "User Is",
                                        value: "Online",
                                        textclr: Color(0xff23A8E1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: TwoValueCard(
                                        text: "Last App Action",
                                        value: "2 mins ago",
                                        textclr: Color(0xff23A8E1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: TwoValueCard(
                                text: "User Status",
                                value: "Driving",
                                textclr: Color(0xff23A8E1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'My Status:',
                              style: GoogleFonts.nunito(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: Color(0xff989898),
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              "Eating",
                              style: GoogleFonts.nunito(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: Color(0xff23A8E1),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: status1.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedStatus = status1[index];
                                    });
                                  },
                                  child: OneValueCard(
                                    value: status1[index],
                                    clr: selectedStatus == status1[index]
                                        ? Colors.blue.shade400
                                        : Colors.lightBlueAccent.shade100,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedStatus = status2[index];
                                    });
                                  },
                                  child: OneValueCard(
                                    value: status2[index],
                                    clr: selectedStatus == status2[index]
                                        ? Colors.blue.shade400
                                        : Colors.lightBlueAccent.shade100,
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
