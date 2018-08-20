import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/utils/swapi.dart';
import 'package:flutter_mvvm_example/view_models/main_page_view_model.dart';
import 'package:flutter_mvvm_example/views/widgets/characters_panel.dart';
import 'package:flutter_mvvm_example/views/widgets/films_panel.dart';
import 'package:flutter_mvvm_example/views/widgets/planets_panel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  MainPageViewModel model;
  TabController tabController;

  @override
  void initState() {
    super.initState();
    model = MainPageViewModel(api: Swapi());
    tabController = TabController(vsync: this, length: 3);
    loadData();
  }

  Future loadData() async {
    await model.fetchFilms();
    await model.fetchCharacters();
    await model.fetchPlanets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Star Wars',
          style: TextStyle(
            fontFamily: 'Distant Galaxy',
          ),
        ),
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 3.0,
          tabs: <Widget>[
            Tab(icon: Icon(FontAwesomeIcons.film)),
            Tab(icon: Icon(FontAwesomeIcons.users)),
            Tab(icon: Icon(FontAwesomeIcons.globeAmericas))
          ],
        ),
      ),
      body: ScopedModel<MainPageViewModel>(
        model: model,
        child: TabBarView(
          controller: tabController,
          children: <Widget>[
            FilmsPanel(),
            CharactersPanel(),
            PlanetsPanel(),
          ],
        ),
      ),
      floatingActionButton: ScopedModel<MainPageViewModel>(
        model: model,
        child: refreshButton(),
      ),
    );
  }

  Widget refreshButton() {
    return ScopedModelDescendant<MainPageViewModel>(
      builder: (context, child, model) {
        if (model.noInternetConnection == false) 
        return Container(width: 0.0, height: 0.0,);

        return FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColorLight,
          child: Icon(Icons.refresh),
          onPressed: () => loadData(),
        );
      },
    );
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }
}