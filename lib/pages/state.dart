import 'package:chessgame/componenet/imagepicker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class States extends StatefulWidget {
  const States({super.key});

  @override
  State<States> createState() => _StatesState();
}

class _StatesState extends State<States> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black26,
        elevation: 5,
        shadowColor: Colors.black26,
        leading: const Icon(Icons.arrow_back_outlined),
        centerTitle: true,
        title: Center(
          // mainAxisAlignment: MainAxisAlignment.center,
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Image.asset(
                  'assets/state.png',
                  height: MediaQuery.of(context).size.height * .0781349,
                  width: MediaQuery.of(context).size.width * .0781349,
                ),
              ),
              Text(
                'State',
                textAlign: TextAlign.center,
                style: GoogleFonts.kanit(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.arrow_drop_down)
            ],
          ),
        ),
      ),
      body: Container(
        child: const Column(children: [
          Row(
            children: [
              ImagePickerClass(),
              Text('Rizwa'),
              Column(
                children: [Icon(Icons.compare)],
              )
            ],
          )
        ]),
      ),
    );
  }
}
