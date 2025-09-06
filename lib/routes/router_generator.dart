import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/features/auth/onboarding/onboarding_screen.dart';
import 'package:meals_app/features/auth/splash_screen.dart';
import 'package:meals_app/features/home/data/model/meal_model.dart';
import 'package:meals_app/features/home/screens/add_meal_screen.dart';
import 'package:meals_app/features/home/screens/home_screen/home_screen.dart';
import 'package:meals_app/features/home/screens/meals_details_screen.dart';
import 'package:meals_app/routes/app_routes.dart';

class RouterGenerator {
  
  static GoRouter goRouter = GoRouter(initialLocation: AppRoutes.splashScreen, routes: [
    GoRoute(path: AppRoutes.onBoardingScreen, name: AppRoutes.onBoardingScreen, builder: (context, state) => const OnBoardingScreen()),
    GoRoute(path: AppRoutes.splashScreen, name: AppRoutes.splashScreen, builder: (context, state) => const SplashScreen()),
    GoRoute(path: AppRoutes.homeScreen, name: AppRoutes.homeScreen, builder: (context, state) => const HomeScreen()),
    GoRoute(path: AppRoutes.addMealScreen, name: AppRoutes.addMealScreen, builder: (context, state) => const AddMealScreen()),
    GoRoute(path: AppRoutes.mealsDetailsScreen, name: AppRoutes.mealsDetailsScreen, builder: (context, state) {
      final mealModel = state.extra as MealModel;
      return MealsDetailsScreen(mealModel: mealModel);
    })
  ]);
  
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
