import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madina/constants.dart';
import 'package:madina/core/utils/assets.dart';
import 'package:madina/core/widgets/custom_app_bar.dart';
import 'package:madina/users/super_admin/presentation/views/cities_mangment_view.dart';
import 'package:madina/users/super_admin/presentation/views/widgets/item_setting.dart';
import 'package:madina/users/super_admin/presentation/views/widgets/setting_container.dart';

class AdminView extends StatelessWidget {
  const AdminView({super.key});
  static String id = 'AdminView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomAppBar(title: "Super Admin", isPop: true),
          SettingContainer(
            child: Column(
              children: [
                ItemSetting(
                  onTap: () {
                    Navigator.pushNamed(context, CitiesMangmentView.id);
                  },
                  leading: Image.asset(
                    Assets.iconsBrach,
                    color: blueColor,
                    height: 26.h,
                    width: 26.w,
                  ),
                  title: 'ادارة الفروع والمدن',
                ),
                Divider(endIndent: 12, indent: 6, thickness: .6,),
                ItemSetting(leading: Icon(Icons.add), title: 'title'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
