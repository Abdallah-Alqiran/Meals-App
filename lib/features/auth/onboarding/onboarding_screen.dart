import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/utils/app_text_styles.dart';
import 'package:meals_app/core/widgets/spacing_widgets.dart';
import 'package:meals_app/features/onboarding_services/onboarding_services.dart';
import 'package:meals_app/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/app_assets/app_assets.dart';
import '../../../core/utils/app_color.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List<String> titles = [
    "Save your Meals Ingredient",
    "Use Our App The Best Choice",
    "Our App Your Ultimate Choice",
  ];

  final List<String> description = [
    "Add Your Meals and it's Ingredients and we will save it for you",
    "The best choice for your kitchen do not hesitate",
    "All the best restaurants and their top menus are ready for you",
  ];

  double currentPage = 0.0;
  final CarouselSliderController controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.onBoardingImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 40.h,
            right: 32.w,
            left: 32.w,
            child: Container(
              width: 311.w,
              height: 400.h,
              decoration: BoxDecoration(
                color: AppColor.primaryColor.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(48.r),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 32.sp),
                child: Column(
                  children: [
                    CarouselSlider(
                      carouselController: controller,
                      options: CarouselOptions(
                        height: 330.h,
                        viewportFraction: 0.9,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentPage = index.toDouble();
                          });
                        },
                      ),
                      items:
                          List.generate(titles.length, (index) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      titles[index],
                                      style: AppTextStyles.onBoardingTitleStyle,
                                      textAlign: TextAlign.center,
                                    ),
                                    const HeightSpace(16),
                                    Text(
                                      description[index],
                                      style:
                                          AppTextStyles
                                              .onBoardingDescriptionStyle,
                                      textAlign: TextAlign.center,
                                    ),
                                    const HeightSpace(36),
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
                                        activeSize: Size(24.w, 6.h),
                                        size: Size(24.w, 6.h),
                                        activeShape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            5.0.r,
                                          ),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            5.0.r,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16.sp,
                                      ),
                                      child:
                                          currentPage == 2
                                              ? InkWell(
                                                onTap: () async {
                                                  OnBoardingServices.setFirstTime();
                                                  if (!context.mounted) return;
                                                  GoRouter.of(
                                                    context,
                                                  ).pushNamed(
                                                    AppRoutes.homeScreen,
                                                  );
                                                },
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      AppColor.title,
                                                  radius: 26.sp,
                                                  child: Icon(
                                                    Icons.arrow_forward,
                                                    size: 26.sp,
                                                    color:
                                                        AppColor.primaryColor,
                                                  ),
                                                ),
                                              )
                                              : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {});
                                                    },
                                                    child: InkWell(
                                                      onTap: () async {
                                                        final SharedPreferences
                                                        prefs =
                                                            await SharedPreferences.getInstance();
                                                        await prefs.setBool(
                                                          "seen",
                                                          true,
                                                        );
                                                        if (!context.mounted) return;
                                                        GoRouter.of(
                                                          context,
                                                        ).pushReplacement(
                                                          AppRoutes.homeScreen,
                                                        );
                                                      },
                                                      child: Text(
                                                        "Skip",
                                                        style: TextStyle(
                                                          fontSize: 18.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColor.title,
                                                        ),
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
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: AppColor.title,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                    ),
                                  ],
                                );
                              },
                            );
                          }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
