//import 'package:flutter/material.dart';
//import 'package:tsumeshogiapp/constants.dart';
//
//class HandPieceTile extends StatelessWidget {
//  final String piece;
//  final Function tapCallback;
//
//  HandPieceTile({
//    this.piece,
//    this.tapCallback,
//  });
//
//  @override
//  Widget build(BuildContext context) {
//    final pieceType = piece;
//    return FlatButton(
//      // ボタンを押したときの挙動
//      onPressed: tapCallback,
//      color: Colors.white,
//      padding: const EdgeInsets.all(3),
//      child: Center(
//          child: Transform.rotate(
//        angle: kPieceInfo[pieceType]['angle'],
//        child: Text(
//          kPieceInfo[pieceType]['text'],
//          style: TextStyle(color: kPieceInfo[pieceType]['color']),
//        ),
//      )),
//    );
//  }
//}
