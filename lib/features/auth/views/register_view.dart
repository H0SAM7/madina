import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madina/core/styles/text_styles.dart';
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
  String? email, password, phone, fatherPhone, name;
  bool _isDialogShowing = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
              backgroundColor: Colors.black,
              body: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                   
                      SizedBox(
                        height: 90.h,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Hello! Register to get \nstarted',
                          style: AppStyles.style22White(context)
                              .copyWith(fontSize: 25),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFrom(
                        hint: 'enter name',
                        label: 'Name',
                        onChanged: (value) {
                          name = value;
                        },
                      ),
                      CustomTextFrom(
                        hint: 'enter email',
                        label: 'Email',
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      CustomTextFrom(
                        hint: 'enter password',
                        label: 'Password',
                        isPasswordField: true,
                        onChanged: (value) {
                          password = value;
                        },
                      ),

                      HaveAccWidget(
                        title: 'You have Accounts? ',
                        action: 'Login',
                        onPressed: () {
                          Navigator.pushNamed(context, LoginView.id);
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: CustomSendButton(
                          label: 'Sign Up',
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              // final user = UserModel(
                              //   email: email!,
                              //   password: password!,
                              //   name: name,
                              // );
                              // await BlocProvider.of<AuthCubit>(context)
                              //     .register(userModel: user);

                              // await FirebaseMessaging.instance
                              //     .subscribeToTopic(notifiGroup);
                            }
                          },
                        ),
                      ),
                 
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ),
            );
          
        
      }
    
  
}
