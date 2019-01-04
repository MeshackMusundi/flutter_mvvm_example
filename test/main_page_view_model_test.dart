import 'package:flutter_mvvm_example/mocks/mocks.dart';
import 'package:flutter_mvvm_example/models/film.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_mvvm_example/services/swapi_service.dart';
import 'package:flutter_mvvm_example/view_models/main_page_view_model.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

main() {
  final String baseUrl = 'https://swapi.co/api';
  final MockClient client = MockClient();
  final SwapiService svc = SwapiService()..client = client;
  MainPageViewModel viewModel = MainPageViewModel(apiSvc: svc);

  test(
    'Films fetch test',
    () async {
      when(client.get('$baseUrl/films')).thenAnswer(
        (_) async => http.Response('''{
            "results": [
              {
                "title": "A New Hope",
                "opening_crawl": "Blah blah blah",
                "director": "George Lucas",
                "producer": "Gary Kurtz, Rick McCallum",
                "release_date": "1977-05-25"
              }
            ]
          }''', 200),
      );

      await viewModel.setFilms();
      expect(await viewModel.films, isInstanceOf<List<Film>>());
    },
  );

  test(
    'Characters fetch test',
    () async {
      when(client.get('$baseUrl/people')).thenAnswer(
        (_) async => http.Response('''{
            "results": [
              {
                "name": "Luke Skywalker",
                "birth_year": "19BBY",
                "gender": "male",
                "height": "172",
                "eye_color": "blue"
              }
            ]
          }''', 200),
      );

      expect(await viewModel.setCharacters(), true);
    },
  );

  test(
    'Planets fetch test',
    () async {
      when(client.get('$baseUrl/planets')).thenAnswer(
        (_) async => http.Response('''{
            "results": [
              {
                "name": "Alderaan",
                "climate": "temperate",
                "terrain": "grasslands, mountains",
                "diameter": "12500",
                "gravity": "1 standard",
                "population": "20000000000"
              }
            ]
          }''', 200),
      );

      expect(await viewModel.setPlanets(), true);
    },
  );
}
