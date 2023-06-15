import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 55.0),
      child: TextField(
        controller: controller,
        // textAlign: TextAlign.center,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF808080)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF808080)),
            ),
            // fillColor: Colors.grey.shade200,
            // filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(
                color: Color(0xFFA9A9A9),
                fontFamily: 'Graphik',
                fontWeight: FontWeight.w600)),
      ),
    );
  }
}
