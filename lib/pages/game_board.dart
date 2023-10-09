import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import '../componenet/imagepicker.dart';
import 'timer.dart';

class GameBoard extends StatefulWidget {
  TextEditingController? usernameController;

  GameBoard({Key? key, this.usernameController}) : super(key: key);

  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  ChessBoardController controller = ChessBoardController();

  late Widget imageWidget;

  @override
  void initState() {
    super.initState();
    // Determine which widget to display based on the imageFile availability
    if (ImagePickerClassState().image == null) {
      imageWidget = Image.asset(
        'assets/profile.jpg',
        height: 50,
        width: 50,
        fit: BoxFit.cover,
      );
    } else {
      imageWidget = Image.file(
        ImagePickerClassState().image!,
        height: 50,
        width: 50,
        fit: BoxFit.cover,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[600],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.brown[400],
        title: const Text(
          'Chess Game ',
          // textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(children: [
              Row(
                children: <Widget>[
                  Row(
                    children: [
                      Column(
                        children: <Widget>[imageWidget],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [Text('${widget.usernameController}')],
                          )
                        ],
                      ),
                      // Image.file(
                      //   ImagePickerClassState().image ??
                      //       File(
                      //         'assets/profile.jpg',
                      //       ),
                      //   height: 100,
                      //   width: 100,
                      //   fit: BoxFit.cover,
                      // ),
                    ],
                  ),
                  Expanded(
                    child: MyTimerButton(),
                  ),
                ],
              )
            ]),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: ChessBoard(
                controller: controller,
                boardColor: BoardColor.brown,
                boardOrientation: PlayerColor.white,
              ),
            ),
          ),
          Expanded(
            child: Container(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: Text('Deliver features faster',
                      textAlign: TextAlign.center),
                ),
                Expanded(
                  child: MyTimerButton(),
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
