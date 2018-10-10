import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/models/film.dart';
import 'package:flutter_mvvm_example/view_models/main_page_view_model.dart';
import 'package:flutter_mvvm_example/views/widgets/films_list_item.dart';
import 'package:flutter_mvvm_example/views/widgets/no_internet_connection.dart';
import 'package:scoped_model/scoped_model.dart';

class FilmsPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainPageViewModel>(
      builder: (context, child, model) {
        return FutureBuilder<List<Film>>(
          future: model.films,
          builder: (_, AsyncSnapshot<List<Film>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: const CircularProgressIndicator());              
              case ConnectionState.done:
                if (snapshot.hasData) {
                  var films = snapshot.data;
                  return ListView.builder(
                    itemCount: films == null ? 0 : films.length,
                    itemBuilder: (_, int index) {
                      var film = films[index];
                      return FilmsListItem(film: film);
                    },
                  );
                } else if (snapshot.hasError) {
                  return NoInternetConnection(
                    action: () async {
                      await model.setFilms();
                      await model.setCharacters();
                      await model.setPlanets();
                    },
                  );
                }
            }
          },
        );
      },
    );
  }
}