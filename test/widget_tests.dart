import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/mocks/mocks.dart';
import 'package:flutter_mvvm_example/models/character.dart';
import 'package:flutter_mvvm_example/models/film.dart';
import 'package:flutter_mvvm_example/models/planet.dart';
import 'package:flutter_mvvm_example/view_models/main_page_view_model.dart';
import 'package:flutter_mvvm_example/views/pages/main_page.dart';
import 'package:flutter_mvvm_example/views/widgets/characters_list_item.dart';
import 'package:flutter_mvvm_example/views/widgets/films_list_item.dart';
import 'package:flutter_mvvm_example/views/widgets/no_internet_connection.dart';
import 'package:flutter_mvvm_example/views/widgets/planets_list_item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mockito/mockito.dart';

void main() {
  final MockSwapiService svc = MockSwapiService();
  final MainPageViewModel vm = MainPageViewModel(apiSvc: svc);
  final MaterialApp app = MaterialApp(home: MainPage(viewModel: vm));

  testWidgets('Render list of films', (WidgetTester tester) async {
    when(svc.getFilms()).thenAnswer((_) {
      List<Film> films = List<Film>();
      films.add(Film()
        ..title = 'A New Hope'
        ..director = 'George Lucas');
      films.add(Film()
        ..title = 'Attack of the Clones'
        ..director = 'George Lucas');

      return Future.value(films);
    });

    await tester.pumpWidget(app);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pump(Duration(seconds: 5));

    expect(find.byType(FilmsListItem), findsNWidgets(2));
  }); 

  testWidgets('Render list of characters', (WidgetTester tester) async {
    when(svc.getCharacters()).thenAnswer((_) {
      List<Character> characters = List<Character>();
      characters.add(Character()
        ..name = 'Luke Skywalker'
        ..gender = 'male'
        ..birthYear = '19BBY');
      characters.add(Character()
        ..name = 'Leia Organa'
        ..gender = 'female'
        ..birthYear = '19BBY');

      return Future.value(characters);
    });

    await tester.pumpWidget(app);
    await tester.tap(find.widgetWithIcon(Tab, FontAwesomeIcons.users));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pumpAndSettle(Duration(seconds: 5));

    expect(find.byType(CharactersListItem), findsNWidgets(2));
  });

  testWidgets('Render list of planets', (WidgetTester tester) async {
    when(svc.getPlanets()).thenAnswer((_) {
      List<Planet> planets = List<Planet>();
      planets.add(Planet()
        ..name = 'Home'
        ..population = '1234');
      planets.add(Planet()
        ..name = 'Not home'
        ..population = '1234');

      return Future.value(planets);
    });

    await tester.pumpWidget(app);
    await tester.tap(find.widgetWithIcon(Tab, FontAwesomeIcons.globeAmericas));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pumpAndSettle(Duration(seconds: 5));

    expect(find.byType(PlanetsListItem), findsNWidgets(2));
  });

  testWidgets('Renders films tab error widget', (WidgetTester tester) async {
    when(svc.getFilms()).thenAnswer((_) {
      return Future.error(Exception);
    });

    await tester.pumpWidget(app);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pump(Duration(seconds: 5));

    expect(find.byType(NoInternetConnection), findsOneWidget);
  });
}