import 'package:flutter/material.dart';

List<String> kSurveyEmoticonsTitle = ["AWFUL", "BAD", "OKAY", "GOOD", "GREAT"];
List<String> kSurveyEmoticons = [
  "awful_emoji.png",
  "bad_emoji.png",
  "okay_emoji.png",
  "good_emoji.png",
  "great_emoji.png"
];

List<List<Color>> kSurveyEmoticonsGradient = [
  [kAwfulMoodColorTop, kAwfulMoodColorBottom],
  [kBadMoodColorTop, kBadMoodColorBottom],
  [kOkayMoodColorTop, kOkayMoodColorBottom],
  [kGoodMoodColorTop, kGoodMoodColorBottom],
  [kGreatMoodColorTop, kGreatMoodColorBottom],
];

const kPrimaryColor = const Color(0xFFFCFCFC);
const kAwfulMoodColorTop = const Color(0xFFF0875D);
const kAwfulMoodColorBottom = const Color(0xFFCA5819);

const kBadMoodColorTop = const Color(0xFFF1A55E);
const kBadMoodColorBottom = const Color(0xFFBA5D0A);

const kOkayMoodColorTop = const Color(0xFFF5BC55);
const kOkayMoodColorBottom = const Color(0xFFD27F1A);

const kGoodMoodColorTop = const Color(0xFFF9DC80);
const kGoodMoodColorBottom = const Color(0xFFD69824);

const kGreatMoodColorTop = const Color(0xFFBFCE7D);
const kGreatMoodColorBottom = const Color(0xFF70AD60);
