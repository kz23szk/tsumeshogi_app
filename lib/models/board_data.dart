import 'dart:collection';

import 'package:flutter/foundation.dart';
//import 'dart:collection';
import 'package:tsumeshogiapp/models/piece.dart';

// 盤面情報モデル
// タップされた情報に基づいて値を更新する
class BoardData extends ChangeNotifier {
  List<Piece> _board = List.generate(36, (i) => Piece(index: i));
  // TODO:持ち駒は盤面の駒と性質が違うので別クラスを用意する
//  List<Piece> _hand =
//      new List.generate(6, (i) => new Piece(index: i));

  List<Piece> get board => _board;
//  List<Piece> get hand => _hand;

  Piece getPieceInfo(int index) {
    return _board[index];
  }

  int get boardCount => _board.length;

  void tapBoardCell(index) {
    print("TAP");
    if (_board[index].hold) {
      _board[index].hold = false;
      _board[index].type = "r";
    } else {
      _board[index].hold = true;
      _board[index].type = "+r";
    }
    notifyListeners();
  }
}
