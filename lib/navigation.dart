import 'package:flutter/material.dart';
import 'package:zodiac_app/views/detail.dart';
import 'package:zodiac_app/views/home.dart';

class AppNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Zodiac App",
      routes: {
        '/': (ctx) => Home(),
        '/detail': (ctx) => Detail(),
      },
    );
  }
}
