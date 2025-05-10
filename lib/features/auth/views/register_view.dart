import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madina/constants.dart';
import 'package:madina/core/styles/text_styles.dart';
import 'package:madina/core/utils/assets.dart';
import 'package:madina/core/widgets/custom_text_field.dart';
import 'package:madina/features/auth/views/login_view.dart';
import 'package:madina/features/auth/views/widgets/custom_send_button.dart';
import 'package:madina/features/auth/views/widgets/have_acc_widget.dart';

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

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),

              SizedBox(height: 90.h),

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
              ),
              CustomTextFrom(
                icon: Icon(Icons.email_outlined, color: blueColor),
                label: "البريد الالكتروني",
                hint: 'ادخل بريدك الالكتروني',
                controller: emailController,
              ),
              CustomTextFrom(
                icon: Icon(Icons.lock_outline, color: blueColor),
                label: 'كلمة المرور',
                hint: 'ادخل كلمة المرور الخاصة بك',
                isPasswordField: true,
                controller: passController,
              ),

              HaveAccWidget(
                title: 'هل لديك حساب بالفعل؟  \t ',
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
                    if (formKey.currentState!.validate()) {}
                  },
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
