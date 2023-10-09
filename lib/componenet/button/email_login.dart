import 'package:flutter/material.dart';

import '../email_layout.dart';

class Email_login extends StatelessWidget {
  const Email_login({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.green[700],
              onPrimary: Colors.white70,
              shadowColor: Colors.greenAccent,
              padding: const EdgeInsets.only(
                  top: 20.0, left: 70.0, right: 70.0, bottom: 20.0),
              elevation: 5),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Enail_Layout()),
            );
          },
          child: const Text(
            "Sign up with Email",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
          )),
    );
  }
}
