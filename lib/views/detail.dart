import 'package:flutter/material.dart';
import 'package:zodiac_app/model/Zodiac.dart';
import 'package:zodiac_app/views/home.dart';

// ignore: must_be_immutable
class Detail extends StatelessWidget {
  final int selectedZodiacIndex;
  Zodiac selectedZodiac;

  Detail(this.selectedZodiacIndex);

  @override
  Widget build(BuildContext context) {
    selectedZodiac = Home.zodiacList[selectedZodiacIndex];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.deepOrange,
            expandedHeight: 250,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(selectedZodiac.name),
              centerTitle: true,
              background: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage("assets/images/${selectedZodiac.cover}"),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: content(context),
          )
        ],
      ),
    );
  }

  Widget content(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Text(
          selectedZodiac.name,
          style: Theme.of(context).textTheme.headline3,
          textAlign: TextAlign.center,
        ),
      ),
      Divider(
        indent: 100,
        endIndent: 100,
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: Text(
          selectedZodiac.date,
          style: TextStyle(fontSize: 20, color: Colors.blueGrey),
          textAlign: TextAlign.center,
        ),
      ),
      Divider(),
      Container(
        child: Column(
          children: [
            Text(
              selectedZodiac.about,
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    ]);
  }
}
