import 'package:blenderkeys_v2/screens/mainpage.dart';
import 'package:blenderkeys_v2/strings/content_strings.dart';
import 'package:blenderkeys_v2/themes/color.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

// ################################################################ //
// Splash Screen Class                                              //
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

// ################################################################ //
// Splash Screen Logo                                              //
class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
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
    );
  }
}
