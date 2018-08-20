import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/models/film.dart';
import 'package:flutter_mvvm_example/utils/star_wars_styles.dart';

class FilmsListItem extends StatelessWidget {
  final Film film;

  FilmsListItem({@required this.film});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          title: _title(),
          subtitle: _subTitle(),
        ),
        Divider(),
      ],
    );
  }

  Widget _title() {
    return Text(
      film?.title,
      style: TextStyle(
        color: StarWarsStyles.titleColor,
        fontWeight: FontWeight.bold,
        fontSize: StarWarsStyles.titleFontSize,
      ),
    );
  }

  Widget _subTitle() {
    return Row(
      children: <Widget>[
        Icon(
          Icons.movie,
          color: StarWarsStyles.subTitleColor,
          size: StarWarsStyles.subTitleFontSize,
        ),
        Container(
          margin: const EdgeInsets.only(left: 4.0),
          child: Text(
            film?.director,
            style: TextStyle(
              color: StarWarsStyles.subTitleColor,
            ),
          ),
        ),
      ],
    );
  }  
}