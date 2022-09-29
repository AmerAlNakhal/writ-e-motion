import 'package:flutter/material.dart';
import 'package:writemotions/screens/disgust_screen.dart';
import 'package:writemotions/screens/home_screen.dart';
import 'package:writemotions/screens/info_screen.dart';
import 'package:writemotions/screens/satisfied_screen.dart';
import 'package:writemotions/screens/splash_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'SplashScreen',
      routes: {
        'SplashScreen': (context) => SpalshScreen(),
        'InfoScreen': (context) => InfoScreen(),
        'HomeScreen': (context) => HomeScreen(),
        'DisgustScreen': (context) => DisgustScreen(),
        'SatisfiedScreen': (context) => SatisfiedScreen(),
      },
    );
  }
}
