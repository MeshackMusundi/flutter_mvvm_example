import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/views/pages/main_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter MVVM Demo',
      theme: new ThemeData(
        primaryColor: Color(0xff070707),        
        primaryColorLight: Color(0xff0a0a0a),
        primaryColorDark: Color(0xff000000),
      ),
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}