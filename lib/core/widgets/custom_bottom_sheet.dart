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
      return DraggableScrollableSheet(
        initialChildSize: 0.5, // Initial height (50% of screen)
        minChildSize: 0.2, // Minimum height (20% of screen)
        maxChildSize: 0.95, // Maximum height (95% of screen)
        expand: false,
        builder: (context, scrollController) {
          return _BottomSheetWithoutConfirmation(
            title: title,
            content: content,
            scrollController: scrollController,
          );
        },
      );
    },
  );
}

class _BottomSheetWithoutConfirmation extends StatelessWidget {
  final String title;
  final Widget content;
  final ScrollController scrollController;

  const _BottomSheetWithoutConfirmation({
    required this.title,
    required this.content,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
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
            // Add drag handle
            Center(
              child: Container(
                width: 40,
                height: 4,
              //  margin: EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
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
                    Navigator.of(context).pop();
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