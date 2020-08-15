import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zodiac_app/data/app_data.dart';
import 'package:zodiac_app/model/Zodiac.dart';
import 'package:zodiac_app/utils/zodiac_data.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Zodiac> _zodiacList = loadDataset();
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

  List<Zodiac> loadDataset() {
    List<Zodiac> zodiacts = [];
    for (int i = 0; i < 12; i++) {
      String avatar =
          "${AppZodiacData.BURC_ADLARI[i].toLowerCase()}${i + 1}.png";
      String cover =
          "${AppZodiacData.BURC_ADLARI[i].toLowerCase()}_buyuk${i + 1}.png";
      String name = AppZodiacData.APP_NAME[i];
      String date = AppZodiacData.BURC_TARIHLERI[i];
      String about = AppZodiacData.BURC_GENEL_OZELLIKLERI[i];
      Zodiac newZodiac = Zodiac(name, date, about, avatar, cover);
      zodiacts.add(newZodiac);
    }
    return zodiacts;
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: ListTile(
//              leading: Image.asset(),
//              title: Text(),
//              subtitle: Text(),
              trailing: Icon(Icons.arrow_right),
              onTap: () => Navigator.pushNamed(context, "/detail/$index"),
            ),
          );
        });
  }
}
