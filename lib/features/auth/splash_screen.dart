import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meals_app/features/auth/onboarding_screen.dart';
import 'package:meals_app/features/home/screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final seen = prefs.getBool('seen');

      if (seen == true) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return const HomeScreen();
        }));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return const OnBoardingScreen();
        }));
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Lottie.asset('assets/animations/food_animation.json'),
    ));
  }
}
