import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_mvvm_example/interfaces/i_star_wars_api.dart';
import 'package:flutter_mvvm_example/utils/swapi.dart';

void main() {
  IStarWarsApi swapi = Swapi();

  test(
    'Films GET request test',
    () async {
      var data = await swapi.getFilms();
      expect(data.length, 7);
    },
  );

  test(
    'Characters GET request test',
    () async {      
      var data = await swapi.getCharacters();
      expect(data.length, 10);
    },
  );

  test(
    'Planets GET request test',
    () async {      
      var data = await swapi.getPlanets();
      expect(data.length, 10);
    },
  );
}