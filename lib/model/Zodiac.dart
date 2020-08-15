class Zodiac {
  String _name;
  String _date;
  String _about;
  String _avatar;
  String _cover;

  Zodiac(this._name, this._date, this._about, this._avatar, this._cover);

  @override
  String toString() {
    return "Selected $_name";
  }
}
