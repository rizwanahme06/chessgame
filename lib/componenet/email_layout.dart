import 'dart:convert';

import 'package:chessgame/componenet/config.dart';
import 'package:chessgame/componenet/profile_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Enail_Layout extends StatefulWidget {
  const Enail_Layout({super.key});

  @override
  State<Enail_Layout> createState() => _Enail_LayoutState();
}

class _Enail_LayoutState extends State<Enail_Layout> {
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();
  bool _isValidMove = false;

  Future<void> email() async {
    if (PasswordController.text == repeatPasswordController.text) {
      if (PasswordController.text.isEmpty && EmailController.text.isEmpty) {
        var regbody = {
          'email': EmailController.text,
          'password': PasswordController
        };

        var res = await http.post(Uri.parse(User_data_create),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(regbody));
        if (res.statusCode == 200) {
          return json.decode(res.body)['message'];
        } else {
          throw Exception('fail to load data from the secret');
        }
      } else {
        setState(() {
          _isValidMove = true;
        });
      }
    } else {
      print('password incorrect');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Profile_Text(
            controller: EmailController,
            text: "Email",
            errortext: _isValidMove ? "Enter proper info" : null,
          ),
          SizedBox(height: 10),
          Profile_Text(
            controller: PasswordController,
            text: "Password",
            errortext: _isValidMove ? "Enter proper info" : null,
          ),
          SizedBox(height: 10),
          Profile_Text(
            controller: repeatPasswordController,
            text: "Re-Enter Password",
            errortext: _isValidMove ? "Re-Enter Password is wrong" : null,
          ),
          SizedBox(
            height: 15,
          ),
          TextButton(
            onPressed: () => {email()},
            style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal,
                disabledForegroundColor: Colors.grey.withOpacity(0.38),
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                textStyle:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            child: const Padding(
              padding: const EdgeInsets.only(
                  top: 5.0, left: 20.0, bottom: 5.0, right: 20.0),
              child: const Text(
                'save',
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
