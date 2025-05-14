import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madina/core/styles/text_styles.dart';

class JobTitleCard extends StatelessWidget {
  const JobTitleCard({super.key, required this.index, required this.title});
  final int index;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shadowColor: Colors.blueGrey.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.r)),
      child: Row(
        children: [
          CircleAvatar(
            radius: 14.r,
            backgroundColor: Colors.blue.shade100,
            child: Text(index.toString(), style: AppStyles.style20()),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              title,
              style: AppStyles.style18(),
              textDirection: TextDirection.rtl,
            ),
          ),
        ],
      ),
    );
  }
}
