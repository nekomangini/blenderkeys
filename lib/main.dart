import 'package:blenderkeys_v2/screens/splashscreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BlenderHome());

class BlenderHome extends StatelessWidget {
  const BlenderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
