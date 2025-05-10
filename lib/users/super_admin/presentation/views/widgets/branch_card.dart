
import 'package:flutter/material.dart';
import 'package:madina/constants.dart';
import 'package:madina/core/styles/text_styles.dart';
import 'package:madina/core/utils/assets.dart';

class BranchCard extends StatelessWidget {
  const BranchCard({
    super.key, required this.index,
  });
final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      //  Navigator.pushNamed(context, BranchsView.id);
      },
      child: ListTile(
        leading: Text(index.toString(), style: AppStyles.style32( Colors.black)),
        title: Text(' فرع الدمام', style: AppStyles.style18()),
        subtitle: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("13 رحلة",style: AppStyles.style16Gray(),),
        ),
        trailing: Image.asset(Assets.iconsArrow),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: blueColor,width: .3),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
