import 'package:flutter/material.dart';

class BottumAuth extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  BottumAuth({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 50,
      margin: EdgeInsets.only(right: 130, left: 130),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(5),
        onPressed: onPressed,
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}