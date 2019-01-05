import 'package:flutter_mvvm_example/interfaces/i_star_wars_api.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}
class MockSwapiService extends Mock implements IStarWarsApi {}