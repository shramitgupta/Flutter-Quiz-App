import 'package:flutter/material.dart';
import 'package:learning_flutter/result.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': "What's your favorite color?",
      'answers': [
        {'Text': 'Black', 'score': 10},
        {'Text': 'Red', 'score': 5},
        {'Text': 'Green', 'score': 3},
        {'Text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': "What's your favorite animal?",
      'answers': [
        {'Text': 'Rabbit', 'score': 3},
        {'Text': 'Snake', 'score': 11},
        {'Text': 'Elephant', 'score': 5},
        {'Text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': "What's your favorite instructor?",
      'answers': [
        {'Text': 'Max', 'score': 1},
        {'Text': 'Max', 'score': 1},
        {'Text': 'Max', 'score': 1},
        {'Text': 'Max', 'score': 1},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("We have more question!");
    } else {
      print("No more questions!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("My First App"),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions)
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
