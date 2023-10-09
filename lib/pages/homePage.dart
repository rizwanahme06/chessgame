import 'package:flutter/material.dart';
import 'game_board.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: GameBoard()));
  }
}
