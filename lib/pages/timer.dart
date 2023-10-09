import 'dart:async';

import 'package:flutter/material.dart';

class MyTimerButton extends StatefulWidget {
  @override
  _MyTimerButtonState createState() => _MyTimerButtonState();
}

class _MyTimerButtonState extends State<MyTimerButton> {
  Timer? _timer;
  String buttonText = "Start Timer";
  int remainingTime = 30; // Initial duration in seconds

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;
        } else {
          stopTimer();
        }
      });
    });
  }

  void stopTimer() {
    _timer?.cancel();
    setState(() {
      buttonText = "Start Timer";
      remainingTime = 30;
    });
    print("Timer canceled");
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            Colors.black87), // Set the background color here.
      ),
      onPressed: () {
        if (_timer == null || !_timer!.isActive) {
          startTimer();
          setState(() {
            buttonText = "Stop Timer";
          });
        } else {
          stopTimer();
        }
      },
      child: Text(
        remainingTime > 0 ? "$remainingTime s" : buttonText,
      ),
    );
  }
}
