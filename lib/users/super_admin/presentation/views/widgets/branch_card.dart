
import 'package:flutter/material.dart';
import 'package:madina/constants.dart';
import 'package:madina/core/styles/text_styles.dart';
import 'package:madina/core/utils/assets.dart';
import 'package:madina/users/super_admin/data/models/branch_model.dart';

class BranchCard extends StatelessWidget {
  const BranchCard({
    super.key, required this.index, required this.branchModel,
  });
final int index;
final BranchModel branchModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      //  Navigator.pushNamed(context, BranchsView.id);
      },
      child: ListTile(
        leading: Text(index.toString(), style: AppStyles.style32( Colors.black)),
        title: Text(branchModel.name, style: AppStyles.style18()),
        subtitle: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("${branchModel.tripsCount} رحلة",style: AppStyles.style16Gray(),),
        ),
        trailing: Image.asset(Assets.iconsLeftarrow),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: blueColor,width: .3),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
