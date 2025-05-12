
  String? passwordVaildtor(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'يرجى إدخال كلمة المرور';
    }

    if (value.length < 8) {
      return 'يجب أن تكون كلمة المرور 8 أحرف على الأقل';
    }

    // final hasDigit = value.contains(RegExp(r'\d'));
    // final hasSpecialChar = value.contains(
    //   RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
    // );

    // if (!hasDigit || !hasSpecialChar) {
    //   return 'يجب أن تحتوي كلمة المرور على حرف كبير، صغير، رقم ورمز خاص';
    // }

    return null;
  }

  String? phoneVaildtor(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'يرجى إدخال رقم الهاتف';
    }
    final phoneRegExp = RegExp(r'^(01[0-2,5])\d{8}$');

    if (!phoneRegExp.hasMatch(value.trim())) {
      return 'رقم الهاتف غير صالح';
    }

    return null;
  }

  String? nameVaildtor(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء ادخال الاسم ';
    }

    final specialCharPattern = RegExp(r'[!@#\$%\^&\*\(\)\.]');

    if (specialCharPattern.hasMatch(value)) {
      return "غير مسموح استخدام الرموز  !@#\$%^&*()";
    }

    return null;
  }

  String? emailVaildtor(String? value) {
    if (value == null || value.isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return 'الرجاء إدخال بريد إلكتروني صالح';
    }

    return null; // البريد الإلكتروني صحيح
  }