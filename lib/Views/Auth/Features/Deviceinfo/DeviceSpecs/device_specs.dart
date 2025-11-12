import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyamo/Views/Auth/Features/Deviceinfo/BatteryInfo/two_value_card.dart';

class DeviceSpecs extends StatelessWidget {
  const DeviceSpecs({super.key});

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
        actions: [
          Container(
              width: 58,
              padding: EdgeInsets.symmetric(horizontal: 9),
              child: Image.asset('assets/dashboard/message.png')),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF02A9AF), Color(0xFF00CDAC)],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Battery status:",
                  style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                child: TwoValueCard(
                                    text: "Total Ram", value: '8gb'),
                              )),
                          Expanded(
                              flex: 2,
                              child: Container(
                                child: TwoValueCard(
                                    text: "Refresh Rate", value: '120 Hz'),
                              )),
                          Expanded(
                              flex: 3,
                              child: Container(
                                child: TwoValueCard(
                                    text: "Fingerprint Sensor",
                                    value: 'Present'),
                              )),
                          Expanded(
                              flex: 3,
                              child: Container(
                                child: TwoValueCard(
                                    text: "Camera", value: '50 MP'),
                              )),
                        ],
                      ),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding:
                        const EdgeInsets.only(right: 10.0, top: 10, bottom: 10),
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Container(
                                child: TwoValueCard(
                                    text: "Internal Memory",
                                    value: '212.65 / 256 GB'),
                              )),
                          Expanded(
                              flex: 3,
                              child: Container(
                                child: TwoValueCard(
                                    text: "External Memory", value: 'N/A'),
                              )),
                          Expanded(
                              flex: 2,
                              child: Container(
                                child: TwoValueCard(
                                    text: "Screen Size", value: '6.9 inches'),
                              )),
                          Expanded(
                              flex: 2,
                              child: Container(
                                child: TwoValueCard(
                                    text: "Resolution", value: '4160*2134'),
                              )),
                        ],
                      ),
                    ),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
