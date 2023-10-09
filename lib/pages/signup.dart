import 'dart:ui';

import 'package:chessgame/componenet/button/email_login.dart';
import 'package:chessgame/componenet/button/googlelogin_button.dart';
import 'package:chessgame/pages/loginpage.dart';
import 'package:flutter/material.dart';

class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.arrow_back_outlined),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: TextButton(
              style: const ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: const Text(
                "LOG IN",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
              ),
            ),
          )
        ],
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logintext
            const Padding(
              padding: EdgeInsets.only(top: 70.0, left: 0.0, right: 0.0),
              child: Center(
                child: Text(
                  "Create your chess.com account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 27,
                  ),
                ),
              ),
            ),
            // logo
            Container(
              child: Center(
                child: Image.asset(
                  "assets/king_logo.jpg",
                  height: 200,
                  width: 200,
                  fit: BoxFit.contain,
                  color: Colors.grey[40],
                  colorBlendMode: BlendMode.darken,
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(children: [
                // emaillogin
                Email_login(),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Divider(
                          thickness: 0.5,
                          color: Colors.white,
                        )),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'or',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 0.5,
                          color: Colors.white,
                        )),
                      ],
                    ),
                  ),
                ),
                // signupwithgoogle
                GoogleLogin(),
                const SizedBox(height: 10),
              ]),
            )
          ]),
    );
  }
}
