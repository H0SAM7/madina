import 'package:flutter/cupertino.dart';

bool isArabic(BuildContext context) {
  return Localizations.localeOf(context).languageCode == 'ar';
}

String discount(String price, double discount) {
  double discountPrice =
      double.parse(price) - (double.parse(price) * discount / 100);
  return discountPrice.toString();
}
