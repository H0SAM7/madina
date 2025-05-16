import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madina/core/utils/functions/vaildtor.dart';
import 'package:madina/core/widgets/confirmation_dialog.dart';
import 'package:madina/core/widgets/custom_app_bar.dart';
import 'package:madina/core/widgets/custom_progress_hud.dart';
import 'package:madina/core/widgets/custom_text_field.dart';
import 'package:madina/features/auth/views/widgets/custom_send_button.dart';
import 'package:madina/users/super_admin/data/models/city_model.dart';
import 'package:madina/users/super_admin/presentation/manager/branchs/cubit/branchs_cubit.dart';
import 'package:madina/users/super_admin/presentation/views/cities_view.dart';

class AddBranchView extends StatefulWidget {
  const AddBranchView({super.key, required this.cityModel});
  static const String id = 'AddBranchView';
  final CityModel cityModel;

  @override
  State<AddBranchView> createState() => _AddBranchViewState();
}

class _AddBranchViewState extends State<AddBranchView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BranchsCubit, BranchsState>(
      listener: (context, state) {
        if (state is BranchSuccess) {
          Navigator.pushReplacementNamed(context, CitiesView.id);
          clearData();
        } else if (state is BranchFailure) {
          showCustomDialog(
            context,
            title: 'خطأ',
            content: state.errmessage,
            positiveButtonText: 'حسنا',
          //  negativeButtonText: "",
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
          inAsyncCall: state is BranchLoading,

          child: AbsorbPointer(
            absorbing: state is BranchLoading,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomAppBar(title: 'اضافة فرع جديد'),
                    SizedBox(height: 20.h),

                    CustomTextFrom(
                      label: "اسم الفرع",
                      hint: "ادخل اسم الفرع",
                      controller: _nameController,
                      validator: (value) {
                        return nameVaildtor(value);
                      },
                    ),

                    CustomTextFrom(
                      label: "عنوان الفرع",
                      hint: "ادخل عنوان الفرع",
                      controller: _addressController,
                    ),
                    SizedBox(height: 20.h),
                    CustomSendButton(
                      label: 'انشاء',
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          final tmp =
                              "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FsbWFkaW5haC56YWhhLXNjcmlwdC5uZXQvYXBpL2FkbWluL2xvZ2luIiwiaWF0IjoxNzQ2OTkyOTQ0LCJleHAiOjE3NjI1NDQ5NDQsIm5iZiI6MTc0Njk5Mjk0NCwianRpIjoiYjBOZUpweUZNN3JqeE1nOCIsInN1YiI6IjEiLCJwcnYiOiJkZjg4M2RiOTdiZDA1ZWY4ZmY4NTA4MmQ2ODZjNDVlODMyZTU5M2E5In0.4GVFDZTLl-0JVow4nVMgouUicWpa-s8LTbU7iSFGYUE";
                          await BlocProvider.of<BranchsCubit>(
                            context,
                          ).addBranch(
                            token: tmp,
                            name: _nameController.text,
                            address: _addressController.text,
                            id: widget.cityModel.id,
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
    _addressController.clear();
  }
}
