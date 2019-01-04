import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/services/swapi_service.dart';
import 'package:flutter_mvvm_example/view_models/main_page_view_model.dart';
import 'package:flutter_mvvm_example/views/pages/main_page.dart';

final MainPageViewModel mainPageVM = MainPageViewModel(apiSvc: SwapiService());

void main() => runApp(MvvmApp(mainPageVM: mainPageVM));

class MvvmApp extends StatelessWidget {
  final MainPageViewModel mainPageVM;

  MvvmApp({@required this.mainPageVM});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter MVVM Demo',
      theme: new ThemeData(
        primaryColor: Color(0xff070707),        
        primaryColorLight: Color(0xff0a0a0a),
        primaryColorDark: Color(0xff000000),
      ),
      home: MainPage(viewModel: mainPageVM),
      debugShowCheckedModeBanner: false,
    );
  }
}