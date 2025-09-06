import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/app_assets/app_assets.dart';
import 'package:meals_app/core/utils/app_color.dart';

class CustomTopHomeWidget extends StatelessWidget {
  const CustomTopHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250.h,
          width: MediaQuery.sizeOf(context).width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 18.h,
          left: 25.w,
          child: Container(
            height: 180.h,
            width: 180.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
              color: AppColor.primaryColor.withValues(alpha: 0.1),
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.all(21.sp),
              child: Text(
                'Welcome Add a New Recipe',
                style: TextStyle(
                  color: AppColor.title,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
