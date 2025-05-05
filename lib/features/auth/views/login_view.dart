import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madina/constants.dart';
import 'package:madina/core/styles/text_styles.dart';
import 'package:madina/core/widgets/custom_text_field.dart';
import 'package:madina/features/auth/views/forget_view.dart';
import 'package:madina/features/auth/views/register_view.dart';
import 'package:madina/features/auth/views/widgets/custom_send_button.dart';
import 'package:madina/features/auth/views/widgets/have_acc_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static String id = 'LoginView';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? email, password;
  @override
  Widget build(BuildContext context) {
  return  Scaffold(
      backgroundColor: Colors.black,
      body:
      // size: MediaQuery.of(context).size,
      Form(
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
                  'Welcome back! \nGlad to see you, Again!',
                  style: AppStyles.style22White(context).copyWith(fontSize: 25),
                ),
              ),
              SizedBox(height: 10.h),
              CustomTextFrom(
                hint: 'Enter Your Email',
                label: 'Email',
                onChanged: (value) {
                  email = value;
                },
              ),
              CustomTextFrom(
                hint: "enter  your password",
                label: 'Password',
                isPasswordField: true,
                onChanged: (value) {
                  password = value;
                },
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
              //      Navigator.pushNamed(context, ForgetView.id);
                  },
                  child: Text(
                    'Forget Password',
                    style: TextStyle(color: orangeColor),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Center(
                child: CustomSendButton(
                  label: 'Login',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      // await BlocProvider.of<AuthCubit>(context)
                      //     .login(email: email!, password: password!);
                      // await FirebaseMessaging.instance
                      //     .subscribeToTopic(notifiGroup);
                    }
                  },
                ),
              ),

              const SizedBox(height: 15),

              const SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HaveAccWidget(
                    title: 'Don’t have an account? ',
                    action: 'Sign Up',
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterView.id);
                    },
                  ),
                ],
              ),
              //   const SocialAuth(),
            ],
          ),
        ),
      ),
    );
  }
}
