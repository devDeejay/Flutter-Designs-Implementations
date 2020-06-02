import 'package:flutter/material.dart';
import 'constants.dart';

class BuildUserSurvey extends StatefulWidget {
  @override
  _BuildUserSurveyState createState() => _BuildUserSurveyState();
}

class _BuildUserSurveyState extends State<BuildUserSurvey> {
  List<String> listOfQuestions = [
    "How are you feeling today?",
    "How do you feel about Lockdown?",
    "How do you feel about your daily worksouts?"
  ];
  String currentQuestion;
  int currentQuestionIndex = 0;
  int emotionValue = 3;

  @override
  Widget build(BuildContext context) {
    currentQuestion = listOfQuestions[currentQuestionIndex];

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTeamNameWidget(),
          buildQuestionTextWidget(),
          buildEmojiInputWidget(context)
        ],
      ),
    );
  }

  Padding buildQuestionTextWidget() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
      child: Text(
        currentQuestion,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
      ),
    );
  }

  Text buildTeamNameWidget() {
    return Text(
      "Your daily checkup",
      style: TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.5)),
    );
  }

  Widget buildEmojiInputWidget(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: new LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kSurveyEmoticonsGradient[emotionValue - 1][0],
              kSurveyEmoticonsGradient[emotionValue - 1][1]
            ],
          )),
      child: Column(
        children: [
          buildEmotionWidget(),
          buildSlidingInputBar(),
          buildBottomBar()
        ],
      ),
    );
  }

  Widget buildEmotionWidget() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: AnimatedEmotionTextWidget(emotionValue),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 72),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(),
              child: BuildAnimatedSmileyImage(emotionValue),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSlidingInputBar() {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Colors.white,
        inactiveTrackColor: Colors.white.withOpacity(0.4),
        trackShape: RectangularSliderTrackShape(),
        trackHeight: 4.0,
        thumbColor: Colors.white,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
        overlayColor: Colors.white.withAlpha(32),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 32.0),
      ),
      child: Slider(
        max: 5,
        min: 1,
        value: emotionValue.toDouble(),
        onChanged: (value) {
          setState(() {
            emotionValue = value.toInt();
          });
        },
      ),
    );
  }

  Widget buildBottomBar() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.1),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(
                "I'm feeling ${kSurveyEmoticonsTitle[emotionValue - 1].toLowerCase()}",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.w700),
              ),
            ),
            FlatButton(
              onPressed: () {
                if (!isLastQuestion()) {
                  setState(() {
                    currentQuestionIndex++;
                    emotionValue = 3;
                  });
                }
              },
              color: Colors.white.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(56)),
              child: Text(
                isLastQuestion() ? "SUBMIT" : "NEXT",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool isLastQuestion() => currentQuestionIndex == listOfQuestions.length - 1;
}

class BuildAnimatedSmileyImage extends StatefulWidget {
  final int emotionValue;

  BuildAnimatedSmileyImage(this.emotionValue);

  @override
  _BuildAnimatedSmileyImageState createState() =>
      _BuildAnimatedSmileyImageState();
}

class _BuildAnimatedSmileyImageState extends State<BuildAnimatedSmileyImage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Transform(
          transform: Matrix4.translationValues(
              animation.value * MediaQuery.of(context).size.width, 0.0, 0.0),
          child: Image.asset(
            "assets/images/quiz_emoji/${kSurveyEmoticons[widget.emotionValue - 1]}",
            width: 120,
            height: 120,
          ),
        );
      },
    );
  }
}

class AnimatedEmotionTextWidget extends StatefulWidget {
  final int emotionValue;

  AnimatedEmotionTextWidget(this.emotionValue);

  @override
  _AnimatedEmotionTextWidgetState createState() =>
      _AnimatedEmotionTextWidgetState();
}

class _AnimatedEmotionTextWidgetState extends State<AnimatedEmotionTextWidget>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));

    animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    animationController.reset();
    animationController.forward();

    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Transform(
            transform: Matrix4.translationValues(0.0, 0.0, 0.0),
            child: Container(
              child: Text(
                kSurveyEmoticonsTitle[widget.emotionValue - 1],
                style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3,
                    color: Colors.white.withOpacity(0.2)),
                textAlign: TextAlign.center,
              ),
            ),
          );
        });
  }
}
