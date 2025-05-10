
import 'package:flutter/material.dart';
import 'package:madina/users/super_admin/presentation/views/widgets/city_card.dart';

class CitiesListView extends StatelessWidget {
  const CitiesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      
      itemCount: 5,
      itemBuilder: (context, ind){
return Padding(
  padding: const EdgeInsets.symmetric(vertical: 2.0),
  child: CityCard(index: ind+1,),
);


      });
  }
}