import 'package:flutter/material.dart';
import 'package:meals_app/features/auth/onboarding_screen.dart';
import 'package:meals_app/features/auth/splash_screen.dart';
import 'package:meals_app/features/home/data/model/meal_model.dart';
import 'package:meals_app/features/home/screen/add_meal_screen.dart';
import 'package:meals_app/features/home/screen/home_screen.dart';
import 'package:meals_app/features/home/screen/meals_details_screen.dart';
import 'package:meals_app/routes/app_routes.dart';

class RouterGenerator {
  static Route generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(builder: (context) {
          return const SplashScreen();
        });
      case AppRoutes.onBoardingScreen:
        return MaterialPageRoute(builder: (context) {
          return const OnBoardingScreen();
        });
      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (context) {
          return const HomeScreen();
        });
      case AppRoutes.addMealScreen:
        return MaterialPageRoute(builder: (context) {
          return const AddMealScreen();
        });
      case AppRoutes.mealsDetailsScreen:
        return MaterialPageRoute(builder: (context) {
          return MealsDetailsScreen(mealModel: args as MealModel);
        });
      default:
        return MaterialPageRoute(builder: (contexxt) {
          return const Scaffold(
            body: Text("No Route Page Found"),
          );
        });
    }
  }
}
