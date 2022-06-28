import 'package:calculator/widgets/calc_button.dart';
import 'package:flutter/material.dart';

import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var userQuestion = '';
  var userAnswer = '';

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'ANS',
    '='
  ];

  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll("x", "*");
    finalQuestion = finalQuestion.replaceAll("%", "*0.01");

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }

  bool isOperator(String x) {
    bool isStrigEqual2 =
        x == '%' || x == '/' || x == "x" || x == '-' || x == '+' || x == '=';
    if (isStrigEqual2) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userQuestion,
                      style: const TextStyle(
                          fontSize: 30, color: Colors.deepPurple),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userAnswer,
                      style: const TextStyle(
                          fontSize: 30, color: Colors.deepPurple),
                    ),
                  )
                ],
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemCount: buttons.length,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return CalcButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    buttonText: buttons[index],
                    buttonTapped: () {
                      setState(() {
                        userAnswer = "";
                        userQuestion = "";
                      });
                    },
                  );
                }
                if (index == 1) {
                  return CalcButton(
                    color: Colors.red,
                    textColor: Colors.white,
                    buttonText: buttons[index],
                    buttonTapped: () {
                      setState(() {
                        userQuestion =
                            userQuestion.substring(0, userQuestion.length - 1);
                      });
                    },
                  );
                }
                if (index == buttons.length - 1) {
                  return CalcButton(
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    buttonText: buttons[index],
                    buttonTapped: () {
                      setState(() {
                        equalPressed();
                      });
                    },
                  );
                }
                return CalcButton(
                  color: isOperator(buttons[index])
                      ? Colors.deepPurple
                      : Colors.deepPurple[50]!,
                  textColor: isOperator(buttons[index])
                      ? Colors.white
                      : Colors.deepPurple,
                  buttonText: buttons[index],
                  buttonTapped: () {
                    setState(() {
                      userQuestion += buttons[index];
                    });
                  },
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Art By",
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8) + EdgeInsets.only(right: 12),
                  child: Image.asset(
                    'assets/clawsie_yeet.png',
                    height: 12,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
