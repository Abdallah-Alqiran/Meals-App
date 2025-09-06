
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/utils/app_color.dart';
import 'package:meals_app/routes/app_routes.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: AppColor.title,
        shape: const CircleBorder(
          side: BorderSide(color: AppColor.primaryColor),
        ),
        onPressed: () {
          GoRouter.of(context).pushNamed(AppRoutes.addMealScreen);
        },
        child: const Icon(Icons.add, color: AppColor.primaryColor),
      );
  }
}