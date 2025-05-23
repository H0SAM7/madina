import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madina/core/widgets/custom_err_view.dart';
import 'package:madina/core/widgets/loading_widgets.dart';
import 'package:madina/users/super_admin/data/models/city_model.dart';
import 'package:madina/users/super_admin/presentation/manager/cities/super_admin_cubit.dart';
import 'package:madina/users/super_admin/presentation/views/widgets/city_card.dart';

class CitiesListView extends StatelessWidget {
  const CitiesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuperAdminCubit, SuperAdminState>(
 
      builder: (context, state) {
        if (state is Success) {
      List<CityModel>  cities =   BlocProvider.of<SuperAdminCubit>(context).cities;
          return ListView.builder(
            itemCount: cities.length,
            itemBuilder: (context, ind) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: CityCard(index: ind + 1, cityModel: cities[ind]),
              );
            },
          );
        } else if (state is Loading) {
          return Center(child: LoadingWidgets.flicker());
        } else if (state is Failure) {
          return CustomErrView(errMessage: state.errmessage);
        } else {
          return SizedBox();
        }
      },
    );
  }
}
