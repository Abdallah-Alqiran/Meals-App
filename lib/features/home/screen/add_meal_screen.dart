import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/features/home/data/dp_helper/db_helper.dart';
import 'package:meals_app/features/home/data/model/meal_model.dart';
import 'package:meals_app/features/home/screen/home_screen.dart';

import '../../../core/utils/app_color.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  DatabaseHelper dbHelper = DatabaseHelper.instance;

  TextEditingController nameController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  final GlobalKey<FormState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Add Meal',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios))),
      body: SingleChildScrollView(
        child: SizedBox(
            width: MediaQuery
                .sizeOf(context)
                .width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              child: Form(
                key: key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),

                    customTextFormField(title: 'Meal Name',
                        hintText: 'Enter your meal name',
                        controller: nameController),
                    customTextFormField(title: 'Image URL',
                        hintText: 'Enter your image url',
                        controller: imageUrlController,
                        maxLines: 4),
                    customTextFormField(title: 'Rate',
                        hintText: 'Enter food rating',
                        controller: rateController),
                    customTextFormField(title: 'Time',
                        hintText: 'preparing meal time...',
                        controller: timeController),
                    customTextFormField(title: 'Description',
                        hintText: 'description...',
                        controller: descriptionController,
                        maxLines: 7),

                    SizedBox(height: 16.h),

                    SizedBox(
                      width: MediaQuery
                          .sizeOf(context)
                          .width,
                      child: ElevatedButton(
                        onPressed: () {
                          if (key.currentState!.validate()) {
                            dbHelper
                                .insert(MealModel(
                                imageUrl: imageUrlController.text,
                                name: nameController.text,
                                rate: double.parse(rateController.text),
                                description: descriptionController.text,
                                time: timeController.text))
                                .then((value) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const HomeScreen()));
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primaryColor,
                        ),
                        child: const Text(
                          'Save',
                          style: TextStyle(
                              color: AppColor.title,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }

  // to kill controllers when the screen dead
  @override
  void dispose() {
    nameController.dispose();
    imageUrlController.dispose();
    descriptionController.dispose();
    rateController.dispose();
    timeController.dispose();
    super.dispose();
  }

}

Widget customTextFormField(
    {required String title, required String hintText, required TextEditingController controller, int maxLines = 1}) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    SizedBox(
      height: 15.h,
    ),
    Text(title),
    SizedBox(
      height: 5.h,
    ),
    TextFormField(
      controller: controller,
      maxLines: maxLines,
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
  ]);
}
