import 'package:flutter/material.dart';
import 'package:tsumeshogiapp/constants.dart';
import 'package:tsumeshogiapp/models/board_data.dart';
import 'package:provider/provider.dart';

// 持ち駒の表現方法1
// あるものを左詰めで配置
class HandsTiles extends StatelessWidget {
  final Size size;

  HandsTiles({this.size});

  @override
  Widget build(BuildContext context) {
    return Consumer<BoardData>(builder: (context, boardData, child) {
      List<String> handsList = boardData.handsStrList();
      return Container(
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        color: Colors.redAccent,
        width: size.width * 7 / 9,
        height: 100,
        child: GridView.count(
          crossAxisCount: 7,
          // 横に何個入れるか
          crossAxisSpacing: 4.0,
          // cell間の縦スペース
          mainAxisSpacing: 4.0,
          // cell間の縦スペース
          padding: EdgeInsets.all(5.0),

          childAspectRatio: 3.5 / 3.9,
          children: List.generate(handsList.length,
              (int index) => _buildHandCell(index, handsList)),
        ),
      );
    });
  }
}

FlatButton _buildHandCell(int index, List<String> handsList) {
  return FlatButton(
    // ボタンを押したときの挙動
    onPressed: () {
      print(index);
    },
    color: Colors.white, // 変える
    padding: const EdgeInsets.all(3),
    child: Center(
      child: Text(kPieceInfo[handsList[index]]['text'],
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kPieceInfo[handsList[index]]['color'],
            fontSize: 25,
          )),
    ),
  );
}

Text pieceText(String type, BuildContext context) {
  final boardData = Provider.of<BoardData>(context, listen: true);

  if (boardData.hands[type] > 0) {
    return Text(kPieceInfo[type]['text'],
        textAlign: TextAlign.center,
        style: TextStyle(
          color: kPieceInfo[type]['color'],
          fontSize: 25,
        ));
  } else {
    return Text("",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
        ));
  }
}

/// 持ち駒の表現方法2
/// 飛角金銀桂香歩の順に枚数とともに並べる
class HandsTiles2 extends StatelessWidget {
  final Size size;

  HandsTiles2({this.size});

  @override
  Widget build(BuildContext context) {
    return Consumer<BoardData>(builder: (context, boardData, child) {
      Map<String, int> handMap = boardData.hands;
      return Container(
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        color: Colors.redAccent,
        width: size.width * 7 / 9,
        height: 100,
        child: GridView.count(
          crossAxisCount: 7,
          // 横に何個入れるか
          crossAxisSpacing: 4.0,
          // cell間の縦スペース
          mainAxisSpacing: 4.0,
          // cell間の縦スペース
          padding: EdgeInsets.all(5.0),

          childAspectRatio: 3.5 / 3.9,
          children: List.generate(kSenteHandOrder.length,
              (int index) => _buildHandCell2(index, handMap)),
        ),
      );
    });
  }
}

FlatButton _buildHandCell2(int index, Map<String, int> handMap) {
  String type = kSenteHandOrder[index];
  return FlatButton(
    // ボタンを押したときの挙動
    onPressed: () {
      print(index);
    },
    color: Colors.white, // 変える
    padding: const EdgeInsets.all(3),
    child: Center(child: pieceTexts(type, handMap[type])),
  );
}

Text pieceTexts(String type, int count) {
  if (count > 0) {
    return Text(kPieceInfo[type]['text'],
        textAlign: TextAlign.center,
        style: TextStyle(
          color: kPieceInfo[type]['color'],
          fontSize: 25,
        ));
  } else {
    return Text("",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
        ));
  }
}
