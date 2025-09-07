import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/utils/app_color.dart';
import 'package:meals_app/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final int maxLines;
  final TextInputType keyboardType;
  const CustomTextFormField({super.key, required this.title, required this.hintText, required this.controller, this.maxLines = 1, this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 15.h),
      Text(title, style: AppTextStyles.grey14Regular.copyWith(color: Colors.black),),
      SizedBox(height: 5.h),
      TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        validator: (text) {
          if (text!.isEmpty) {
            return 'You should add text';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: AppColor.borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: AppColor.primaryColor),
          ),
        ),
      ),
    ],
  );
  }
}