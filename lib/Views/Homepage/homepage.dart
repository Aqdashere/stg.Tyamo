import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/drawer/gf_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyamo/Views/Homepage/dashboard.dart';
import 'package:tyamo/Views/Profile/profile.dart';
import 'package:tyamo/Views/Widgets/Auth/Homepage/drawer_list_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GlobalKey<ScaffoldState> _homepageKey = GlobalKey();

  final _iconList = const <IconData>[
    FontAwesomeIcons.circleUser,
    FontAwesomeIcons.house,
    FontAwesomeIcons.bell,
  ];

  int _pageIndex = 1;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homepageKey,
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
        leading: GestureDetector(
          onTap: () {
            _homepageKey.currentState!.openDrawer();
          },
          child: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        actions: [
          Container(
              width: 58,
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: Image.asset('assets/dashboard/message.png')),
        ],
      ),
      drawer: GFDrawer(
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 35),
                        child: CircularProfileAvatar(
                          "assets/images/logo.jpg",
                          backgroundColor: Colors.cyan,
                          borderWidth: 1,
                          borderColor: Colors.deepPurpleAccent,
                          elevation: 6,
                          radius: 40,
                          cacheImage: true,
                          errorWidget: (context, url, error) {
                            return const Icon(
                              Icons.face,
                              size: 50,
                            );
                          },
                          onTap: () {
                            setState(() => _pageIndex = 0);
                            _pageController.animateToPage(0,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear);
                            Navigator.of(context).pop();
                          },
                          animateFromOldImageOnUrlChange: true,
                          placeHolder: (context, url) {
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                        ),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rana M Aqdas',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  letterSpacing: 1),
                            ),
                            Text(
                              "aqdaszoq@gmail.com",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                  color: Colors.cyan,
                                  fontSize: 12,
                                  letterSpacing: 0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.deepPurple),
                      child: Text(
                        "Premium",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 0,
              child: Divider(),
            ),
            const Column(
              children: [
                DrawerListTile(
                  listTileIcon: FontAwesomeIcons.solidCreditCard,
                  listTileText: "Subscription",
                ),
                DrawerListTile(
                  listTileIcon: Icons.settings,
                  listTileText: "Settings",
                ),
                DrawerListTile(
                  listTileIcon: FontAwesomeIcons.circleQuestion,
                  listTileText: "Help",
                ),
                DrawerListTile(
                  listTileIcon: FontAwesomeIcons.message,
                  listTileText: "Feedback",
                ),
                DrawerListTile(
                  listTileIcon: FontAwesomeIcons.share,
                  listTileText: "Tell Other",
                ),
                DrawerListTile(
                  listTileIcon: FontAwesomeIcons.starHalfStroke,
                  listTileText: "Rate the App",
                ),
              ],
            ),
            const Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(),
                DrawerListTile(
                    listTileIcon: FontAwesomeIcons.rightFromBracket,
                    listTileText: "Sign Out"),
              ],
            ))
          ],
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: _iconList,
        activeIndex: _pageIndex,
        activeColor: Colors.purple,
        inactiveColor: Colors.grey,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        gapLocation: GapLocation.none,
        onTap: (index) {
          setState(() => _pageIndex = index);
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        },
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _pageIndex = index);
        },
        children: [
          const Profile(),
          const Dashboard(),
          Container(
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
