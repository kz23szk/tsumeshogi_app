import 'package:flutter/material.dart';
import 'package:tsumeshogiapp/models/piece.dart';
import 'dart:math';

class PieceTile extends StatelessWidget {
  final Piece piece;
  final Function tapCallback;

  PieceTile({
    this.piece,
    this.tapCallback,
  });

  @override
  Widget build(BuildContext context) {
    final pieceType = piece.type;
    return FlatButton(
      // ボタンを押したときの挙動
      onPressed: tapCallback,
      color: Colors.white,
      padding: const EdgeInsets.all(3),
      child: Center(
          child: Transform.rotate(
        angle: pieceInfo[pieceType]['angle'],
        child: Text(
          pieceInfo[pieceType]['text'],
          style: TextStyle(color: pieceInfo[pieceType]['color']),
        ),
      )),
    );
  }
}

// 駒のアルファベットと盤面に表示する文字の対応表
// 駒の文字はsfen表記と同じ
// http://shogidokoro.starfree.jp/usi.html
// 空マスはe(empty)としている。
const pieceInfo = {
  // 空のマス
  'e': {'text': '空', 'color': Colors.black87, 'angle': 0.0},
  // 先手の駒
  'p': {'text': '歩', 'color': Colors.black87, 'angle': 0.0},
  'l': {'text': '香', 'color': Colors.black87, 'angle': 0.0},
  'n': {'text': '桂', 'color': Colors.black87, 'angle': 0.0},
  's': {'text': '銀', 'color': Colors.black87, 'angle': 0.0},
  'g': {'text': '金', 'color': Colors.black87, 'angle': 0.0},
  'b': {'text': '角', 'color': Colors.black87, 'angle': 0.0},
  'r': {'text': '飛', 'color': Colors.black87, 'angle': 0.0},
  'k': {'text': '玉', 'color': Colors.black87, 'angle': 0.0},
  // 先手の成駒
  '+p': {'text': 'と', 'color': Colors.red, 'angle': 0.0},
  '+l': {'text': '杏', 'color': Colors.red, 'angle': 0.0},
  '+n': {'text': '圭', 'color': Colors.red, 'angle': 0.0},
  '+s': {'text': '全', 'color': Colors.red, 'angle': 0.0},
  '+b': {'text': '馬', 'color': Colors.red, 'angle': 0.0},
  '+r': {'text': '龍', 'color': Colors.red, 'angle': 0.0},
  // 後手の駒
  'P': {'text': '歩', 'color': Colors.black87, 'angle': pi},
  'L': {'text': '香', 'color': Colors.black87, 'angle': pi},
  'N': {'text': '桂', 'color': Colors.black87, 'angle': pi},
  'S': {'text': '銀', 'color': Colors.black87, 'angle': pi},
  'G': {'text': '金', 'color': Colors.black87, 'angle': pi},
  'B': {'text': '角', 'color': Colors.black87, 'angle': pi},
  'R': {'text': '飛', 'color': Colors.black87, 'angle': pi},
  'K': {'text': '玉', 'color': Colors.black87, 'angle': pi},
  // 後手の成駒
  '+P': {'text': 'と', 'color': Colors.red, 'angle': pi},
  '+L': {'text': '杏', 'color': Colors.red, 'angle': pi},
  '+N': {'text': '圭', 'color': Colors.red, 'angle': pi},
  '+S': {'text': '全', 'color': Colors.red, 'angle': pi},
  '+B': {'text': '馬', 'color': Colors.red, 'angle': pi},
  '+R': {'text': '龍', 'color': Colors.red, 'angle': pi},
};
