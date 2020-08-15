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
        margin: EdgeInsets.all(20),
        elevation: 10,
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
                style: Theme.of(context).textTheme.headline6,
              ),
            )
          ],
        ),
      ),
      Container(
        height: 300,
      )
    ];
  }
}
