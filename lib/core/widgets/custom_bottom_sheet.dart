import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madina/core/widgets/confirmation_dialog.dart';

void showCustomBottomSheetWithConfirmation({
  required BuildContext context,
  required String title,
  required String confirmationMessage,
  required Widget content,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    enableDrag: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return _BottomSheetWithConfirmation(
        title: title,
        confirmationMessage: confirmationMessage,
        content: content,
      );
    },
  );
}

void showCustomBottomSheetWithoutConfirmation({
  required BuildContext context,
  required String title,
  required Widget content,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    enableDrag: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return _BottomSheetWithoutConfirmation(title: title, content: content);
    },
  );
}

class _BottomSheetWithConfirmation extends StatelessWidget {
  final String title;
  final String confirmationMessage;
  final Widget content;

  const _BottomSheetWithConfirmation({
    required this.title,
    required this.confirmationMessage,
    required this.content,
  });

  Future<bool> _confirmClose(BuildContext context) async {
    bool shouldClose = false;

    await showCustomDialog(
      context,
      title: 'تأكيد الإغلاق',
      content: confirmationMessage,
      positiveButtonText: 'نعم',
      negativeButtonText: 'إلغاء',
      onPositivePressed: () {
        shouldClose = true;
        Navigator.of(context).pop();
        Navigator.of(context, rootNavigator: true).pop();
      },
      onNegativePressed: () {
        Navigator.of(context).pop();
      },
    );

    return shouldClose;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;

        final shouldClose = await _confirmClose(context);
        if (shouldClose) {
          Navigator.of(context).pop();
        }
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.black),
                  onPressed: () async {

                    final shouldClose = await _confirmClose(context);
                    if (shouldClose) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 8.h),
            content,
          ],
        ),
      ),
    );
  }
}

class _BottomSheetWithoutConfirmation extends StatelessWidget {
  final String title;
  final Widget content;

  const _BottomSheetWithoutConfirmation({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.close, color: Colors.black),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the sheet directly
                },
              ),
            ],
          ),
          SizedBox(height: 8.h),
          content,
        ],
      ),
    );
  }
}
