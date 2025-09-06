import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/utils/app_color.dart';
import 'package:meals_app/features/home/data/dp_helper/db_helper.dart';
import 'package:meals_app/features/home/screens/home_screen/widgets/custom_floating_action_button.dart';
import 'package:meals_app/features/home/screens/home_screen/widgets/custom_food_widget.dart';
import 'package:meals_app/features/home/screens/home_screen/widgets/custom_top_home_widget.dart';
import 'package:meals_app/routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseHelper dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTopHomeWidget(),
            SizedBox(height: 15.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.sp),
                child: CustomFoodWidget(dbHelper: dbHelper),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const CustomFloatingActionButton()
    );
  }
}
