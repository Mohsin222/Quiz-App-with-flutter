import 'package:flutter/material.dart';
import 'package:quiz_with_firebase/constant.dart';
import 'package:quiz_with_firebase/screens/MainScreen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          _onBasicAlertPressed(context);
        },
        child: Icon(Icons.description),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xff0b1032)),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DefaultTextStyle(
              style: TextStyle(
                fontSize: 80.0,
                letterSpacing: 3,
                fontFamily: 'ViaodaLibre',
                fontWeight: FontWeight.bold,
              ),
              child: AnimatedTextKit(animatedTexts: [
                TypewriterAnimatedText(
                  'PLAY',
                ),
              ]),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              color: Colors.pink[700],
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MainScreen();
                  }));
                },
                child: Text(
                  'PLAY',
                  style: buttonStyle,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

_onBasicAlertPressed(context) {
  Alert(
    context: context,
    title: "Quiz",
    desc: "Quiz consit of 50 marks each question contain 5 marks.",
  ).show();
}
