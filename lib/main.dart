import 'package:chessgame/componenet/imagepicker.dart';
import 'package:chessgame/pages/loginpage.dart';
import 'package:chessgame/pages/splash_screen.dart';

import 'package:flutter/material.dart';

import 'componenet/email_layout.dart';
import 'pages/edit_profile.dart';
import 'pages/game_board.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      // home:Profile(),
      home: Login(),
    );
  }
}
