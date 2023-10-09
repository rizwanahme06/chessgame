import 'package:flutter/material.dart';

import 'imagepicker.dart';

class GameBoardPersonStatus extends StatelessWidget {
  GameBoardPersonStatus({super.key});

  final TextEditingController usernamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ImagePickerClass(),
          Column(
            children: [
              // SameUsername(usernameboard: usernamecontroller)
            ],
          )
        ],
      ),
    );
  }
}
