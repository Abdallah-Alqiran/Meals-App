import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/utils/app_color.dart';
import 'package:meals_app/core/utils/app_text_styles.dart';
import 'package:meals_app/features/home/data/model/meal_model.dart';
import 'package:meals_app/routes/app_routes.dart';

class CustomFoodItemWidget extends StatelessWidget {
  final MealModel mealModel;
  const CustomFoodItemWidget({super.key, required this.mealModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.r),
      onTap: () {
        GoRouter.of(
          context,
        ).pushNamed(AppRoutes.mealsDetailsScreen, extra: mealModel);
      },
      child: SizedBox(
        width: 153.w,
        child: Container(
          padding: EdgeInsets.all(8.sp),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: AppColor.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CachedNetworkImage(
                  imageUrl: mealModel.imageUrl,
                  placeholder:
                      (context, url) => const CircularProgressIndicator(),
                  errorWidget:
                      (context, url, error) =>
                          const Icon(Icons.error, color: Colors.red),
                  width: 137.w,
                  height: 106.h,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(
                width: 137.w,
                child: Text(
                  mealModel.name,
                  style: AppTextStyles.black16Medium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              // SizedBox(height: 8.sp),
              SizedBox(
                width: 137.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.star, color: AppColor.primaryColor, size: 16.sp),
                    SizedBox(width: 3.w),
                    Text(
                      mealModel.rate.toString(),
                      style: AppTextStyles.grey14Regular,
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
