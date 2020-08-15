import 'package:flutter/material.dart';
import 'package:zodiac_app/views/about.dart';
import 'package:zodiac_app/views/detail.dart';
import 'package:zodiac_app/views/home.dart';

class AppNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepOrange, accentColor: Colors.orangeAccent),
      title: "Zodiac App",
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: {
//        '/': (ctx) => Home(),
        '/about': (ctx) => About(),
      },
      onGenerateRoute: (settings) {
        List<String> paths = settings.name.split("/");
        if (paths[1] == "detail") {
          return MaterialPageRoute(
            builder: (context) => Detail(int.parse(paths[2])),
          );
        }
        return null;
      },
    );
  }
}
