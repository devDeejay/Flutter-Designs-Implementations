import 'package:flutter/material.dart';

import 'mood_checker/constants.dart';
import 'mood_checker/mood_checker_homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Designs Portfolio app by DJ',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Poppins'),
      home: BeautifulMoodChecker(),
    );
  }
}
