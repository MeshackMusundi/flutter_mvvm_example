import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/view_models/main_page_view_model.dart';
import 'package:flutter_mvvm_example/views/widgets/films_list_item.dart';
import 'package:flutter_mvvm_example/views/widgets/no_internet_connection_sign.dart';
import 'package:scoped_model/scoped_model.dart';

class FilmsPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainPageViewModel>(
      builder: (context, child, model) {
        if (model.noInternetConnection) return NoInternetConnectionSign();
        
        if (model.isLoadingFilms) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: model.films == null ? 0 : model.films.length,
          itemBuilder: (_, int index) {
            var film = model.films[index];
            return FilmsListItem(film: film);
          },
        );
      },
    );
  }
}