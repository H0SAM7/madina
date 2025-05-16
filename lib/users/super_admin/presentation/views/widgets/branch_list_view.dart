import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madina/core/widgets/custom_err_view.dart';
import 'package:madina/core/widgets/loading_widgets.dart';
import 'package:madina/users/super_admin/data/models/branch_model.dart';
import 'package:madina/users/super_admin/presentation/manager/branchs/cubit/branchs_cubit.dart';
import 'package:madina/users/super_admin/presentation/manager/cities/super_admin_cubit.dart';
import 'package:madina/users/super_admin/presentation/views/widgets/branch_card.dart';

class BranchListView extends StatelessWidget {
  const BranchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BranchsCubit, BranchsState>(
      builder: (context, state) {
        if (state is BranchSuccess) {
          List<BranchModel> branchs =
              BlocProvider.of<BranchsCubit>(context).branchs;

          return ListView.builder(
            itemCount: branchs.length,
            itemBuilder: (context, ind) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: BranchCard(index: ind + 1, branchModel: branchs[ind]),
              );
            },
          );
        } else if (state is BranchLoading) {
          return Center(child: LoadingWidgets.flicker());
        } else if (state is BranchFailure) {
          return CustomErrView(errMessage: state.errmessage);
        } else {
          return SizedBox();
        }
      },
    );
  }
}
