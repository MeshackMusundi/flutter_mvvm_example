import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/view_models/main_page_view_model.dart';
import 'package:flutter_mvvm_example/views/widgets/no_internet_connection_sign.dart';
import 'package:flutter_mvvm_example/views/widgets/planets_list_item.dart';
import 'package:scoped_model/scoped_model.dart';

class PlanetsPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainPageViewModel>(
      builder: (context, child, model) {        
        if (model.noInternetConnection) return NoInternetConnectionSign();
        
        if (model.isLoadingPlanets) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: model.planets == null ? 0 : model.planets.length,
          itemBuilder: (_, int index) {
            var planet = model.planets[index];
            return PlanetsListItem(planet: planet);
          },
        );
      },
    );
  }
}