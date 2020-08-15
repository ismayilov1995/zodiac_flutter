import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Zodiac App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  // Dummy info
  final List<String> _zodiacList =
      List.generate(200, (index) => 'Zodiac $index');

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _zodiacList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: FlutterLogo(),
          );
        });
  }
}
