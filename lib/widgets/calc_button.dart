import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String buttonText;
  final buttonTapped;

  const CalcButton({
    Key? key,
    required this.color,
    required this.textColor,
    required this.buttonText,
    required this.buttonTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      chi
    );
  }
}
