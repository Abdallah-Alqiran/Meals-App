import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/features/auth/splash_screen.dart';
import 'package:meals_app/routes/app_routes.dart';
import 'package:meals_app/routes/router_generator.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

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
          initialRoute: AppRoutes.splashScreen,
          onGenerateRoute: RouterGenerator.generateRoute,
        );
      },
      child: const SplashScreen(),
    );
  }
}
