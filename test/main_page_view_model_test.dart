import 'package:flutter_mvvm_example/interfaces/i_star_wars_api.dart';
import 'package:flutter_mvvm_example/services/swapi_service.dart';
import 'package:flutter_mvvm_example/view_models/main_page_view_model.dart';
import 'package:test/test.dart';

main() {
  IStarWarsApi swapi = SwapiService();
  MainPageViewModel viewModel = MainPageViewModel(api: swapi);

  test(
    'Films fetch test',
    () async {      
      await viewModel.setFilms();
      var films = await viewModel.films;
      expect(films.length, 7);
    },
  );

  test(
    'Characters fetch test',
    () async {      
      var gotCharacters = await viewModel.setCharacters();
      expect(gotCharacters, true);
    },
  );

  test(
    'Planets fetch test',
    () async {      
      var gotPlanets = await viewModel.setPlanets();
      expect(gotPlanets, true);
    },
  );
}