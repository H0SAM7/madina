import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madina/constants.dart';
import 'package:madina/core/network/network.dart';
import 'package:madina/core/styles/text_styles.dart';
import 'package:madina/core/utils/functions/vaildtor.dart';
import 'package:madina/core/utils/get_formated_date.dart';
import 'package:madina/core/widgets/confirmation_dialog.dart';
import 'package:madina/core/widgets/custom_app_bar.dart';
import 'package:madina/core/widgets/custom_bottom_sheet.dart';
import 'package:madina/core/widgets/custom_button.dart';
import 'package:madina/core/widgets/custom_loading_indecator.dart';
import 'package:madina/core/widgets/custom_text_field.dart';
import 'package:madina/users/super_admin/data/models/branch_model.dart';
import 'package:madina/users/super_admin/presentation/manager/cubit/super_admin_cubit.dart';
import 'package:madina/users/super_admin/presentation/views/widgets/item_setting.dart';
import 'package:madina/users/super_admin/presentation/views/widgets/job_title_card.dart';
import 'package:madina/users/super_admin/presentation/views/widgets/job_title_list_view.dart';

class BranchDetailsView extends StatefulWidget {
  const BranchDetailsView({super.key, required this.branchModel});
  static const String id = 'BranchDetailsView';
  final BranchModel branchModel;

  @override
  State<BranchDetailsView> createState() => _BranchDetailsViewState();
}

class _BranchDetailsViewState extends State<BranchDetailsView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _jobNameController = TextEditingController();
  @override
  void dispose() {
    _jobNameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    getTitles();

    super.initState();
  }

  void getTitles()async {
   await  BlocProvider.of<SuperAdminCubit>(
      context,
    ).getJobtitles(token: temptoken, branchId: widget.branchModel.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomAppBar(title: widget.branchModel.name),
          Divider(),
          ExpansionTile(
            leading: Icon(Icons.refresh_outlined, color: blue2),
            title: Text('تحديث بيانات الفرع', style: AppStyles.style20()),
            trailing: Icon(Icons.expand_more, color: blue2, size: 25.w),
            initiallyExpanded: false,
            children: [
              ItemSetting(
                leading: Icon(Icons.update, color: blue2),
                title: 'تحديث بيانات الفرع',
                onTap:
                    () => {
                      showCustomBottomSheetWithConfirmation(
                        context: context,
                        title: 'تحديث بيانات الفرع',
                        confirmationMessage:
                            'هل تريد فعلاً إغلاق إعدادات الفرع؟',
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            //ItemSetting(title: 'title')
                          ],
                        ),
                      ),
                    },
              ),
              ItemSetting(
                leading: Icon(Icons.disabled_by_default, color: blue2),
                title: 'ايقاف الفرع',
                onTap: () => {},
              ),
              ItemSetting(
                leading: Icon(Icons.work, color: blue2),
                title: "انشاء وظيفة جديدة في الفرع ",
                onTap: () {
                  showCustomBottomSheetWithConfirmation(
                    context: context,
                    title: "انشاء وظيفة جديدة في الفرع ",
                    confirmationMessage: 'هل تريد فعلاً إغلاق إلاعدادات ',
                    content: Form(
                      key: _formKey,
                      child: BlocListener<SuperAdminCubit, SuperAdminState>(
                        listener: (context, state) {
                          if (state is Success) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "تم اضافة مسمي وظيفي بنجاح",
                                  style: AppStyles.style18().copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                            _jobNameController.clear();
                          } else if (state is Failure) {
                            showCustomDialog(
                              context,
                              title: 'خطأ',
                              content: state.errmessage,
                              positiveButtonText: 'حسنا',
                              //   negativeButtonText: "",
                              onPositivePressed: () {
                                Navigator.of(
                                  context,
                                  rootNavigator: true,
                                ).pop();
                              },
                              // onNegativePressed: () {
                              //   Navigator.of(context, rootNavigator: true).pop();
                              // },
                            );
                          } else {
                            CustomLoadingIndicator();
                          }
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTextFrom(
                              label: 'اسم الوظيفة',
                              hint: 'ادخل اسم الوظيفة',
                              controller: _jobNameController,
                              validator: (value) {
                                return nameVaildtor(value);
                              },
                            ),
                            CustomButton(
                              title: 'انشاء',
                              onTap:
                                  () async => {
                                    if (_formKey.currentState!.validate())
                                      {
                                        await BlocProvider.of<SuperAdminCubit>(
                                          context,
                                        ).addJobTitle(
                                          token: temptoken,
                                          name: _jobNameController.text,
                                          branchId: widget.branchModel.id,
                                        ),
                                      },
                                  },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              ItemSetting(
                leading: Icon(Icons.list_alt_sharp, color: blue2),
                title: "الاستعلام عن الوظائف في الفرع",
                onTap: () {
                  final titles = BlocProvider.of<SuperAdminCubit>(context).jobTitles;
                  showCustomBottomSheetWithoutConfirmation(
                    context: context,

                    title: "(${titles.length}) الاستعلام عن الوظائف في الفرع",

                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 400, child: JobTitleListView()),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),

          ExpansionTile(
            leading: Icon(Icons.info_outlined, color: blue2),
            title: Text("تفاصيل الفرع", style: AppStyles.style20()),

            trailing: Icon(Icons.expand_more, color: blue2, size: 25.w),
            collapsedBackgroundColor: Colors.white,

            backgroundColor: Colors.white,
            initiallyExpanded: false,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildDetailRow(
                      Icons.location_city,
                      "المدينة",
                      widget.branchModel.cityName ?? "",
                    ),
                    _buildDetailRow(
                      Icons.location_on,
                      "العنوان",
                      widget.branchModel.address ?? "غير متوفر",
                    ),
                    _buildDetailRow(
                      Icons.admin_panel_settings,
                      "المسؤول",
                      widget.branchModel.adminName ?? "",
                    ),
                    const Divider(),
                    _buildDetailRow(
                      Icons.apartment,
                      "عدد المكاتب",
                      widget.branchModel.officesCount.toString(),
                    ),
                    _buildDetailRow(
                      Icons.store,
                      "عدد المتاجر",
                      widget.branchModel.storesCount.toString(),
                    ),
                    _buildDetailRow(
                      Icons.people,
                      "عدد العمال",
                      widget.branchModel.workersCount.toString(),
                    ),
                    _buildDetailRow(
                      Icons.directions_bus,
                      "عدد الرحلات",
                      widget.branchModel.tripsCount.toString(),
                    ),
                    const Divider(),
                    _buildDetailRow(
                      Icons.check_circle,
                      "الحالة",
                      widget.branchModel.status == 'active' ? "نشط" : "غير نشط",
                    ),
                    _buildDetailRow(
                      Icons.date_range,
                      "  تاريخ الانشاء (هــ)",
                      "\n${widget.branchModel.creationDateHijri}\n " ?? "",
                    ),
                    _buildDetailRow(
                      Icons.date_range,
                      "  تاريخ الانشاء (م)",
                      "\n${getFormattedDateTime(createdAt: widget.branchModel.creationDate)}\n " ??
                          "",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    bool isDateRow = label == "  تاريخ الانشاء (هــ)";
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 24.w, color: blue2),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              "$label:\t  ${isDateRow ? formatHijriDate(value) : value}",
              style: AppStyles.style18(),
              textDirection: TextDirection.rtl,
            ),
          ),
        ],
      ),
    );
  }
}
