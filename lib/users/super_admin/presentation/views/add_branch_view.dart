import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madina/core/widgets/custom_app_bar.dart';
import 'package:madina/core/widgets/custom_text_field.dart';
import 'package:madina/features/auth/views/widgets/custom_send_button.dart';

class AddBranchView extends StatefulWidget {
  const AddBranchView({super.key});
static String id='AddBranchView';

  @override
  State<AddBranchView> createState() => _AddBranchViewState();
}

class _AddBranchViewState extends State<AddBranchView> {
    final TextEditingController _nameController = TextEditingController();
      final _formKey = GlobalKey<FormState>();

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
          children: [
        CustomAppBar(title: 'اضافة فرع جديد',),
                     SizedBox(height: 20.h),

           CustomTextFrom(
                label: "اسم الفرع",
                hint: "ادخل اسم الفرع",
                controller: _nameController,
              ),
        
           CustomTextFrom(
                label: "عنوان الفرع",
                hint: "ادخل عنوان الفرع",
                controller: _nameController,
              ),
              SizedBox(height: 20.h),
              CustomSendButton(
                label: 'انشاء',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    clearData();
        
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