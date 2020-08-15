import 'package:flutter/material.dart';
import 'package:zodiac_app/data/app_data.dart';
import 'package:zodiac_app/model/Zodiac.dart';

// ignore: must_be_immutable
class Detail extends StatelessWidget {
  final int selectedZodiac;
  Zodiac zodiac;

  Detail(this.selectedZodiac) {
    this.zodiac = AppData().getZodiac(selectedZodiac);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.deepOrange,
            expandedHeight: 250,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(zodiac.name),
              centerTitle: true,
              background: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(zodiac.cover), fit: BoxFit.cover)),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(content(context)),
          ),
        ],
      ),
    );
  }

  List<Widget> content(BuildContext context) {
    return [
      Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Text(
          zodiac.name,
          style: Theme.of(context).textTheme.headline3,
          textAlign: TextAlign.center,
        ),
      ),
      Divider(
        indent: 100,
        endIndent: 100,
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Text(
          zodiac.date,
          style: TextStyle(fontSize: 20, color: Colors.blueGrey),
          textAlign: TextAlign.center,
        ),
      ),
      Divider(),
      Container(
        child: Column(
          children: [
            Text(
              zodiac.about,
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
      Container(
        height: 300,
      )
    ];
  }

  List<Widget> staticListItems() {
    return [
      Container(
        height: 100,
        color: Colors.red[100],
        child: FlutterLogo(
          colors: Colors.orange,
          style: FlutterLogoStyle.horizontal,
          textColor: Colors.indigo,
        ),
      ),
      Container(
        height: 100,
        color: Colors.red[200],
        child: FlutterLogo(
          colors: Colors.orange,
          style: FlutterLogoStyle.horizontal,
          textColor: Colors.indigo,
        ),
      ),
      Container(
        height: 100,
        color: Colors.red[300],
        child: FlutterLogo(
          colors: Colors.orange,
          style: FlutterLogoStyle.horizontal,
          textColor: Colors.indigo,
        ),
      ),
      Container(
        height: 100,
        color: Colors.red[400],
        child: FlutterLogo(
          colors: Colors.orange,
          style: FlutterLogoStyle.horizontal,
          textColor: Colors.indigo,
        ),
      ),
      Container(
        height: 100,
        color: Colors.red[500],
        child: FlutterLogo(
          colors: Colors.grey,
          style: FlutterLogoStyle.horizontal,
          textColor: Colors.grey[50],
        ),
      ),
      Container(
        height: 100,
        color: Colors.red[600],
        child: FlutterLogo(
          colors: Colors.yellow,
          style: FlutterLogoStyle.horizontal,
          textColor: Colors.yellow,
        ),
      ),
      Container(
        height: 100,
        color: Colors.blue[600],
        child: FlutterLogo(
          colors: Colors.yellow,
          style: FlutterLogoStyle.horizontal,
          textColor: Colors.white,
        ),
      ),
    ];
  }
}
