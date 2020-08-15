import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zodiac_app/model/Zodiac.dart';
import 'package:zodiac_app/utils/zodiac_data.dart';

class Home extends StatelessWidget {
  static List<Zodiac> zodiacList;

  @override
  Widget build(BuildContext context) {
    zodiacList = loadDataset();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Zodiac App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: HomeList(),
    );
  }

  List<Zodiac> loadDataset() {
    List<Zodiac> zodiacts = [];
    for (int i = 0; i < 12; i++) {
      String avatar =
          "${AppZodiacData.BURC_ADLARI[i].toLowerCase()}${i + 1}.png";
      String cover =
          "${AppZodiacData.BURC_ADLARI[i].toLowerCase()}_buyuk${i + 1}.png";
      String name = AppZodiacData.BURC_ADLARI[i];
      String date = AppZodiacData.BURC_TARIHLERI[i];
      String about = AppZodiacData.BURC_GENEL_OZELLIKLERI[i];
      Zodiac newZodiac = Zodiac(name, date, about, avatar, cover);
      zodiacts.add(newZodiac);
    }
    return zodiacts;
  }

  Widget HomeList() {
    return ListView.builder(
      itemCount: zodiacList.length,
      itemBuilder: (context, index) {
        return singleListItem(context, index);
      },
    );
  }

  Widget singleListItem(BuildContext context, int index) {
    Zodiac currentZodiac = zodiacList[index];
    return Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: ListTile(
        leading: Image.asset("assets/images/${currentZodiac.avatar}"),
        title: Text(
          currentZodiac.name,
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text(currentZodiac.date),
        trailing: Icon(Icons.arrow_right),
        onTap: () => Navigator.pushNamed(context, "/detail/$index"),
      ),
    );
  }
}
