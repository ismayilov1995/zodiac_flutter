import 'package:zodiac_app/model/Zodiac.dart';

class AppData {
  final List<Zodiac> _zodiacts = List.generate(
      13, (index) => Zodiac("Zodiac $index", "20${index}2-19$index"));

  List<Zodiac> getZodiacts() {
    return _zodiacts;
  }

  Zodiac getZodiac(int zodiac) {
    return _zodiacts[zodiac];
  }
}
