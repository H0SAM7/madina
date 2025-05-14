import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madina/core/widgets/custom_err_view.dart';
import 'package:madina/core/widgets/loading_widgets.dart';
import 'package:madina/users/super_admin/presentation/manager/cubit/super_admin_cubit.dart';
import 'package:madina/users/super_admin/presentation/views/widgets/job_title_card.dart';

class JobTitleListView extends StatelessWidget {
  const JobTitleListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuperAdminCubit, SuperAdminState>(
      builder: (context, state) {
        if (state is Success) {
          final titles = BlocProvider.of<SuperAdminCubit>(context).jobTitles;
          return ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, ind) {
              return JobTitleCard(index: ind+1, title: titles[ind].name);
            },

          );
        }
        else if(state is Failure){
          return CustomErrView(errMessage: state.errmessage);
        }
        else if(state is Loading){
          return LoadingWidgets.flicker();
        }

        else {
          return SizedBox();
        }
      }
     
      
    );
  }
}
