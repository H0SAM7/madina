import 'package:flutter/material.dart';
import 'package:madina/constants.dart';
import 'package:madina/core/styles/text_styles.dart';
import 'package:madina/core/utils/assets.dart';
import 'package:madina/users/super_admin/data/models/city_model.dart';
import 'package:madina/users/super_admin/presentation/views/branchs_view.dart';

class CityCard extends StatelessWidget {
  const CityCard({super.key, required this.index, required this.cityModel});
  final int index;
  final CityModel cityModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, BranchsView.id);
      },
      child: ListTile(
        leading: Text(index.toString(), style: AppStyles.style32(Colors.black)),
        title: Text(cityModel.name, style: AppStyles.style18()),
        subtitle: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "${cityModel.branchesCount} فرع",
            style: AppStyles.style16Gray(),
          ),
        ),
        trailing: Image.asset(Assets.iconsArrow),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: blueColor, width: .3),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
