import 'package:flutter/material.dart';
import 'package:quiz_with_firebase/services/question.dart';

class AnswerList extends StatelessWidget {
  const AnswerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          "Answer List",
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xff0b1032),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: question.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  '${index + 1})      ${question[index][1]}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
