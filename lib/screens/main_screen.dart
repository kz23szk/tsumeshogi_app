import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsumeshogiapp/models/board_data.dart';
import 'package:tsumeshogiapp/widgets/pieces_list.dart';
import 'package:tsumeshogiapp/models/problem.dart';
import 'package:tsumeshogiapp/widgets/hands_tiles.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Problem p = Problem();
    Provider.of<BoardData>(context).setBoardInfoFromText(p.problemText);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "詰将棋",
          style: TextStyle(
            fontWeight: FontWeight.w100,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          color: Colors.greenAccent,
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(),
              // 盤面
              PiecesList(size: size),
              //　持ち駒
              HandsTiles(size: size),
            ],
          ),
        ),
      ),
      // 答えや解説を表示する
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Problem p = Problem();
          Provider.of<BoardData>(context, listen: false)
              .setBoardInfoFromText(p.problemText);
          print(Provider.of<BoardData>(context, listen: false).hands);
        },
        tooltip: 'Increment',
        child: Icon(Icons.check_circle),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
