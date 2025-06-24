import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meals_app/routes/app_routes.dart';
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

      if (!mounted) return;

      if (seen == true) {
        Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.onBoardingScreen);
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
