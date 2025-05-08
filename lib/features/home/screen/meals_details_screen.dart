import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meals_app/core/utils/app_color.dart';
import 'package:meals_app/features/home/data/model/meal_model.dart';

class MealsDetailsScreen extends StatelessWidget {
  const MealsDetailsScreen({super.key, required this.mealModel});

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {



    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 10.sp),
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height / 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: CachedNetworkImage(
                        imageUrl: mealModel.imageUrl,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error, color: Colors.red),
                        fit: BoxFit.fitWidth,
                      ),
                    )),
                Positioned(
                  left: 20.w,
                  height: 150.h,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset('assets/svg/back.svg',
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              mealModel.name,
              style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.h),
            Container(
              decoration: BoxDecoration(
                color: AppColor.primaryColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12.r)
              ),
              child: Padding(
                padding: EdgeInsets.all(8.sp),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.star,
                        color: AppColor.primaryColor,
                        size: 16.sp),
                    SizedBox(width: 3.w),
                    Text(
                      mealModel.rate.toString(),
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    const Spacer(),
                    Icon(Icons.lock_clock,
                        color: AppColor.primaryColor,
                        size: 16.sp),
                    SizedBox(width: 3.w),
                    Text(
                      mealModel.time,
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text('Description', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black),),
            SizedBox(height: 10.h),
            Text(mealModel.description, style: TextStyle(color: AppColor.descriptionColor, fontSize: 14.sp),)
          ],
                ),
              ),
        ));
  }
}
