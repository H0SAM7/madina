import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madina/core/styles/text_styles.dart';
import 'package:madina/constants.dart';

class StatusToggleButton extends StatelessWidget {
  final String currentStatus;
  final ValueChanged<String> onStatusChanged;

  const StatusToggleButton({
    Key? key,
    required this.currentStatus,
    required this.onStatusChanged,
  }) : super(key: key);

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

  Future<void> _showStatusDialog(BuildContext context) async {
    final selectedStatus = await showDialog<String>(
      context: context,
      builder: (context) {
        return _StatusDialog(currentStatus: currentStatus);
      },
    );

    if (selectedStatus != null && selectedStatus != currentStatus) {
      onStatusChanged(selectedStatus);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showStatusDialog(context),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: getStatusColor(currentStatus).withOpacity(0.1),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          currentStatus.toLowerCase() == "active" ? "نشط" : "غير نشط",
          style: AppStyles.style16Gray().copyWith(
            color: getStatusColor(currentStatus),
          ),
        ),
      ),
    );
  }
}

class _StatusDialog extends StatefulWidget {
  final String currentStatus;

  const _StatusDialog({Key? key, required this.currentStatus}) : super(key: key);

  @override
  State<_StatusDialog> createState() => _StatusDialogState();
}

class _StatusDialogState extends State<_StatusDialog> {
  late String selectedStatus;

  @override
  void initState() {
    super.initState();
    // Normalize to lowercase for consistent comparison
    selectedStatus = widget.currentStatus.toLowerCase();
  }

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return Colors.green;
      case 'inactive':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Widget _buildChoiceCircle(String status) {
    final bool isSelected = selectedStatus.toLowerCase() == status.toLowerCase();
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: _statusColor(status),
          width: 2,
        ),
        color: isSelected ? _statusColor(status) : Colors.transparent,
      ),
      child: isSelected
          ? const Icon(
              Icons.check,
              color: Colors.white,
              size: 16,
            )
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('تغيير الحالة'), // Change Status
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(
              'تشغيل', // Turn On
              style: TextStyle(
                color: selectedStatus.toLowerCase() == 'active' ? _statusColor('active') : null,
              ),
            ),
            leading: _buildChoiceCircle('active'),
            selected: selectedStatus.toLowerCase() == 'active',
            onTap: () => setState(() => selectedStatus = 'active'),
          ),
          ListTile(
            title: Text(
              'إيقاف', // Turn Off
              style: TextStyle(
                color: selectedStatus.toLowerCase() == 'inactive' ? _statusColor('inactive') : null,
              ),
            ),
            leading: _buildChoiceCircle('inactive'),
            selected: selectedStatus.toLowerCase() == 'inactive',
            onTap: () => setState(() => selectedStatus = 'inactive'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('إلغاء'), // Cancel
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, selectedStatus),
          child: const Text('حفظ'), // Save
        ),
      ],
    );
  }
}
