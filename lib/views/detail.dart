import 'package:flutter/material.dart';
import 'package:zodiac_app/model/Zodiac.dart';

// ignore: must_be_immutable
class Detail extends StatelessWidget {
  final int selectedZodiac;
  Zodiac zodiac;

  Detail(this.selectedZodiac) {
//    this.zodiac = AppData().getZodiac(selectedZodiac);
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
          )
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
}
