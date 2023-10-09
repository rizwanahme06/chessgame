// import 'dart:js';
import 'package:chessgame/pages/edit_profile.dart';
import 'package:flutter/material.dart';

import '../auth/google_auth.dart';

class GoogleLogin extends StatefulWidget {
  const GoogleLogin({super.key});

  @override
  State<GoogleLogin> createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              onPrimary: Colors.white70,
              padding: const EdgeInsets.only(
                  top: 15.0, left: 30.0, right: 30.0, bottom: 15.0),
              elevation: 5),
          onPressed: signIn,
          child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/google-logo.png',
                  height: 30,
                  width: 30,
                ),
                // const SizedBox(width: 20),
                const Text(
                  "SIGN UP WITH GOOGLE",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                )
              ]),
        ),
      ),
    );
  }

  // Future signIn() async {
  //   final user = await GoogleSignInApi.login();
  //   print(user);

  //   if (user == null) {
  //     ScaffoldMessenger.of(this.context)
  //         .showSnackBar(SnackBar(content: Text('Sign in Fail')));
  //   } else {
  //     Navigator.of(this.context).pushReplacement(
  //         MaterialPageRoute(builder: ({firstnameController.text =user.displayName}) => Profile(user: user,)));
  //   }
  // }

  Future<void> signIn() async {
    final user = await GoogleSignInApi.login();

    if (user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Sign in Fail')));
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Profile(user: user)),
      );
    }
  }
}
