import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madina/core/utils/functions/vaildtor.dart';
import 'package:madina/core/utils/local_storage.dart';
import 'package:madina/core/widgets/confirmation_dialog.dart';
import 'package:madina/core/widgets/custom_app_bar.dart';
import 'package:madina/core/widgets/custom_progress_hud.dart';
import 'package:madina/core/widgets/custom_text_field.dart';
import 'package:madina/core/widgets/loading_widgets.dart';
import 'package:madina/features/auth/views/widgets/custom_send_button.dart';
import 'package:madina/users/super_admin/presentation/manager/cities/super_admin_cubit.dart';
import 'package:madina/users/super_admin/presentation/views/cities_view.dart';

class EditCityView extends StatefulWidget {
  const EditCityView({super.key});
  static const String id = 'EditCityView';

  @override
  State<EditCityView> createState() => _EditCityState();
}

class _EditCityState extends State<EditCityView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SuperAdminCubit, SuperAdminState>(
      listener: (context, state) {
        final cubit = context.read<SuperAdminCubit>();

        if (state is Success && cubit.currentAction == 'updateCity') {
          Navigator.pushReplacementNamed(context, CitiesView.id);
          cubit.currentAction = null;
        } else if (state is Failure) {
          showCustomDialog(
            context,
            title: 'خطأ',
            content: state.errmessage,
            positiveButtonText: 'حسنا',

            onPositivePressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
          
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
                    const CustomAppBar(title: 'تعديل اسم  المدينة'),
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
                      label: 'تعديل',
                      onTap: () async {
                        final temptokenadd =
                            'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FsbWFkaW5haC56YWhhLXNjcmlwdC5uZXQvYXBpL2FkbWluL2xvZ2luIiwiaWF0IjoxNzQ2OTkyOTQ0LCJleHAiOjE3NjI1NDQ5NDQsIm5iZiI6MTc0Njk5Mjk0NCwianRpIjoiYjBOZUpweUZNN3JqeE1nOCIsInN1YiI6IjEiLCJwcnYiOiJkZjg4M2RiOTdiZDA1ZWY4ZmY4NTA4MmQ2ODZjNDVlODMyZTU5M2E5In0.4GVFDZTLl-0JVow4nVMgouUicWpa-s8LTbU7iSFGYUE';
                        if (_formKey.currentState!.validate()) {
                       
                          context.read<SuperAdminCubit>().currentAction =
                              'updateCity';
                         
                          await BlocProvider.of<SuperAdminCubit>(
                            context,
                          ).updateCity(
                            token: temptokenadd,
                            newName: _nameController.text,
                            id: 3,
                          );

                          clearData();
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
