import 'package:flutter/material.dart';
import 'package:tsumeshogiapp/constants.dart';
import 'package:tsumeshogiapp/models/board_data.dart';
import 'package:provider/provider.dart';

class HandsTiles extends StatelessWidget {
  final Size size;

  HandsTiles({this.size});

  @override
  Widget build(BuildContext context) {
    return Consumer<BoardData>(builder: (context, boardData, child) {
      return Container(
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        color: Colors.redAccent,
        width: size.width * 0.8,
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
          children:
              List.generate(7, (int index) => _buildHandCell(index, context)),
        ),
      );
    });
  }
}

FlatButton _buildHandCell(int index, BuildContext context) {
  FlatButton cell = FlatButton(
    // ボタンを押したときの挙動
    onPressed: () {
      print(index);
    },
    color: Colors.white, // 変える
    padding: const EdgeInsets.all(3),
    child: Center(
      child: pieceText(kHandsOrder[index], context),
    ),
  );

  return cell;
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
