import 'package:flutter/material.dart';

class BottomGoToWidget extends StatelessWidget {
  final String text;
  final String buttom;
  final void Function() onPressed;

  BottomGoToWidget({
    Key? key,
    required this.text,
    required this.buttom,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            height: 1.71,
          ),
        ),
        SizedBox(width: 10),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttom,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
              height: 1.71,
            ),
          ),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
          ),
        ),
      ],
    );
  }
}
