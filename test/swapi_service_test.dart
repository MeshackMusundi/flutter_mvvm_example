import 'package:flutter_mvvm_example/models/character.dart';
import 'package:flutter_mvvm_example/models/film.dart';
import 'package:flutter_mvvm_example/models/planet.dart';
import 'package:flutter_mvvm_example/services/swapi_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

void main() {
  final String baseUrl = 'https://swapi.co/api';
  final MockClient client = MockClient();
  final SwapiService svc = SwapiService()..client = client;

  test('Returns a list of films if request is successful', () async {
    when(client.get('$baseUrl/films')).thenAnswer(
      (_) async => http.Response('''{
            "results": [
              {
                "title": "A New Hope",
                "opening_crawl": "Blah blah blah",
                "director": "George Lucas",
                "producer": "Gary Kurtz, Rick McCallum",
                "release_date": "1977-05-25"
              },
              {
                "title": "Attack of the Clones",
                "opening_crawl": "Blah blah blah",
                "director": "George Lucas",
                "producer": "Rick McCallum",
                "release_date": "2002-05-16"
              }
            ]
          }''', 200),
    );

    expect(await svc.getFilms(), isInstanceOf<List<Film>>());
  });

  test('Returns a list of characters if request is successful', () async {
    when(client.get('$baseUrl/people')).thenAnswer(
      (_) async => http.Response('''{
            "results": [
              {
                "name": "Luke Skywalker",
                "birth_year": "19BBY",
                "gender": "male",
                "height": "172",
                "eye_color": "blue"
              },
              {
                "name": "R2-D2",
                "birth_year": "33BBY",
                "gender": "n/a",
                "height": "96",
                "eye_color": "red"
              }
            ]
          }''', 200),
    );

    expect(await svc.getCharacters(), isInstanceOf<List<Character>>());
  });

  test('Returns a list of planets if request is successful', () async {
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
              },
              {
                "name": "Yavin IV",
                "climate": "temperate, tropical",
                "terrain": "jungle, rainforest",
                "diameter": "10200",
                "gravity": "1 standard",
                "population": "1000"
              }
            ]
          }''', 200),
    );

    expect(await svc.getPlanets(), isInstanceOf<List<Planet>>());
  });
}