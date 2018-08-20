import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_mvvm_example/interfaces/i_star_wars_api.dart';
import 'package:flutter_mvvm_example/models/character.dart';
import 'package:flutter_mvvm_example/models/film.dart';
import 'package:flutter_mvvm_example/models/planet.dart';

class Swapi implements IStarWarsApi {
  final _baseUrl = 'https://swapi.co/api';

  Future<dynamic> _getData(String url) async {
    var response = await http.get(url);
    var data = json.decode(response.body);
    return data;
  }

  Future<List<Film>> getFilms() async {
    var data = await _getData('$_baseUrl/films');
    List<dynamic> filmsData = data['results'];

    List<Film> films = filmsData
        .map((fl) => Film(
              title: fl['title'],
              openingCrawl: fl['opening_crawl'],
              director: fl['director'],
              producer: fl['producer'],
              releaseDate: DateTime.parse(fl['release_date']),
            ))
        .toList();

    return films;
  }

  Future<List<Character>> getCharacters() async {
    var data = await _getData('$_baseUrl/people');

    List<dynamic> charactersData = data['results'];

    List<Character> characters = charactersData
        .map((ch) => Character(
              name: ch['name'],
              birthYear: ch['birth_year'],
              gender: ch['gender'],
              height: int.parse(ch['height']),
              eyeColor: ch['eye_color'],
            ))
        .toList();

    return characters;
  }

  Future<List<Planet>> getPlanets() async {
    var data = await _getData('$_baseUrl/planets');

    List<dynamic> planetsData = data['results'];

    List<Planet> planets = planetsData
        .map((pl) => Planet(
              name: pl['name'],
              climate: pl['climate'],
              terrain: pl['terrain'],
              diameter: int.parse(pl['diameter']),
              gravity: pl['gravity'],
              population: pl['population'],
            ))
        .toList();

    return planets;
  }
}