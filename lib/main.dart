import 'package:flutter/material.dart';
import 'package:quizzlerapp/question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  // List<String> questions = [
  //   'YOU CAN LEAD A COW DOWNSTAIRS BUT NOT UPSTAIRS.',
  //   'APPROXIMATELY ONE QUARTER OF HUMAN BONES ARE IN LEGS.',
  //   'A SLUG\'S BLOOD IS GREEN.',
  //   'ASHISH IS A GOOD BOY',
  // ];
  // List<bool> answers = [false, true, true, false];
  //
  // Question q1 =
  //     Question(q: 'YOU CAN LEAD A COW DOWNSTAIRS BUT NOT UPSTAIRS.', a: false);
  List<Question> questionBank = [
    Question(q: 'YOU CAN LEAD A COW DOWNSTAIRS BUT NOT UPSTAIRS.', a: false),
    Question(
        q: 'APPROXIMATELY ONE QUARTER OF HUMAN BONES ARE IN LEGS.', a: true),
    Question(q: 'A SLUG\'S BLOOD IS GREEN.', a: true),
    Question(q: 'ASHISH IS A GOOD BOY', a: true),
  ];
  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.green,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                // The user picked true.
                bool correctAnswer =
                    questionBank[questionNumber].questionAnswer;
                if (correctAnswer == true) {
                  print('user got it right');
                } else {
                  print('the user got it wrong');
                }
                setState(() {
                  questionNumber++;
                });

                print(questionNumber);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.red,
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                // The user picked false.
                bool correctAnswer =
                    questionBank[questionNumber].questionAnswer;
                if (correctAnswer == true) {
                  print('user got it right');
                } else {
                  print('the user got it wrong');
                }
                setState(() {
                  questionNumber++;
                });
                print(questionNumber);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
