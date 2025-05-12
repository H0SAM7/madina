import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madina/constants.dart';
import 'package:madina/core/styles/text_styles.dart';
import 'package:madina/core/utils/assets.dart';
import 'package:madina/core/utils/functions/vaildtor.dart';
import 'package:madina/core/widgets/confirmation_dialog.dart';
import 'package:madina/core/widgets/custom_loading_indecator.dart';
import 'package:madina/core/widgets/custom_progress_hud.dart';
import 'package:madina/core/widgets/custom_text_field.dart';
import 'package:madina/core/widgets/loading_widgets.dart';
import 'package:madina/features/auth/manager/cubit/auth_cubit.dart';
import 'package:madina/features/auth/views/login_view.dart';
import 'package:madina/features/auth/views/widgets/custom_send_button.dart';
import 'package:madina/features/auth/views/widgets/have_acc_widget.dart';
import 'package:madina/users/super_admin/presentation/views/add_city_view.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  static String id = 'RegisterView';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController passconfirmController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController roleIdController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    passconfirmController.dispose();
    phoneController.dispose();
    roleIdController.dispose();
    nameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushReplacementNamed(context, LoginView.id);
          clear();
        } else if (state is AuthFailure) {
          showCustomDialog(
            context,
            title: 'خطأ',
            content: state.errMessage,
            positiveButtonText: 'حسنا',
            negativeButtonText: "الغاء",
            onPositivePressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            onNegativePressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
          );

          log(state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
          inAsyncCall: state is AuthLoading,
          child: AbsorbPointer(
            absorbing: state is AuthLoading,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 100.h),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'مرحبا بك ',
                          style: AppStyles.style22().copyWith(fontSize: 25),
                        ),
                      ),
                      const SizedBox(height: 15),

                      CustomTextFrom(
                        icon: Image.asset(Assets.iconsUser, color: blueColor),

                        label: "الاسم",
                        hint: 'ادخل اسمك',
                        controller: nameController,
                        validator: (value) {
                          return nameVaildtor(value);
                        },
                      ),
                      CustomTextFrom(
                        icon: Icon(Icons.email_outlined, color: blueColor),
                        label: "البريد الالكتروني",
                        hint: 'ادخل بريدك الالكتروني',
                        controller: emailController,
                        validator: (value) {
                          return emailVaildtor(value);
                        },
                      ),
                      CustomTextFrom(
                        icon: Icon(Icons.phone, color: blueColor),
                        label: " رقم الهاتف",
                        hint: 'ادخل رقم هاتفك ',
                        controller: phoneController,
                        validator: (value) {
                          return phoneVaildtor(value);
                        },
                      ),
                      CustomTextFrom(
                        icon: Icon(Icons.lock_outline, color: blueColor),
                        label: 'كلمة المرور',
                        hint: 'ادخل كلمة المرور الخاصة بك',
                        isPasswordField: true,
                        controller: passController,
                        validator: (value) {
                          return passwordVaildtor(value);
                        },
                      ),
                      CustomTextFrom(
                        icon: Icon(Icons.lock_outline, color: blueColor),
                        label: 'تاكيد كلمة المرور',
                        hint: 'ادخل كلمة المرور الخاصة بك',
                        isPasswordField: true,
                        validator: (value) {
                          final error = passwordVaildtor(value);
                          if (error != null) return error;

                          if (value != passController.text) {
                            return 'كلمة المرور غير متطابقة';
                          }

                          return null;
                        },
                      ),
                      HaveAccWidget(
                        title: 'هل لديك حساب بالفعل؟ \t ',
                        action: 'تسجيل دخول',
                        onPressed: () {
                          Navigator.pushNamed(context, LoginView.id);
                        },
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: CustomSendButton(
                          label: 'أنشاء حساب',
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              // var data = {
                              // 'name': 'hosam',
                              // 'email': 'hosam@gmail.com',
                              // 'password': '123456789',
                              // 'password_confirmation': '123456789',
                              // 'phoNum': '01124977278',
                              // 'role_id': '2',
                              // };

                              await BlocProvider.of<AuthCubit>(
                                context,
                              ).register(
                                data: {
                                  'name': nameController.text.trim(),
                                  'email': emailController.text.trim(),
                                  'password': passController.text.trim(),
                                  'password_confirmation':
                                      passconfirmController.text.trim(),
                                  'phoNum': phoneController.text.trim(),
                                  'role_id': 0,
                                },
                              );
                            }
                          },
                        ),
                      ),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
  void clear() {
    emailController.clear();
    passController.clear();
    passconfirmController.clear();
    phoneController.clear();
    roleIdController.clear();
    nameController.clear();
  }

}
