import 'package:flutter/material.dart';

class SameUsername extends StatelessWidget {
  final TextEditingController usernameboard;
  SameUsername({
    super.key,
    required this.usernameboard,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          usernameboard.text,
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
