import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/core/utils/app_color.dart';

class AppTextStyles {
  static TextStyle onBoardingTitleStyle = GoogleFonts.inter(fontSize: 32.sp, fontWeight: FontWeight.w700, color: AppColor.title);
  static TextStyle onBoardingDescriptionStyle = GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.normal, color: AppColor.white);
  static TextStyle foodTitle = GoogleFonts.inter(fontSize: 24.sp, fontWeight: FontWeight.w400, color: Colors.black);

  static TextStyle white14SemiBold = GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColor.white);
  static TextStyle black16Medium = GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColor.decorationColor);
  static TextStyle grey14Regular = GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.normal, color: AppColor.descriptionColor);
}