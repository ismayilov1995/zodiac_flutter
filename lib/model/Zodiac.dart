class Zodiac {
  String _name;
  String _date;
  String _about;
  String _avatar;
  String _cover;

  Zodiac(this._name, this._date, this._about, this._avatar, this._cover);

  @override
  String toString() {
    return "Selected $name";
  }

  String get name => _name;

  // ignore: unnecessary_getters_setters
  String get cover => _cover;

  // ignore: unnecessary_getters_setters
  set cover(String value) {
    _cover = value;
  }

  // ignore: unnecessary_getters_setters
  String get avatar => _avatar;

  // ignore: unnecessary_getters_setters
  set avatar(String value) {
    _avatar = value;
  }

  // ignore: unnecessary_getters_setters
  String get about => _about;

  // ignore: unnecessary_getters_setters
  set about(String value) {
    _about = value;
  }

  // ignore: unnecessary_getters_setters
  String get date => _date;

  // ignore: unnecessary_getters_setters
  set date(String value) {
    _date = value;
  }
}
