import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zodiac_app/data/app_data.dart';
import 'package:zodiac_app/model/Zodiac.dart';

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
  final List<Zodiac> _zodiacList = AppData().getZodiacts();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _zodiacList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: ListTile(
              leading: Image.asset(_zodiacList[index].avatar),
              title: Text(_zodiacList[index].name),
              subtitle: Text(_zodiacList[index].date),
              trailing: Icon(Icons.arrow_right),
              onTap: () => Navigator.pushNamed(context, "/detail/$index"),
            ),
          );
        });
  }
}
