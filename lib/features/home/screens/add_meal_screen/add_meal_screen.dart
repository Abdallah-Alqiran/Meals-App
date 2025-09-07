import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/utils/app_color.dart';
import 'package:meals_app/core/utils/app_text_styles.dart';
import 'package:meals_app/core/widgets/primary_button_widget.dart';
import 'package:meals_app/features/home/data/dp_helper/db_helper.dart';
import 'package:meals_app/features/home/data/model/meal_model.dart';
import 'package:meals_app/features/home/screens/add_meal_screen/widgets/custom_text_form_field.dart';
import 'package:meals_app/routes/app_routes.dart';

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

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Meal', style: AppTextStyles.black16Medium),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.h),
                  CustomTextFormField(
                    title: 'Meal Name',
                    hintText: 'Enter your meal name',
                    controller: nameController,
                  ),
                  CustomTextFormField(
                    title: 'Image URL',
                    hintText: 'Enter your image url',
                    controller: imageUrlController,
                    maxLines: 4,
                  ),
                  CustomTextFormField(
                    title: 'Rate',
                    hintText: 'Enter food rating',
                    controller: rateController,
                    keyboardType: TextInputType.number,
                  ),
                  CustomTextFormField(
                    title: 'Time',
                    hintText: 'preparing meal time...',
                    controller: timeController,
                  ),
                  CustomTextFormField(
                    title: 'Description',
                    hintText: 'description...',
                    controller: descriptionController,
                    maxLines: 7,
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: PrimaryButtonWidget(
                      buttonText: "Save",
                      onPress: () {
                        if (key.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          dbHelper
                              .insert(
                                MealModel(
                                  imageUrl: imageUrlController.text,
                                  name: nameController.text,
                                  rate: double.parse(rateController.text),
                                  description: descriptionController.text,
                                  time: timeController.text,
                                ),
                              )
                              .then((value) {
                                isLoading = false;
                                if (!context.mounted) return;
                                GoRouter.of(
                                  context,
                                ).pushReplacementNamed(AppRoutes.homeScreen);
                              });
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  isLoading == true
                      ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primaryColor,
                        ),
                      )
                      : Container(),
                  SizedBox(height: 64.sp),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

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
