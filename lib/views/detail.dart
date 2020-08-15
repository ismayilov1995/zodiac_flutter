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
      body: Container(
        color: Colors.teal[50],
        child: CustomScrollView(
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
      ),
    );
  }

  List<Widget> content(BuildContext context) {
    return [
      Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              zodiac.name,
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            ),
            Text(
              zodiac.date,
              style: TextStyle(fontSize: 20, color: Colors.blueGrey),
              textAlign: TextAlign.center,
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                zodiac.about,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            )
          ],
        ),
      ),
      Container(
        height: 120,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(zodiac.avatar),
                fit: BoxFit.fitHeight,
                colorFilter:
                    ColorFilter.mode(Colors.teal[50], BlendMode.overlay))),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Powered by",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w100,
                color: Colors.brown,
              ),
            ),
            FlutterLogo(
              style: FlutterLogoStyle.horizontal,
              size: 120,
              colors: Colors.brown,
            )
          ],
        ),
      ),
      Container(
        height: 200,
      )
    ];
  }
}
