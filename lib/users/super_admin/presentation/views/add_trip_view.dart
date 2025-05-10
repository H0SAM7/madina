import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madina/core/widgets/custom_app_bar.dart';
import 'package:madina/core/widgets/custom_text_field.dart';
import 'package:madina/features/auth/views/widgets/custom_send_button.dart';

class AddTripView extends StatefulWidget {
  const AddTripView({super.key});
  static String id = 'AddTripView';

  @override
  State<AddTripView> createState() => _AddTripViewState();
}

class _AddTripViewState extends State<AddTripView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppBar(title: "انشاء رحلة"),
            SizedBox(height: 20.h),

            CustomTextFrom(
              label: " اسم الرحلة ",
              hint: "ادخل اسم الرحلة",
              controller: _nameController,
            ),

            CustomTextFrom(
              label: " وصف الرحلة ",
              hint: "ادخل وصف الرحلة",
              controller: _descController,
            ),

            SizedBox(height: 20.h),
            CustomSendButton(
              label: 'انشاء',
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  clearData();

                  //                          Navigator.pushNamed(context, AddBranchView.id);

                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void clearData() {
    _nameController.clear();
    _descController.clear();

      }


        }
