
import 'package:flutter/material.dart';

class CityDropdown extends StatelessWidget {
  final String? selectedCity;
  final ValueChanged<String?> onChanged;

  const CityDropdown({
    super.key,
    required this.selectedCity,
    required this.onChanged,
  });

  static const List<String> _cities = [
    'الرياض', 'جدة', 'مكة المكرمة', 'المدينة المنورة', 'الدمام',
    'الخبر', 'الطائف', 'تبوك', 'أبها', 'حائل', 'نجران', 'جيزان',
    'بريدة', 'الجبيل', 'ينبع', 'القطيف', 'عرعر', 'سكاكا',
    'القريات', 'الخرج'
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedCity,
        dropdownColor: Colors.white, 

      decoration: const InputDecoration(

        
        labelText: 'اختر المدينة',
        border: OutlineInputBorder(),
      ),
      items: _cities.map((city) {
        return DropdownMenuItem(
          value: city,
          child: Text(city),
        );
      }).toList(),
        validator: (value) {
    if (value == null || value.isEmpty) {
      return 'يرجى اختيار المدينة';
    }
    return null;
  },
      onChanged: onChanged,
    );
  }
}
