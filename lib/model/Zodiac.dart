class Zodiac {
  String name;
  String date;
  String about;
  String avatar;
  String cover;

  Zodiac(this.name, this.date) {
    this.avatar = 'assets/images/logo.png';
    this.about =
        "Commit: 478fd6777ac5bc8bbc82cbf540874d1b6b316acd [478fd67]\nParents: 3111527bac\nAuthor: ismayilov1995 <ismayilov1995@gmail.com>\nDate: 13 avqust 2020, cümə axşamı 18:50:05\nCommitter: ismayilov1995\nCommit: 478fd6777ac5bc8bbc82cbf540874d1b6b316acd [478fd67]\nParents: 3111527bac\nAuthor: ismayilov1995 <ismayilov1995@gmail.com>\nDate: 13 avqust 2020, cümə axşamı 18:50:05\nCommitter: ismayilov1995";
  }

  @override
  String toString() {
    return "Selected $name";
  }
}
