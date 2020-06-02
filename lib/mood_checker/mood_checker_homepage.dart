import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'build_survey.dart';
import 'constants.dart';

class BeautifulMoodChecker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BuildUserGreetingWidget(),
                BuildUserSurvey(),
                BuildGreyPlaceHolder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuildGreyPlaceHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 500,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.withOpacity(0.5)),
      ),
    );
  }
}

class BuildUserGreetingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 32, 0, 0),
      child: Text(
        "Hello There!",
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
      ),
    );
  }
}
