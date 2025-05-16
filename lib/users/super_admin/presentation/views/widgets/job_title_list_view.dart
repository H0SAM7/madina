import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madina/core/widgets/custom_err_view.dart';
import 'package:madina/core/widgets/loading_widgets.dart';
import 'package:madina/users/super_admin/presentation/manager/jobs/cubit/jobs_cubit.dart';
import 'package:madina/users/super_admin/presentation/views/widgets/job_title_card.dart';

class JobTitleListView extends StatelessWidget {
  const JobTitleListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobsCubit, JobsState>(
      builder: (context, state) {
        if (state is JobsSuccess) {
          final titles = BlocProvider.of<JobsCubit>(context).jobTitles;
          return ListView.builder(
            itemCount: titles.length,
          //  physics: BouncingScrollPhysics(),

            itemBuilder: (context, ind) {
              return JobTitleCard(index: ind + 1, job: titles[ind]);
            },
          );
        } else if (state is JobsFailure) {
          return CustomErrView(errMessage: state.errmessage);
        } else if (state is JobsLoading) {
          return LoadingWidgets.flicker();
        } else {
          return SizedBox();
        }
      },
    );
  }
}
