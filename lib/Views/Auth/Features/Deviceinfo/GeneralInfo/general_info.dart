import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyamo/Views/Auth/Features/Deviceinfo/BatteryInfo/two_value_card.dart';
import 'package:tyamo/Views/Auth/Features/Deviceinfo/GeneralInfo/two_widget_card.dart';

class GeneralInfo extends StatelessWidget {
  const GeneralInfo({super.key});

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
        decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xFF50C9C2), Color(0xFF95DEDA)]),
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
                  'General Info:',
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Expanded(
                              child: TwoValueCard(
                                text: 'Screen State',
                                value: 'UNLOCKED',
                                txtclr: Color(0xff55CAC4),
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: TwoWidgetCard(
                                  text1: 'System Volume',
                                  value1: '0/7',
                                  txtclr1: Color(0xff55CAC4),
                                  text2: "Media Volume",
                                  value2: "4/7",
                                  txtclr2: Color(0xff55CAC4),
                                )),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Expanded(
                                flex: 2,
                                child: TwoWidgetCard(
                                  text1: 'Light Activity',
                                  value1: 'Dim Light',
                                  txtclr1: Color(0xff55CAC4),
                                  text2: "Light Intenstiy",
                                  value2: "4",
                                  txtclr2: Color(0xff55CAC4),
                                )),
                            Expanded(
                              child: TwoValueCard(
                                text: 'Brightness',
                                value: '5.88%',
                                txtclr: Color(0xff55CAC4),
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
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'My General Info:',
                          style: GoogleFonts.nunito(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Color(0xff989898),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: TwoValueCard(
                                        text: 'Screen State',
                                        value: 'UNLOCKED',
                                        txtclr: Colors.white,
                                        clr: Color(0xFF50C9C2),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: TwoWidgetCard(
                                          text1: 'System Volume',
                                          txtclr1: Colors.white,
                                          clr1: Color(0xFF50C9C2),
                                          value1: '0/7',
                                          clr2: Color(0xFF50C9C2),
                                          txtclr2: Colors.white,
                                          text2: "Media Volume",
                                          value2: "4/7",
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: TwoWidgetCard(
                                          text1: 'Light Activity',
                                          txtclr1: Colors.white,
                                          clr1: Color(0xFF50C9C2),
                                          value1: 'No Light',
                                          clr2: Color(0xFF50C9C2),
                                          txtclr2: Colors.white,
                                          text2: "Light Intensity",
                                          value2: "0",
                                        )),
                                    Expanded(
                                      child: TwoValueCard(
                                        text: 'Brightness',
                                        value: '27.84%',
                                        txtclr: Colors.white,
                                        clr: Color(0xFF50C9C2),
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
                    Text(
                      "Last Updated: 1 min ago",
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16),
                    )
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
