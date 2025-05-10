import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madina/core/widgets/custom_app_bar.dart';
import 'package:madina/core/widgets/custom_text_field.dart';
import 'package:madina/features/auth/views/widgets/custom_send_button.dart';
import 'package:madina/users/super_admin/presentation/views/add_branch_view.dart';
import 'package:madina/users/super_admin/presentation/views/widgets/cities_drop_down.dart';

class AddCity extends StatefulWidget {
  const AddCity({super.key});
  static const String id = 'AddCity';

  @override
  State<AddCity> createState() => _AddCityState();
}

class _AddCityState extends State<AddCity> {
  String? _selectedCity;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  void _onCitySelected(String? city) {
    setState(() {
      _selectedCity = city;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
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
            const CustomAppBar(title: 'انشاء مدينة جديدة'),
             SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CityDropdown(
                selectedCity: _selectedCity,
                onChanged: _onCitySelected,
              ),
            ),
            SizedBox(height: 20.h),
            CustomTextFrom(
              label: "اسم المدينة",
              hint: "ادخل اسم المدينة",
              controller: _nameController,
            ),

            SizedBox(height: 20.h),
            CustomSendButton(
              label: 'انشاء',
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  clearData();

                  log('City submitted: $_selectedCity');
                  Navigator.pushNamed(context, AddBranchView.id);
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
  }
}



