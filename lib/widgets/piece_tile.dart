import 'package:flutter/material.dart';
import 'package:tsumeshogiapp/constants.dart';

class PieceTile extends StatelessWidget {
  final String pieceStr;
  final Function tapCallback;

  PieceTile({
    this.pieceStr,
    this.tapCallback,
  });

  @override
  Widget build(BuildContext context) {
    final pieceType = pieceStr;
    return FlatButton(
      // ボタンを押したときの挙動
      onPressed: tapCallback,
      color: kColors['white'],
      padding: const EdgeInsets.all(3),
      child: Center(
          child: Transform.rotate(
        angle: kPieceInfo[pieceType]['angle'],
        child: Text(
          kPieceInfo[pieceType]['text'],
          style: TextStyle(
            color: kPieceInfo[pieceType]['color'],
            fontSize: 25,
          ),
        ),
      )),
    );
  }
}
