import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'About',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}