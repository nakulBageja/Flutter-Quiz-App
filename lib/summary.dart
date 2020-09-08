
import 'package:Assignment1_FlutterQuizApp/quiz.dart';
import 'package:flutter/material.dart';

class summary extends StatefulWidget {
  int resultCount;
  summary({Key key, @required this.resultCount}) : super(key: key);
  @override
  _summary createState() => _summary(resultCount);
}

class _summary extends State<summary> {
  int resultCount;
  _summary(this.resultCount); //taking in the result sent from quiz.dart
  String text = "";

  //assigning the text according to the marks achieved.
  @override
  void initState() {
    if (resultCount < 3) {
      text = " Your Score is $resultCount\nPlease try again!";
    } else if (resultCount == 3) {
      text = "Your Score is $resultCount\nGood Job!";
    } else if (resultCount == 4) {
      text = "Your Score is $resultCount\nExcellent Work";
    } else {
      text = "Your Score is $resultCount\nYou are a genius";
    }
    super.initState();
  }

  Widget button() {
    if (resultCount < 3) {
      return FlatButton(
        color: Colors.blue,
        textColor: Colors.white,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.all(8.0),
        splashColor: Colors.blue,
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Quiz(),
          ));
        },
        child: Text(
          "Re-Take the quiz",
          style: TextStyle(fontSize: 20.0),
        ),
      );
    } else {
      return Text(
        "Thank you for playing",
        style: TextStyle(fontSize: 20.0, fontFamily: "Quando"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Summary"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Material(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                        child: Text(
                      text,
                      style: TextStyle(fontSize: 20.0, fontFamily: "Quando"),
                    ))
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [button()],
            ),
          )
        ],
      ),
    );
  }
}
