import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsumeshogiapp/widgets/pieces_list.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
//              Container(
//                margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
//                color: Colors.redAccent,
//                width: 350,
//                height: 100,
//                child: GridView.count(
//                  crossAxisCount: 6, // 横に何個入れるか
//                  crossAxisSpacing: 4.0, // cell間の縦スペース
//                  mainAxisSpacing: 4.0, // cell間の縦スペース
//                  padding: EdgeInsets.all(5.0),
//
//                  childAspectRatio: 3.5 / 3.9,
//                  children: _buildHandCells(context),
//                ),
//              ),
//
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//const HAND = 0;
//const BOARD = 1;
//
//List<FlatButton> _buildBoardCells(BuildContext context) {
//  //final master = Provider.of<BoardMaster>(context, listen: true);
//
//  List<FlatButton> cells =
//      List.generate(36, (int index) => _buildBoardCell(index, context));
//  return cells;
//}

//FlatButton _buildBoardCell(index, BuildContext context) {
//  final m = Provider.of<BoardMaster>(context, listen: true);
//
//  return FlatButton(
//    // ボタンを押したときの挙動
//    onPressed: () {
//      print(m.board[index].index);
//      m.tapBoardCell(index);
//    },
//    color: getCellColor(m.board[index]),
//    padding: const EdgeInsets.all(3),
//    child: Center(
//        child: Transform.rotate(
//      angle: pieceRotateMap[m.board[index].piece],
//      child: pieceText(m.board[index]),
//    )),
//  );
//}
//
//List<FlatButton> _buildHandCells(BuildContext context) {
//  List<FlatButton> cells =
//      List.generate(6, (int index) => _buildHandCell(index, context));
//  return cells;
//}

//FlatButton _buildHandCell(int index, BuildContext context) {
//  final m = Provider.of<BoardMaster>(context, listen: true);
//
//  FlatButton cell = FlatButton(
//    // ボタンを押したときの挙動
//    onPressed: () {
//      print(index);
//      m.tapHandCell(index);
//    },
//    color: getCellColor(m.hand[index]), // 変える
//    padding: const EdgeInsets.all(3),
//    child: Center(child: pieceText(m.hand[index])),
//  );
//
//  return cell;
//}

//Text pieceText(Cell c) {
//  return Text(pieceTextMap[c.piece],
//      textAlign: TextAlign.center,
//      style: TextStyle(
//        color: pieceColorMap[c.piece],
//        fontSize: 35,
//      ));
//}

//Color getCellColor(Cell c) {
//  if (c.isHold) {
//    return Colors.greenAccent;
//  } else if (c.isControlled) {
//    return Colors.yellow;
//  } else {
//    return Colors.white;
//  }
//}
