import 'package:flutter/material.dart';
import 'package:quiz_with_firebase/screens/AnswerList.dart';
import 'package:quiz_with_firebase/screens/MainScreen.dart';
import 'package:quiz_with_firebase/screens/WelcomeScreen.dart';
import 'package:quiz_with_firebase/services/question.dart';

class Result extends StatefulWidget {
  Result({required this.result, required this.count});
  final String result;
  final int count;

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  Answer answer = Answer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0b1032),
        actions: [
          //AnswerList Button
          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AnswerList();
                }));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.article,
                  size: 30,
                ),
              )),
          //restart quiz button
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MainScreen();
              }));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.settings_backup_restore,
                size: 40,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 20, top: 45),
                child: Text(
                  "RESULT",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 40.0,
                    letterSpacing: 3,
                    fontFamily: 'ViaodaLibre',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xff0b1032),
                ),
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: Text(
                        'Score :${widget.result}/50',
                        style: TextStyle(
                            fontSize: 50.0,
                            color: Colors.green,
                            fontFamily: 'ViaodaLibre'),
                      ),
                    ),
                    Text('${answer.yourPerformance(widget.count)}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.blue[100],
                        )),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return WelcomeScreen();
                          }));
                        },
                        child: Text(
                          'BACK',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.amberAccent,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}










// Text(
//                 '${widget.result}',
//                 style: TextStyle(fontSize: 50.0),
//               ),










// TextButton(
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                     return MainScreen();
//                   }));
//                 },
//                 child: Text(
//                   'Re Try',
//                   style: TextStyle(
//                     fontSize: 30,
//                     color: Colors.amberAccent,
//                   ),
//                 ),
//               ),