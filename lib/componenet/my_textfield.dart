import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  bool obscureText;
  final IconData icon;

  MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87)),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black87),
            ),
            fillColor: Colors.black45,
            filled: true,
            hintText: hintText,
          ),
        ));
  }
}
