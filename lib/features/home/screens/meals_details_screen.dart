import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/app_assets/app_assets.dart';
import 'package:meals_app/core/utils/app_color.dart';
import 'package:meals_app/core/utils/app_text_styles.dart';
import 'package:meals_app/features/home/data/model/meal_model.dart';

class MealsDetailsScreen extends StatelessWidget {
  const MealsDetailsScreen({super.key, required this.mealModel});

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: CachedNetworkImage(
                      width: MediaQuery.sizeOf(context).width,
                      height: 327.h,
                      imageUrl: mealModel.imageUrl,
                      placeholder:
                          (context, url) => const CircularProgressIndicator(),
                      errorWidget:
                          (context, url, error) =>
                              const Icon(Icons.error, color: Colors.red),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    left: 20.w,
                    top: 60.h,
                    height: 50.h,
                    width: 50.w,
                    child: IconButton(
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      icon: SvgPicture.asset(
                        AppAssets.backImage,
                        colorFilter: const ColorFilter.mode(
                          AppColor.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(mealModel.name, style: AppTextStyles.foodTitle),

                    SizedBox(height: 20.h),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.star,
                              color: AppColor.primaryColor,
                              size: 16.sp,
                            ),
                            SizedBox(width: 3.w),
                            Text(
                              mealModel.rate.toString(),
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.lock_clock,
                              color: AppColor.primaryColor,
                              size: 16.sp,
                            ),
                            SizedBox(width: 3.w),
                            Text(
                              mealModel.time,
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    const Divider(thickness: 2),
                    SizedBox(height: 10.h),
                    Text('Description', style: AppTextStyles.black16Medium),
                    SizedBox(height: 10.h),
                    Text(
                      mealModel.description,
                      style: AppTextStyles.grey14Regular,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
