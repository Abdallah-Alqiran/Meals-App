import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:meals_app/features/onboarding_services/onboarding_services.dart';
import 'package:meals_app/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {

      bool isFirstTime = OnBoardingServices.isFirstTime();

      if (!mounted) return;

      if (isFirstTime == false) {
        GoRouter.of(context).pushNamed(AppRoutes.homeScreen);
      } else {
        GoRouter.of(context).pushNamed(AppRoutes.onBoardingScreen);
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
