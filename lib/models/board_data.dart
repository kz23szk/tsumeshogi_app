import 'package:flutter/foundation.dart';
import 'package:tsumeshogiapp/constants.dart';

// 盤面情報モデル
// タップされた情報に基づいて値を更新する
class BoardData extends ChangeNotifier {
  //
  List<String> _board = kEmptyBoard;
  Map<String, int> _hands = {};

  List<String> get board => _board;
  String cell(int index) => _board[index];
  Map<String, int> get hands => _hands;

  int get boardCount => _board.length;

  setBoardInfoFromText(String problem) {
    List<String> boardList = problem.split(",");
    setBoardFromText(boardList[0]);
    setHandsFromText(boardList[1]);

    //notifyListeners();
  }

  void setBoardFromText(String boardText) {
    _board = kEmptyBoard;

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
          _board[index] = '+$char';
          promoteFlag = false;
        } else {
          _board[index] = char;
        }
        index++;
      }
    }
  }

  void setHandsFromText(String handsText) {
    _hands = {
      // 先手の駒
      'P': 0, 'L': 0, 'N': 0, 'S': 0, 'G': 0, 'B': 0, 'R': 0,
      // 後手の駒
      'p': 0, 'l': 0, 'n': 0, 's': 0, 'g': 0, 'b': 0, 'r': 0,
    };
    List<String> handsChars = handsText.split('');
    RegExp number = RegExp(r'[1-9]');

    for (int i = 0; i < handsChars.length; i++) {
      if (number.hasMatch(handsChars[i])) {
        // 10枚以上持っているとき
        if (number.hasMatch(handsChars[i + 1])) {
          _hands[handsChars[i + 2]] =
              int.parse(handsChars[i]) * 10 + int.parse(handsChars[i + 1]);
          i += 2;
        } else {
          _hands[handsChars[i + 1]] = int.parse(handsChars[i]);
          i++;
        }
      } else {
        print(handsChars[i]);
        _hands[handsChars[i]] = 1;
      }
    }
    print(_hands);
  }

  // 持ち駒情報を返す
  // ex)金２枚歩1枚なら金金歩
  List<String> handsStrList() {
    List<String> handsStrList = [];

    for (String type in kSenteHandOrder) {
      for (int i = 0; i < _hands[type]; i++) {
        handsStrList.add(type);
      }
    }
    return handsStrList;
  }

  void tapBoardCell(index) {
    print("TAP $index");
    notifyListeners();
  }
}
