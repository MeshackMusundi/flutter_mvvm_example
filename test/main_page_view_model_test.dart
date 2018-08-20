import 'package:flutter_mvvm_example/interfaces/i_star_wars_api.dart';
import 'package:flutter_mvvm_example/utils/swapi.dart';
import 'package:flutter_mvvm_example/view_models/main_page_view_model.dart';
import 'package:test/test.dart';

main() {
  IStarWarsApi swapi = Swapi();
  MainPageViewModel starWarsViewModel = MainPageViewModel(api: swapi);

  test(
    'Films fetch test',
    () async {      
      await starWarsViewModel.fetchFilms();
      var films = starWarsViewModel.films;

      expect(films.length, 7);
    },
  );

  test(
    'Films loading test',
    () async {      
      await starWarsViewModel.fetchFilms();
      bool isLoadingFilms = starWarsViewModel.isLoadingFilms;

      expect(isLoadingFilms, true);
    },
  );

  test(
    'Films fetch internet connection test',
    () async {      
      await starWarsViewModel.fetchFilms();
      bool isNotConnected = starWarsViewModel.noInternetConnection;

      expect(isNotConnected, false);
    },
  );
}