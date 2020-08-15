import 'package:flutter/material.dart';
import 'package:zodiac_app/data/app_data.dart';
import 'package:zodiac_app/model/Zodiac.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Zodiac App",
              style: TextStyle(color: Colors.white),
            ),
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () => Navigator.pushNamed(context, '/about'),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(0, 2), blurRadius: 6)
                ],
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.deepOrange[800],
                      Colors.orange,
                    ]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.white,
                  ),
                  Text(
                    "Ismayil Ismayilov",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.more_horiz),
              title: Text("Properties"),
            ),
            ListTile(
              leading: Icon(Icons.wifi),
              title: Text("Wifi"),
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text("About"),
              onTap: () => Navigator.pushNamed(context, '/about'),
            ),
          ],
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
