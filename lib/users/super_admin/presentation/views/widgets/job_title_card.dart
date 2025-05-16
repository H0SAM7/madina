import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madina/constants.dart';
import 'package:madina/core/styles/text_styles.dart';
import 'package:madina/core/utils/get_formated_date.dart';
import 'package:madina/users/super_admin/data/models/job_title_model.dart';

class JobTitleCard extends StatelessWidget {
  const JobTitleCard({super.key, required this.job, required this.index});

  final JobTitleModel job;
  final int index;

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return Colors.green;
      case 'inactive':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      elevation: 0,

      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue.shade100,
                  radius: 18.r,
                  child: Text(
                    '$index',
                    style: AppStyles.style18().copyWith(color: blue2),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(child: Text(job.name, style: AppStyles.style20())),
                GestureDetector(
                  onTap: () {
                    String selectedStatus =
                        job.status; // Track the selected status

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          // Use StatefulBuilder to update dialog state
                          builder: (context, setState) {
                            return AlertDialog(
                              title: Text('تغيير الحالة'), // Change Status
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    title: Text('تشغيل'), // Turn On
                                    leading: Icon(
                                      Icons.toggle_on,
                                      color: Colors.green,
                                    ),
                                    selected: selectedStatus == 'active',
                                    onTap: () {
                                      setState(() {
                                        selectedStatus = 'active';
                                      });
                                    },
                                  ),
                                  ListTile(
                                    title: Text('إيقاف'), // Turn Off
                                    leading: Icon(
                                      Icons.toggle_off,
                                      color: Colors.red,
                                    ),
                                    selected: selectedStatus == 'inactive',
                                    onTap: () {
                                      setState(() {
                                        selectedStatus = 'inactive';
                                      });
                                    },
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('إلغاء'), // Cancel
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    try {
                                      // Show loading indicator
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                      );

                                      // Close loading indicator
                                      Navigator.pop(context);
                                      // Close dialog
                                      Navigator.pop(context);

                                      // Show success message
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'تم تحديث الحالة بنجاح',
                                          ),
                                          backgroundColor: Colors.green,
                                        ),
                                      );

                                      // Update local state if needed
                                      setState(() {
                                        job.status = selectedStatus;
                                      });
                                    } catch (error) {
                                      // Close loading indicator
                                      Navigator.pop(context);

                                      // Show error message
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'حدث خطأ أثناء تحديث الحالة',
                                          ),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    }
                                  },
                                  child: Text('حفظ'), // Save
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: getStatusColor(job.status).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      job.status == "active" ? "نشط" : "غير نشط",
                      style: AppStyles.style16Gray().copyWith(
                        color: getStatusColor(job.status),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.calendar_today, size: 22.w, color: blue2),
                SizedBox(width: 6.w),
                Expanded(
                  child: Text(
                    "تاريخ الإنشاء (هـ): ${formatHijriDate(job.creationDateHijri)}",
                    style: AppStyles.style16Gray(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.date_range, size: 22.w, color: blue2),
                SizedBox(width: 6.w),
                Expanded(
                  child: Text(
                    "تاريخ الإنشاء (م): ${getFormattedDateTime(createdAt: job.creationDate)}",
                    style: AppStyles.style16Gray(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            Row(
              children: [
                Icon(Icons.people_outline, size: 22.w, color: blue2),
                SizedBox(width: 6.w),
                Text(
                  "عدد العمال: ${job.workersCount}",
                  style: AppStyles.style16Gray(),
                ),
                Spacer(),
                Icon(Icons.admin_panel_settings, size: 22.w, color: blue2),
                SizedBox(width: 6.w),
                Text("بواسطة: ${job.adminName}", style: AppStyles.style18()),
              ],
            ),
            if (job.changedData != null) ...[
              Divider(height: 24.h),
              Text(
                "تم تعديل البيانات:",
                style: AppStyles.style16Gray().copyWith(color: Colors.orange),
                textDirection: TextDirection.rtl,
              ),
              if (job.changedData?.creationDate != null &&
                  job.changedData!.creationDate!.old !=
                      job.changedData!.creationDate!.new_)
                _updatedSection(
                  "تاريخ الإنشاء (م)",
                  getFormattedDateTime(
                    createdAt: job.changedData!.creationDate!.old,
                  ),
                  getFormattedDateTime(
                    createdAt: job.changedData!.creationDate!.new_,
                  ),
                ),
              if (job.changedData?.creationDateHijri != null &&
                  job.changedData!.creationDateHijri!.old !=
                      job.changedData!.creationDateHijri!.new_)
                _updatedSection(
                  "تاريخ الإنشاء (هـ)",
                  formatHijriDate(job.changedData!.creationDateHijri!.old),
                  formatHijriDate(job.changedData!.creationDateHijri!.new_),
                ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _updatedSection(String label, String oldValue, String newValue) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.date_range, color: blue2, size: 22.w),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              "$label: من \"$oldValue\" إلى \"$newValue\"",
              style: AppStyles.style16Gray(),
            ),
          ),
        ],
      ),
    );
  }
}
