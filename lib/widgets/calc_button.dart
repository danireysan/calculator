import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String buttonText;
  final Function() buttonTapped;

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
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: textColor, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
