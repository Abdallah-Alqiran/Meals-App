import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/utils/app_color.dart';
import 'package:meals_app/core/utils/app_text_styles.dart';
import 'package:meals_app/features/home/data/dp_helper/db_helper.dart';
import 'package:meals_app/features/home/screens/home_screen/widgets/custom_food_item_widget.dart';
import 'package:meals_app/routes/app_routes.dart';

class CustomFoodWidget extends StatelessWidget {
  final DatabaseHelper dbHelper;
  const CustomFoodWidget({super.key, required this.dbHelper});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            "Your Food",
            textAlign: TextAlign.start,
            style: TextStyle(color: AppColor.decorationColor, fontSize: 16.sp),
          ),
        ),
        SizedBox(height: 10.h),
        Expanded(
          child: FutureBuilder(
            future: dbHelper.getMeals(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.primaryColor,
                    ),
                  ),
                );
              } else if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return const Center(child: Text('There is no Food Found!!'));
                }
                return GridView.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    mainAxisSpacing: 22.sp,
                    crossAxisSpacing: 22.sp,
                  ),
                  itemBuilder: (context, index) {
                    return CustomFoodItemWidget(mealModel: snapshot.data![index]);
                  },
                );
              }
              return Text(
                'Something went wrong from container ${snapshot.error}',
              );
            },
          ),
        ),
      ],
    );
  }
}
