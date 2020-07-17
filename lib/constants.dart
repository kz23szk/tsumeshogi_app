import 'package:flutter/material.dart';
import 'dart:math';

// 駒のアルファベットと盤面に表示する文字の対応表
// 駒の文字はsfen表記と同じ
// http://shogidokoro.starfree.jp/usi.html
// 空マスはe(empty)としている。
const kPieceInfo = {
  // 空のマス
  'e': {'text': '', 'color': Colors.black87, 'angle': 0.0},
  // 先手の駒
  'P': {'text': '歩', 'color': Colors.black87, 'angle': 0.0},
  'L': {'text': '香', 'color': Colors.black87, 'angle': 0.0},
  'N': {'text': '桂', 'color': Colors.black87, 'angle': 0.0},
  'S': {'text': '銀', 'color': Colors.black87, 'angle': 0.0},
  'G': {'text': '金', 'color': Colors.black87, 'angle': 0.0},
  'B': {'text': '角', 'color': Colors.black87, 'angle': 0.0},
  'R': {'text': '飛', 'color': Colors.black87, 'angle': 0.0},
  'K': {'text': '玉', 'color': Colors.black87, 'angle': 0.0},
  // 先手の成駒
  '+P': {'text': 'と', 'color': Colors.red, 'angle': 0.0},
  '+L': {'text': '杏', 'color': Colors.red, 'angle': 0.0},
  '+N': {'text': '圭', 'color': Colors.red, 'angle': 0.0},
  '+S': {'text': '全', 'color': Colors.red, 'angle': 0.0},
  '+B': {'text': '馬', 'color': Colors.red, 'angle': 0.0},
  '+R': {'text': '龍', 'color': Colors.red, 'angle': 0.0},
  // 後手の駒
  'p': {'text': '歩', 'color': Colors.black87, 'angle': pi},
  'l': {'text': '香', 'color': Colors.black87, 'angle': pi},
  'n': {'text': '桂', 'color': Colors.black87, 'angle': pi},
  's': {'text': '銀', 'color': Colors.black87, 'angle': pi},
  'g': {'text': '金', 'color': Colors.black87, 'angle': pi},
  'b': {'text': '角', 'color': Colors.black87, 'angle': pi},
  'r': {'text': '飛', 'color': Colors.black87, 'angle': pi},
  'k': {'text': '玉', 'color': Colors.black87, 'angle': pi},
  // 後手の成駒
  '+p': {'text': 'と', 'color': Colors.red, 'angle': pi},
  '+l': {'text': '杏', 'color': Colors.red, 'angle': pi},
  '+n': {'text': '圭', 'color': Colors.red, 'angle': pi},
  '+s': {'text': '全', 'color': Colors.red, 'angle': pi},
  '+b': {'text': '馬', 'color': Colors.red, 'angle': pi},
  '+r': {'text': '龍', 'color': Colors.red, 'angle': pi},
};

const kColors = {
  'white': Color(0xFFf7f3e9), // 象牙
  'blue': Color(0xFF7eb7c7),
  'green': Color(0xFF7eb7c7), // 萌黄
  'yellow': Color(0xFFffdf4f), //支子
  'red': Color(0xFF7eb7c7), // 朱色
  'gray': Color(0xFFc5ccc9),
  'black': Color(0xFF2f2725),
};

const kSenteHandOrder = ['R', 'B', 'G', 'S', 'N', 'L', 'P'];

// 空の盤面 初期化に利用
final List<String> kEmptyBoard = List.generate(81, (i) => 'e');

// 空の駒台 初期化に利用
const kEmptyHands = {
  // 攻め方の駒
  'p': 0, 'l': 0, 'n': 0, 's': 0, 'g': 0, 'b': 0, 'r': 0, // 'k': 1, 攻め方玉
  // 後手の駒
  'P': 0, 'L': 0, 'N': 0, 'S': 0, 'G': 0, 'B': 0, 'R': 0,
};
