import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/features/home/screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils/app_color.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List<String> titles = [
    "Save your\nMeals\nIngredient",
    "Use Our App\nThe Best\nChoice",
    "Our App\nYour Ultimate\nChoice"
  ];

  final List<String> description = [
    "Add Your Meals and it's Ingredients and we will save it for you",
    "The best choice for your kitchen do not hesitate",
    "All the best restaurants and their top menus are ready for you"
  ];

  double currentPage = 0.0;
  final CarouselSliderController controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
            decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/png/food_background.png'),
              fit: BoxFit.cover),
        )),
        Positioned(
          bottom: 60.h,
          right: 40.w,
          left: 40.w,
          child: Container(
              width: 320.w,
              height: 400.h,
              decoration: BoxDecoration(
                  color: AppColor.primaryColor.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(50.r)
              ),
              child: CarouselSlider(
                carouselController: controller,
                options: CarouselOptions(
                    viewportFraction: 0.95,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentPage = index.toDouble();
                      });
                    }),
                items: List.generate(titles.length, (index) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                        Text(
                          titles[index],
                          style: TextStyle(
                              color: AppColor.title,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          description[index],
                          style: TextStyle(
                              color: AppColor.title,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                        DotsIndicator(
                          onTap: (index) {
                            setState(() {
                              controller.animateToPage(index);
                            });
                          },
                          dotsCount: titles.length,
                          position: currentPage,
                          decorator: DotsDecorator(
                              color: AppColor.dotCor,
                              activeColor: AppColor.title,
                              activeSize: Size(20.w, 10.h),
                              size: Size(20.w, 10.h),
                              activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.sp),
                          child: currentPage == 2
                              ? InkWell(
                                  onTap: () async {
                                    final SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setBool('seen', true);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeScreen()));
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: AppColor.title,
                                    radius: 26.sp,
                                    child: Icon(
                                      Icons.arrow_forward,
                                      size: 26.sp,
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {});
                                        },
                                        child: InkWell(
                                          onTap: () async {
                                            final SharedPreferences prefs = await SharedPreferences.getInstance();
                                            await prefs.setBool("seen", true);
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomeScreen()));
                                          },
                                          child: Text(
                                            "Skip",
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColor.title),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.nextPage();
                                          if (currentPage >= 3) {
                                            currentPage = 0;
                                          }
                                        },
                                        child: Text(
                                          "Next",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColor.title),
                                        ),
                                      )
                                    ]),
                        )
                      ]);
                    },
                  );
                }).toList(),
              )),
        )
      ]),
    );
  }
}
