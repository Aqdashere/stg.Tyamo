import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AcceptInvite extends StatelessWidget {
  const AcceptInvite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: SizedBox(
            height: 35,
            child: Image.asset(
              'assets/images/tiamo.png',
              filterQuality: FilterQuality.high,
            ),
          ),
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back)),
        ),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 30.sp,
            width: double.infinity,
            color: Color(0xff8C47FB),
            child: Text(
              'See Received Invites',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 17.sp,
              ),
              textScaler: TextScaler.linear(1),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: SizedBox(
                height: 100,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 5, 15),
                          child: SizedBox(
                            height: 60,
                            width: 60,
                            child: CircularProfileAvatar(
                              "",
                              backgroundColor: Colors.blue,
                              radius: 35,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Text(
                                '@Rana.Aqdas',
                                style: GoogleFonts.poppins(fontSize: 17),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 2),
                              child: Text(
                                'Rana M Aqdas',
                                style: GoogleFonts.poppins(
                                    fontSize: 17, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              GFButton(
                                onPressed: () {},
                                color: Color(0xff00D7CC),
                                shape: GFButtonShape.pills,
                                child: Text('Accept'),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              GFButton(
                                onPressed: () {},
                                color: Colors.red,
                                shape: GFButtonShape.pills,
                                child: Text('Decline'),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 300,
            width: 300,
            child: Image.asset('assets/images/acceptinvite.png'),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your received invitation are currently ',
                style: GoogleFonts.nunito(
                    color: Colors.cyan,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
              ),
              Text(
                'Empty',
                style: GoogleFonts.nunito(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
              ),
            ],
          )
        ],
      ),
    );
  }
}
