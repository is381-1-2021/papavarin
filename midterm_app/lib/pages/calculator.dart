import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:midterm_app/controllers/calculator_controller.dart';
import 'package:midterm_app/services/calculator_services.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;
  final firestoreInstance = FirebaseFirestore.instance;

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      } else if (buttonText == "⌫") {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        equationFontSize = 38.0;
        resultFontSize = 48.0;

        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: BorderSide(
                  color: Colors.white, width: 1, style: BorderStyle.solid)),
          padding: EdgeInsets.all(16.0),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/15');
              },
              icon: Icon(Icons.history))
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              equation,
              style: TextStyle(fontSize: equationFontSize),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(
              result,
              style: TextStyle(fontSize: resultFontSize),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .74,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton("C", 1, Colors.blue),
                      buildButton("⌫", 1, Colors.blue),
                      buildButton("÷", 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton("7", 1, Colors.black87),
                      buildButton("8", 1, Colors.black87),
                      buildButton("9", 1, Colors.black87),
                    ]),
                    TableRow(children: [
                      buildButton("4", 1, Colors.black87),
                      buildButton("5", 1, Colors.black87),
                      buildButton("6", 1, Colors.black87),
                    ]),
                    TableRow(children: [
                      buildButton("1", 1, Colors.black87),
                      buildButton("2", 1, Colors.black87),
                      buildButton("3", 1, Colors.black87),
                    ]),
                    TableRow(children: [
                      buildButton(".", 1, Colors.black87),
                      buildButton("0", 1, Colors.black87),
                      buildButton("00", 1, Colors.black87),
                    ]),
                  ],
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Table(children: [
                    TableRow(children: [
                      buildButton("×", 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton("-", 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton("+", 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton("=", 1, Colors.blue),
                    ]),
                    TableRow(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              alignment: Alignment.center,
                              minimumSize: Size(50, 76),
                              primary: Colors.red[400],
                              textStyle: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold)),
                          child: Text("save😝"),
                          onPressed: () {
                            Map<String, dynamic> data = {
                              "equation + buttonText": equation,
                              "equation": result,
                            };
                            FirebaseFirestore.instance
                                .collection("peiing_calculator")
                                .add(data)
                                .then((value) =>
                                    print("New Calculator data added"));
                          },
                        ),
                      ],
                    )
                  ])),
            ],
          ),
        ],
      ),
    );
  }
}
