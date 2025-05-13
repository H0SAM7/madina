import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madina/constants.dart';
import 'package:madina/core/utils/assets.dart';
import 'package:madina/core/widgets/custom_app_bar.dart';
import 'package:madina/users/super_admin/presentation/views/cities_view.dart';
import 'package:madina/users/super_admin/presentation/views/widgets/item_setting.dart';
import 'package:madina/users/super_admin/presentation/views/widgets/setting_container.dart';

class CitiesMangmentView extends StatelessWidget {
  const CitiesMangmentView({super.key});
  static String id = 'CitiesMangmentView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'ادارة المدن والفروع',
           
          ),
          SettingContainer(
            child: Column(
              children: [
                ItemSetting(
                  onTap: () {
                    Navigator.pushNamed(context, CitiesView.id);
                  },
                  leading: Image.asset(
                    Assets.iconsBrach,
                    color: blueColor,
                    height: 26.h,
                    width: 26.w,
                  ),
                  title: 'المدن والفروع',
                ),
                Divider(endIndent: 12, indent: 6, thickness: .6),
               

              ],
            ),
          ),
        ],
      ),
    );
  }
}
