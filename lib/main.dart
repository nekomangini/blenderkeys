import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:blender_keys/screens/about.dart';
import 'package:blender_keys/screens/home_screen.dart';
import 'package:blender_keys/strings/content_strings.dart';
import 'package:blender_keys/themes/color.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const SplashPage());

// ################################################################ //
// Splash Screen Class                                              //
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

// ################################################################ //
// Splash Screen Logo                                              //
class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EasySplashScreen(
        logo: Image.asset('images/blender_icon.png'),
        title: const Text(
          splashScreenText,
          style: TextStyle(
            color: kAppbarTitleColor,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        // rotating circle //
        showLoader: true,
        durationInSeconds: 2,
        // after showing splash screen go to this page //
        navigator: const MainPage(),
      ),
    );
  }
}

// ################################################################ //
// Main Screen Class                                                //
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // int pageIndex = 0;

  // ################################################################ //
  // pages routes //
  final pages = [
    const HomeScreen(),
    const Donate(),
  ];

  // ################################################################ //
  // icons of pages //
  List<IconData> iconList = [
    // list of icons that required by animated navigation bar.
    Icons.home,
    FontAwesomeIcons.addressBook
  ];

  int _bottomNavIndex = 0;

  // ################################################################ //
  // open url in browser //
  Future<void> _launchUrl(String url) async {
    // the host parameter is used to specify the hostname of the URL (e.g. "www.youtube.com"), not the entire URL.
    // You should use the path parameter instead to specify the full URL.
    final Uri uri = Uri(scheme: "https", host: url);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Cannot launch url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Blender Shortcut Keys',
          style: TextStyle(
            color: kAppbarTitleColor, // Theme.of(context).primaryColor
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: kAppbarBackgroundColor, // Color(0xFFff6900)
      ),
      body: pages[_bottomNavIndex], //destination screen
      extendBody: true,

      // ################################################################ //
      // icon in the middle //
      floatingActionButton: FloatingActionButton(
        backgroundColor: kBodyBackgroundColor,
        onPressed: () {
          _launchUrl('www.blender.org');
        },
        child: Image.asset('images/blender_icon.png'),
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // ################################################################ //
      // bottom navigation bar properties //
      bottomNavigationBar: AnimatedBottomNavigationBar(
        elevation: 0,
        inactiveColor: kInactiveIconColor,
        backgroundColor: kBodyBackgroundColor,
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 21,
        rightCornerRadius: 21,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        //other params
      ),
    );
  }
}
