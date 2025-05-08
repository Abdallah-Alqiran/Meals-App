import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/features/auth/splash_screen.dart';
import 'package:meals_app/features/home/data/dp_helper/db_helper.dart';
import 'package:meals_app/features/home/data/model/meal_model.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // DatabaseHelper dbHelper = DatabaseHelper.instance;
  //
  // try {
  //   MealModel mealModel = MealModel(
  //     imageUrl: 'https://img.taste.com.au/KCIGRWcj/taste/2022/07/koshari-egyptian-rice-lentils-and-pasta-180337-2.jpg',
  //     name: 'Pizza',
  //     rate: 4.5,
  //     description: 'this is a perfect meal',
  //     time: "2h",
  //   );
  //   await dbHelper.insert(mealModel);
  //   await dbHelper.insert(mealModel);
  //   await dbHelper.insert(mealModel);
  // } catch (e) {
  //   debugPrint("Database initialization failed: $e");
  // }
  //
  // List<MealModel> meals = await dbHelper.getMeals();
  // print("====$meals");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: const SplashScreen(),
    );
  }
}
