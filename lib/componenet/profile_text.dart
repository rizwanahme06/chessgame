import 'package:flutter/material.dart';

class Profile_Text extends StatelessWidget {
  final controller;
  final String text;
  final String? errortext;

  // Profile_Text({
  //   Key? key,
  //   required this.controller,
  //   required this.text,
  //   this.errortext,
  // }) : super(key: key);

  Profile_Text({
    required this.controller,
    required this.text,
    this.errortext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[900]),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                text,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black45),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54)),
                    errorText: errortext,
                    errorStyle: TextStyle(
                        color: Colors.red[600],
                        fontSize: 15,
                        fontWeight: FontWeight.normal)),
              ),
            ),
            errortext != null
                ? Text(errortext!, style: TextStyle(color: Colors.red))
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
