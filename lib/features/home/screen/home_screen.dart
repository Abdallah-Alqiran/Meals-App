import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/features/home/data/dp_helper/db_helper.dart';
import 'package:meals_app/routes/app_routes.dart';

import '../../../core/utils/app_color.dart';

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
            Stack(
              children: [
                Container(
                  height: 250.h,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/png/home_background.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  bottom: 20.h,
                  left: 25.w,
                  child: Container(
                      height: 180.h,
                      width: 180.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.r),
                          color: AppColor.primaryColor.withOpacity(0.1)),
                      child: Text('Welcome\nAdd a New Recipe',
                          style: TextStyle(
                              color: AppColor.title,
                              fontSize: 28.sp,
                              fontWeight: FontWeight.bold))),
                )
              ],
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              child: Column(
                children: [
                  Text(
                    "Your Food",
                    style: TextStyle(
                        color: AppColor.decorationColor, fontSize: 16.sp),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
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
                          color: AppColor.primaryColor),
                    ),
                  );
                } else if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return const Center(
                        child: Text('There is no Food Found!!'));
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: GridView.builder(
                        itemCount: snapshot.data!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.9,
                            mainAxisSpacing: 15.h,
                            crossAxisSpacing: 50.w),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, AppRoutes.mealsDetailsScreen, arguments: snapshot.data![index]);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: snapshot.data![index].imageUrl,
                                      placeholder: (context, url) =>
                                          const CircularProgressIndicator(),
                                      errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
                                    ),
                                  ),
                                  Text(
                                    snapshot.data![index].name,
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.star,
                                          color: AppColor.primaryColor,
                                          size: 16.sp),
                                      SizedBox(width: 3.w),
                                      Text(
                                        snapshot.data![index].rate.toString(),
                                        style: TextStyle(fontSize: 12.sp),
                                      ),
                                      const Spacer(),
                                      Icon(Icons.lock_clock,
                                          color: AppColor.primaryColor,
                                          size: 16.sp),
                                      SizedBox(width: 3.w),
                                      Text(
                                        snapshot.data![index].time,
                                        style: TextStyle(fontSize: 12.sp),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                }
                return Text(
                    'Something went wrong from container ${snapshot.error}');
              },
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.title,
        shape: const CircleBorder(
            side: BorderSide(
          color: AppColor.primaryColor,
        )),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addMealScreen);
        },
        child: const Icon(
          Icons.add,
          color: AppColor.primaryColor,
        ),
      ),
    );
  }
}
