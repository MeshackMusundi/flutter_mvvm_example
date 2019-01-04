import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_mvvm_example/interfaces/i_star_wars_api.dart';
import 'package:flutter_mvvm_example/models/character.dart';
import 'package:flutter_mvvm_example/models/film.dart';
import 'package:flutter_mvvm_example/models/planet.dart';

class SwapiService implements IStarWarsApi {
  final _baseUrl = 'https://swapi.co/api';
  http.Client _client = http.Client();

  set client(http.Client value) => _client = value;

  static final SwapiService _internal = SwapiService.internal();
  factory SwapiService() => _internal;
  SwapiService.internal();

  Future<List<Film>> getFilms() async {
    var response = await _client.get('$_baseUrl/films');

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      List<dynamic> filmsData = data['results'];
      List<Film> films = filmsData.map((f) => Film.fromMap(f)).toList();

      return films;
    } else {
      throw Exception('Failed to get data');
    }
  }

  Future<List<Character>> getCharacters() async {
    var response = await _client.get('$_baseUrl/people');

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      List<dynamic> charactersData = data['results'];
      List<Character> characters =
          charactersData.map((c) => Character.fromMap(c)).toList();

      return characters;
    } else {
      throw Exception('Failed to get data');
    }
  }

  Future<List<Planet>> getPlanets() async {
    var response = await _client.get('$_baseUrl/planets');

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      List<dynamic> planetsData = data['results'];
      List<Planet> planets = planetsData.map((p) => Planet.fromMap(p)).toList();

      return planets;
    } else {
      throw Exception('Failed to get data');
    }
  }
}