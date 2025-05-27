import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../two_value_card.dart';

class BatteryInfo extends StatelessWidget {
  const BatteryInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Container(
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
            colors: [
              Color(0xFFFAD585),
              Color(0xFFF47A7D),
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Battery Status',
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
                child: Container(
              color: Colors.red,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.green,
                      child: Column(
                        children: [
                          Expanded(
                            child: TwoValueCard(
                              text: "Status",
                              value: "Discharge",
                            ),
                          ),
                          Expanded(
                              child: TwoValueCard(
                                  text: 'Charging Type', value: "-"))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    color: Colors.purple,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: TwoValueCard(
                                text: "Charging Percentage",
                                value: "N/A",
                                subWidget: SleekCircularSlider(
                                  min: 0,
                                  max: 100,
                                  appearance: CircularSliderAppearance(
                                    customColors: CustomSliderColors(
                                      progressBarColor: Color(0xFFF57D7C)
                                    ),
                                    infoProperties: InfoProperties(
                                      mainLabelStyle: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    size: 100,
                                    customWidths: CustomSliderWidths(
                                      progressBarWidth: 10,
                                    ),
                                  ),
                                  initialValue: 50,
                                ),
                              ),
                            ),
                            Expanded(
                                child: TwoValueCard(
                                    text: 'Temperature', value: ""
                                    "35.0")),
                          ],
                        ),
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.yellow,
                        child: Column(
                          children: [
                            Expanded(child: TwoValueCard(text: "Battery Health", value: "Good",),),
                            Expanded(child: TwoValueCard(text: "Battery \nTechnology", value: "Li-Poly"))
                          ],
                        ),
                  ),),
                ],
              ),
            )),
            Expanded(
                child: Container(
              color: Colors.cyan,
            ))
          ],
        ),
      ),
    );
  }
}
