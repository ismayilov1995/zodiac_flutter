import 'package:flutter/material.dart';
import 'package:zodiac_app/model/Zodiac.dart';
import 'package:zodiac_app/views/home.dart';
import 'package:palette_generator/palette_generator.dart';

// ignore: must_be_immutable
class Detail extends StatefulWidget {
  final int selectedZodiacIndex;

  Detail(this.selectedZodiacIndex);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Zodiac selectedZodiac;
  Color appBarColor = Colors.deepOrange;
  PaletteGenerator paletteGenerator;

  @override
  void initState() {
    super.initState();
    selectedZodiac = Home.zodiacList[widget.selectedZodiacIndex];
    fetchAppBarColor();
  }

  void fetchAppBarColor() {
    Future<PaletteGenerator> generatedColor =
        PaletteGenerator.fromImageProvider(
            AssetImage("assets/images/${selectedZodiac.cover}"));
    generatedColor.then((value) {
      paletteGenerator = value;
      if (paletteGenerator.vibrantColor.color != null) {
        setState(() {
          appBarColor = paletteGenerator.vibrantColor.color;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: appBarColor,
            expandedHeight: 250,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(selectedZodiac.name),
              centerTitle: true,
              background: Image.asset(
                "assets/images/${selectedZodiac.cover}",
                fit: BoxFit.cover,
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
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
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
          Text(
            selectedZodiac.about,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ]),
      ),
    );
  }
}
