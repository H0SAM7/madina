import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madina/constants.dart';
import 'package:madina/core/styles/text_styles.dart';
import 'package:madina/core/utils/assets.dart';
import 'package:madina/users/super_admin/data/models/branch_model.dart';
import 'package:madina/users/super_admin/presentation/views/branch_details_view.dart';

class BranchCard extends StatelessWidget {
  const BranchCard({super.key, required this.index, required this.branchModel});
  final int index;
  final BranchModel branchModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          BranchDetailsView.id,
          arguments: branchModel,
        );
      },
      child: ListTile(
        leading: Text(index.toString(), style: AppStyles.style32(Colors.black)),
        title: Text(
          branchModel.name,
          style: AppStyles.style18().copyWith(color: blue2),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "${branchModel.tripsCount} رحلة",
            style: AppStyles.style16Gray(),
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,

          children: [
            Text(
              branchModel.status == "active" ? "نشط" : "",
              style: AppStyles.style16Gray().copyWith(color: Colors.green),
            ),

            SizedBox(width: 16.w),
            Image.asset(Assets.iconsLeftarrow, color: blue2),
          ],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: blueColor, width: .3),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}



