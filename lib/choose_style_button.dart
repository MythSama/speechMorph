import 'package:flutter/material.dart';

class ChooseStyleButtonWidget extends StatefulWidget {
  ChooseStyleButtonWidget({Key key}) : super(key : key);

  @override
  ChooseStyleButtonState createState() => ChooseStyleButtonState();
}

class ChooseStyleButtonState extends State<ChooseStyleButtonWidget> {

  ChoiceOfSpeechStyle selectedChoice = choices[0];

  @override
  Widget build(BuildContext context) {
    return new Column (
      children: <Widget>[
        new Row(
          children: <Widget>[
            new Icon(Icons.person),
            Text('Speech Style',
            style: TextStyle(fontSize: 30.0)
            ),
            PopupMenuButton<ChoiceOfSpeechStyle> (
              initialValue: choices[0],
              onCanceled: () => print("You didn't choose anything"),
              onSelected: choiceAction,
              itemBuilder: (BuildContext context) {
                return choices.map((ChoiceOfSpeechStyle choice) {
                  return new PopupMenuItem<ChoiceOfSpeechStyle>(
                    value: choice,
                    child: new Text(choice.title),
                  );
                }).toList();
              },
            ),
          ],
        ),
      ],
    );
  }

  void choiceAction(ChoiceOfSpeechStyle choice) {
    setState(() {
      selectedChoice = choice;//some changes
      });
  }
}

class ChoiceOfSpeechStyle {
  ChoiceOfSpeechStyle({this.title});
  String title;
}

List<ChoiceOfSpeechStyle> choices = <ChoiceOfSpeechStyle> [
  new ChoiceOfSpeechStyle(title: 'Trump'),
  new ChoiceOfSpeechStyle(title: 'Hillary'),
];