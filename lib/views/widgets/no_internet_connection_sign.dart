import 'package:flutter/material.dart';

class NoInternetConnectionSign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.block,
          color: Colors.grey,
          size: 40.0,
        ),
        Container(
          margin: const EdgeInsets.only(top: 5.0),
          child: Text(
            'Internet connection',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        )
      ],
    );
  }
}