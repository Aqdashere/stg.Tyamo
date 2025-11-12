import 'package:flutter/material.dart';
import 'package:tyamo/Views/Auth/Features/Deviceinfo/top_banner.dart';

import 'gradient_button_container.dart';

class DeviceInfo extends StatelessWidget {
  const DeviceInfo({super.key});

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
      body: Column(
        children: [
          TopBanner(
            clr: [Color(0xff4FC174), Color(0xff00D7A9)],
            title: "Device Info",
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 10,
                          child: GradientButtonContainer(
                            clr: [Color(0xFF86AAE8), Color(0xFF92E9E3)],
                            title: "User Status",
                            overlayColor: Colors.cyan,
                            isGradientVertical: true,
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: GradientButtonContainer(
                            clr: [
                              Color(0xFFFAD585),
                              Color(0xFFF47A7D),
                            ],
                            title: "Battery",
                            overlayColor: Colors.orangeAccent,
                            isGradientVertical: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Expanded(
                    child: GradientButtonContainer(
                        clr: [
                          Color(0xFFFAD585),
                          Color(0xFFF47A7D),
                        ],
                        title: "General",
                        overlayColor: Colors.orangeAccent,
                        isGradientVertical: true),
                  )),
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: GradientButtonContainer(
                    clr: [
                      Color(0xFF50C9C2),
                      Color(0xFF95DEDA),
                    ],
                    title: "Device Specs",
                    overlayColor: Color(0xff01BCAA),
                    isGradientVertical: true,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex: 6,
                      child: GradientButtonContainer(
                        clr: [
                          Color(0xFFB893D6),
                          Color(0xFF8CA5D8),
                        ],
                        title: "Location",
                        overlayColor: Color(0xffB109C6),
                        isGradientVertical: false,
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: GradientButtonContainer(
                        clr: [
                          Color(0xFFF2709B),
                          Color(0xFFFF9370),
                        ],
                        title: "Orientation",
                        overlayColor: Colors.orangeAccent,
                        isGradientVertical: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
