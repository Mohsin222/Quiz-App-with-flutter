import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_with_firebase/constant.dart';
import 'package:quiz_with_firebase/screens/Result.dart';

import 'package:quiz_with_firebase/services/question.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Icon> scoreKeeper = [];
  int qNum = 0;

  int aNum = 0;
  int count = 0;
  late Timer timer;
  int start = 5;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        if (start > 0) {
          start--;
          if (start == 0) {
            scoreKeeper.add(Icon(
              Icons.highlight_off,
              color: Colors.redAccent,
            ));
            updateQuestion();
          }
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void stop() {
    print(count);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Result(
        result: count.toString(),
        count: count,
      );
    }));
  }

  void updateQuestion() {
    if (qNum < question.length - 1) {
      setState(() {
        qNum++;
        aNum++;
        start = 5;
        startTimer();
      });
    } else if (qNum == question.length - 1) {
      stop();
    } else {}
  }

  void ans1() {
    if (question[qNum][1] == answer[aNum][0]) {
      print("1 true");
      count += 5;
      scoreKeeper.add(Icon(
        Icons.check_circle_outline,
        color: Colors.green,
      ));
    } else {
      print("fales");
      scoreKeeper.add(Icon(
        Icons.highlight_off,
        color: Colors.redAccent,
      ));
    }
  }

  void ans2() {
    if (question[qNum][1] == answer[aNum][1]) {
      print("2 true");
      count += 5;
      scoreKeeper.add(Icon(
        Icons.check_circle_outline,
        color: Colors.green,
      ));
    } else {
      print("fales");
      scoreKeeper.add(Icon(
        Icons.highlight_off,
        color: Colors.redAccent,
      ));
    }
  }

  void ans3() {
    if (question[qNum][1] == answer[aNum][2]) {
      count += 5;
      print("3 true");
      scoreKeeper.add(Icon(
        Icons.check_circle_outline,
        color: Colors.green,
      ));
    } else {
      print("fales");
      count += 5;
      scoreKeeper.add(Icon(
        Icons.highlight_off,
        color: Colors.redAccent,
      ));
    }
  }

  void ans4() {
    if (question[qNum][1] == answer[aNum][3]) {
      print("4 true");
      scoreKeeper.add(Icon(
        Icons.check_circle_outline,
        color: Colors.green,
      ));
    } else {
      print("fales");
      scoreKeeper.add(Icon(
        Icons.highlight_off,
        color: Colors.redAccent,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0b1032),
      // backgroundColor: Colors.grey[850],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.indigo[50],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0))),
              alignment: Alignment.center,
              child: Material(
                elevation: 10,
                color: Colors.white,
                // borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
                child: Text(
                  question[qNum][0],
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
            )),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        color: Colors.pinkAccent[700],
                        child: TextButton(
                            onPressed: () {
                              ans1();
                              timer.cancel();
                              updateQuestion();
                            },
                            child: Text(
                              answer[aNum][0],
                              style: buttonStyle,
                            )),
                      ),
                      //second button
                      Material(
                        elevation: 10,
                        color: Colors.pinkAccent[700],
                        child: TextButton(
                            onPressed: () {
                              ans2();
                              timer.cancel();
                              updateQuestion();
                            },
                            child: Text(
                              answer[aNum][1],
                              style: buttonStyle,
                            )),
                      ),
                      //third button
                      Material(
                        elevation: 10,
                        color: Colors.pinkAccent[700],
                        child: TextButton(
                            onPressed: () {
                              ans3();
                              timer.cancel();
                              updateQuestion();
                            },
                            child: Text(
                              answer[aNum][2],
                              style: buttonStyle,
                            )),
                      ),
                      //fourth button
                      Material(
                        elevation: 10,
                        color: Colors.pinkAccent[700],
                        child: TextButton(
                            onPressed: () {
                              ans4();
                              timer.cancel();
                              updateQuestion();
                            },
                            child: Text(
                              answer[aNum][3],
                              style: buttonStyle,
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Score : $count',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '$start',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )),
            Wrap(
              children: scoreKeeper,
            )
          ],
        ),
      ),
    );
  }
}
