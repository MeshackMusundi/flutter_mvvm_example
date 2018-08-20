import 'dart:async';
import 'package:flutter_mvvm_example/models/character.dart';
import 'package:flutter_mvvm_example/models/film.dart';
import 'package:flutter_mvvm_example/models/planet.dart';

abstract class IStarWarsApi {
  Future<List<Film>> getFilms();
  Future<List<Character>> getCharacters();
  Future<List<Planet>> getPlanets();
}