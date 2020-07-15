import 'package:flutter/foundation.dart';
import 'package:tsumeshogiapp/models/piece.dart';

// 盤面情報モデル
// タップされた情報に基づいて値を更新する
class BoardData extends ChangeNotifier {
  List<Piece> _board = List.generate(81, (i) => Piece(index: i));
  // TODO:持ち駒は盤面の駒と性質が違うので別クラスを用意する
  Map<String, int> _hands;

  List<Piece> get board => _board;
  Piece cell(int index) => _board[index];
  Map<String, int> get hands => _hands;

  int get boardCount => _board.length;

  setBoardInfoFromText(String problem) {
    List<String> boardList = problem.split(",");
    setBoardFromText(boardList[0]);
    setHandsFromText(boardList[1]);

    notifyListeners();
  }

  void setBoardFromText(String boardText) {
    _board = List.generate(81, (i) => Piece(index: i));

    List<String> boardChars = boardText.split('');
    RegExp number = RegExp(r'[1-9]');
    // 駒の文字だけにする？
    RegExp string = RegExp(r'[a-zA-Z]');

    bool promoteFlag = false;

    int index = 0;
    for (String char in boardChars) {
      if (char == '+') {
        promoteFlag = true;
      } else if (number.hasMatch(char)) {
        index += int.parse(char);
      } else if (string.hasMatch(char)) {
        if (promoteFlag) {
          _board[index].type = '+$char';
          promoteFlag = false;
        } else {
          _board[index].type = char;
        }
        index++;
      }
    }
  }

  void setHandsFromText(String handsText) {
    _hands = {
      // 攻め方の駒
      'p': 0, 'l': 0, 'n': 0, 's': 0, 'g': 0, 'b': 0, 'r': 0, // 'k': 1, 攻め方玉
      // 後手の駒
      'P': 0, 'L': 0, 'N': 0, 'S': 0, 'G': 0, 'B': 0, 'R': 0,
    };
    List<String> handsChars = handsText.split('');
    RegExp number = RegExp(r'[1-9]');

    int tempCount = 1;
    for (String char in handsChars) {
      if (number.hasMatch(char)) {
        tempCount = int.parse(char);
      } else {
        _hands[char] = tempCount;
        tempCount = 1;
      }
    }
  }

  void tapBoardCell(index) {
    print("TAP");
//    if (_board[index].hold) {
//      _board[index].hold = false;
//      _board[index].type = "r";
//    } else {
//      _board[index].hold = true;
//      _board[index].type = "+r";
//    }
    notifyListeners();
  }
}
