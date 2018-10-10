import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_mvvm_example/interfaces/i_star_wars_api.dart';
import 'package:flutter_mvvm_example/models/character.dart';
import 'package:flutter_mvvm_example/models/film.dart';
import 'package:flutter_mvvm_example/models/planet.dart';

class SwapiService implements IStarWarsApi {
  final _baseUrl = 'https://swapi.co/api';

  static final SwapiService _internal = SwapiService.internal();
  factory SwapiService () => _internal;
  SwapiService.internal();

  Future<dynamic> _getData(String url) async {
    var response = await http.get(url);
    var data = json.decode(response.body);
    return data;
  }

  Future<List<Film>> getFilms() async {
    var data = await _getData('$_baseUrl/films');
    List<dynamic> filmsData = data['results'];
    List<Film> films = filmsData.map((f) => Film.fromMap(f)).toList();

    return films;
  }

  Future<List<Character>> getCharacters() async {
    var data = await _getData('$_baseUrl/people');
    List<dynamic> charactersData = data['results'];
    List<Character> characters =
        charactersData.map((c) => Character.fromMap(c)).toList();

    return characters;
  }

  Future<List<Planet>> getPlanets() async {
    var data = await _getData('$_baseUrl/planets');
    List<dynamic> planetsData = data['results'];
    List<Planet> planets = planetsData.map((p) => Planet.fromMap(p)).toList();

    return planets;
  }
}