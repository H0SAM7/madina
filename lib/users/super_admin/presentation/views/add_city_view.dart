import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madina/core/network/network.dart';
import 'package:madina/core/utils/functions/vaildtor.dart';
import 'package:madina/core/widgets/confirmation_dialog.dart';
import 'package:madina/core/widgets/custom_app_bar.dart';
import 'package:madina/core/widgets/custom_progress_hud.dart';
import 'package:madina/core/widgets/custom_text_field.dart';
import 'package:madina/features/auth/views/widgets/custom_send_button.dart';
import 'package:madina/users/super_admin/presentation/manager/cubit/super_admin_cubit.dart';
import 'package:madina/users/super_admin/presentation/views/add_branch_view.dart';
import 'package:madina/users/super_admin/presentation/views/cities_view.dart';
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
    return BlocConsumer<SuperAdminCubit, SuperAdminState>(
      listener: (context, state) {
        if (state is Success) {
          Navigator.pushReplacementNamed(context, CitiesView.id);

          clearData();
        } else if (state is Failure) {
          showCustomDialog(
            context,
            title: 'خطأ',
            content: state.errmessage,
            positiveButtonText: 'حسنا',
         //   negativeButtonText: "",
            onPositivePressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            // onNegativePressed: () {
            //   Navigator.of(context, rootNavigator: true).pop();
            // },
          );

          log(state.errmessage);
        }
      },

      builder: (context, state) {
        return CustomProgressHUD(
          inAsyncCall: state is Loading,
          child: AbsorbPointer(
            absorbing: state is Loading,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomAppBar(title: 'انشاء مدينة جديدة'),
                    SizedBox(height: 20.h),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 16),
                    //   child: CityDropdown(
                    //     selectedCity: _selectedCity,
                    //     onChanged: _onCitySelected,
                    //   ),
                    // ),
                    SizedBox(height: 20.h),
                    CustomTextFrom(
                      label: "اسم المدينة",
                      hint: "ادخل اسم المدينة",
                      controller: _nameController,
                      validator: (value) {
                        return nameVaildtor(value);
                      },
                    ),

                    SizedBox(height: 20.h),
                    CustomSendButton(
                      label: 'انشاء',
                      onTap: () async {
                        final temptokenadd =
                            'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FsbWFkaW5haC56YWhhLXNjcmlwdC5uZXQvYXBpL2FkbWluL2xvZ2luIiwiaWF0IjoxNzQ2OTkyOTQ0LCJleHAiOjE3NjI1NDQ5NDQsIm5iZiI6MTc0Njk5Mjk0NCwianRpIjoiYjBOZUpweUZNN3JqeE1nOCIsInN1YiI6IjEiLCJwcnYiOiJkZjg4M2RiOTdiZDA1ZWY4ZmY4NTA4MmQ2ODZjNDVlODMyZTU5M2E5In0.4GVFDZTLl-0JVow4nVMgouUicWpa-s8LTbU7iSFGYUE';
                        if (_formKey.currentState!.validate()) {
                          await BlocProvider.of<SuperAdminCubit>(
                            context,
                          ).addCity(
                            token: temptokenadd,
                            name: _nameController.text,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void clearData() {
    _nameController.clear();
  }
}
