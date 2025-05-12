import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madina/constants.dart';
import 'package:madina/core/styles/text_styles.dart';
import 'package:madina/core/utils/functions/vaildtor.dart';
import 'package:madina/core/widgets/confirmation_dialog.dart';
import 'package:madina/core/widgets/custom_progress_hud.dart';
import 'package:madina/core/widgets/custom_text_field.dart';
import 'package:madina/features/auth/manager/cubit/auth_cubit.dart';
import 'package:madina/features/auth/views/register_view.dart';
import 'package:madina/features/auth/views/widgets/custom_send_button.dart';
import 'package:madina/features/auth/views/widgets/have_acc_widget.dart';
import 'package:madina/users/super_admin/presentation/views/cities_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static String id = 'LoginView';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushReplacementNamed(context, CitiesView.id);
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 120.h),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "أهلا بعودتك",
                          style: AppStyles.style22().copyWith(fontSize: 25),
                        ),
                      ),
                      SizedBox(height: 10.h),
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
                        icon: Icon(Icons.lock_outline, color: blueColor),
                        label: 'كلمة المرور',
                        hint: 'ادخل كلمة المرور الخاصة بك',
                        isPasswordField: true,
                        controller: passController,
                        validator: (value) {
                          return passwordVaildtor(value);
                        },
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {
                            //      Navigator.pushNamed(context, ForgetView.id);
                          },
                          child: Text(
                            'نسيت كلمة المرور ؟',
                            style: TextStyle(color: blueColor),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Center(
                        child: CustomSendButton(
                          label: 'تسجيل دخول',
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              await BlocProvider.of<AuthCubit>(context).login(
                                email: emailController.text.trim(),
                                password: passController.text.trim(),
                              );
                            }
                          },
                        ),
                      ),

                      SizedBox(height: 10.h),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HaveAccWidget(
                            title: 'لا تملك حساب   ؟  ',
                            action: 'أنشاء حساب',
                            onPressed: () {
                              Navigator.pushNamed(context, RegisterView.id);
                            },
                          ),
                        ],
                      ),
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

  }

}
