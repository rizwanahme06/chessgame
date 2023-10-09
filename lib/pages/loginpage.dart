import 'package:chessgame/componenet/button/googlelogin_button.dart';
import 'package:chessgame/pages/game_board.dart';
import 'package:chessgame/pages/signup.dart';
import 'package:chessgame/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../componenet/my_textfield.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.arrow_back_outlined),
        title: const Text(
          'Chess',
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: TextButton(
              style: const ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUP()));
              },
              child: const Text(
                "SIGN UP",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
              ),
            ),
          )
        ],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // googlelogin
            GoogleLogin(),

            const SizedBox(height: 5),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                      child: Divider(
                    thickness: 0.5,
                    color: Colors.white,
                  )),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'or log in with',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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

            // username
            MyTextField(
              controller: usernameController,
              icon: Icons.person,
              hintText: 'Username or Email',
              obscureText: false,
            ),

            const SizedBox(height: 10),

            // password
            MyTextField(
              controller: passwordController,
              icon: Icons.lock_outline,
              hintText: 'PASSWORD',
              obscureText: true,
            ),

            SizedBox(height: 100),

            // emaillogin
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  onPrimary: Colors.white70,
                  padding: const EdgeInsets.only(
                      top: 15.0, left: 30.0, right: 30.0, bottom: 15.0),
                  elevation: 5),
              onPressed: () async {
                var sharedPref = await SharedPreferences.getInstance();

                sharedPref.setBool(SplashScreenState.KEYLOGIN, true);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => GameBoard()));
              },
              child: const Text(
                'LOGIN',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),

              // child: Row(
              //     // crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       Image.asset(
              //         'assets/google-logo.png',
              //         height: 30,
              //         width: 30,
              //       ),
              //       // const SizedBox(width: 20),
              //       const Text(
              //         "SIGN UP WITH GOOGLE",
              //         textAlign: TextAlign.center,
              //         style:
              //             TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              //       )
              //     ]),
            ),
          ]),
    );
  }
}
