import 'package:flutter/material.dart';

class TextFiledWidgets extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTapIcon;
  final IconData? iconShow;

  TextFiledWidgets({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    required this.icon,
    required this.isNumber,
    this.obscureText,
    this.onTapIcon,
    this.iconShow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label text
        Text(
          labelText,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 5),

        // Input Field Container
        Container(
          width: 369,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            keyboardType: isNumber
                ? const TextInputType.numberWithOptions(decimal: true)
                : TextInputType.text,
            controller: controller,
            obscureText: obscureText == null || obscureText == false ? false : true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.blue,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.white),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
              suffixIcon:  InkWell(
                onTap: onTapIcon,
                child: Icon(
                  iconShow,
                  color: Colors.white,
                ),
              ),
            ),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}