import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int questionIndex = 0;
  void answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
    });
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var question = [
      "What's your favorite color?",
      "What's your favorite animal?",
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("hi"),
        ),
        body: Column(
          children: [
            Text(
              question[questionIndex],
            ),
            RaisedButton(child: Text("Answer1"), onPressed: answerQuestion),
            RaisedButton(
                child: Text("Answer2"),
                onPressed: () => print("answer 2 chosen")),
            RaisedButton(
                child: Text("Answer3"),
                onPressed: () {
                  print("answer 3 chosen");
                }),
            RaisedButton(child: Text("Answer4"), onPressed: answerQuestion),
          ],
        ),
      ),
    );
  }
}
