import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return //Provider<List>.value(
        ChangeNotifierProvider<BoardMaster>(
            builder: (_) => BoardMaster(),
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.green,
                //fontFamily: 'Mamelon',
                fontFamily: 'Noto',
              ),
              home: MyHomePage(title: '詰ピタ'),
            ));
  }
}

class Cell {
  int index;
  String piece;
  bool isHold; // 持っているか
  bool isControlled; // 利いているか

  Cell(this.index, this.piece, this.isHold, this.isControlled);
}

// 盤の状態 待ち　掴んでいる　着手（相手思考中）

// 状態変化できるか確認
// 盤面情報を保持して、タップされた情報に基づいて値を更新する
class BoardMaster with ChangeNotifier {
  List<Cell> _board =
      new List.generate(36, (i) => new Cell(i, "e", false, false));
  List<Cell> _hand =
      new List.generate(6, (i) => new Cell(i, "p", false, false));

  List<Cell> get board => _board;
  List<Cell> get hand => _hand;

  void tapBoardCell(index) {
    print("TAP");
    if (_board[index].isHold) {
      _board[index].isHold = false;
      _board[index].piece = "r";
    } else {
      _board[index].isHold = true;
      _board[index].piece = "D";
    }
    notifyListeners(); // 変更したよっていう通知
  }

  void tapHandCell(index) {
    if (_hand[index].piece == "h") {
      _hand[index].piece = "B";
    } else {
      _hand[index].piece = "h";
    }

    notifyListeners(); // 変更したよっていう通知
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

const HAND = 0;
const BOARD = 1;

List<FlatButton> _buildBoardCells(BuildContext context) {
  //final master = Provider.of<BoardMaster>(context, listen: true);

  List<FlatButton> cells =
      List.generate(36, (int index) => _buildBoardCell(index, context));
  return cells;
}

FlatButton _buildBoardCell(index, BuildContext context) {
  final m = Provider.of<BoardMaster>(context, listen: true);

  return FlatButton(
    // ボタンを押したときの挙動
    onPressed: () {
      print(m.board[index].index);
      m.tapBoardCell(index);
    },
    color: getCellColor(m.board[index]),
    padding: const EdgeInsets.all(3),
    child: Center(
        child: Transform.rotate(
      angle: pieceRotateMap[m.board[index].piece],
      child: pieceText(m.board[index]),
    )),
  );
}

List<FlatButton> _buildHandCells(BuildContext context) {
  List<FlatButton> cells =
      List.generate(6, (int index) => _buildHandCell(index, context));
  return cells;
}

FlatButton _buildHandCell(int index, BuildContext context) {
  final m = Provider.of<BoardMaster>(context, listen: true);

  FlatButton cell = FlatButton(
    // ボタンを押したときの挙動
    onPressed: () {
      print(index);
      m.tapHandCell(index);
    },
    color: getCellColor(m.hand[index]), // 変える
    padding: const EdgeInsets.all(3),
    child: Center(child: pieceText(m.hand[index])),
  );

  return cell;
}

Text pieceText(Cell c) {
  return Text(pieceTextMap[c.piece],
      textAlign: TextAlign.center,
      style: TextStyle(
        color: pieceColorMap[c.piece],
        fontSize: 35,
      ));
}

Color getCellColor(Cell c) {
  if (c.isHold) {
    return Colors.greenAccent;
  } else if (c.isControlled) {
    return Colors.yellow;
  } else {
    return Colors.white;
  }
}

// アルファベットと盤面に表示する駒の対応表
// 基本的にチェスの呼び方だが一部自分でつけている
// と金 tokin そのまま
// 成銀 argos
// 成香 javelin
// 成桂 mordred
const pieceTextMap = {
  "e": "",
  "p": "歩",
  "l": "香",
  "n": "桂",
  "s": "銀",
  "g": "金",
  "b": "角",
  "r": "飛",
  "k": "玉",
  "t": "と",
  "j": "杏",
  "m": "圭",
  "a": "全",
  "h": "馬",
  "d": "龍",
  "P": "歩",
  "L": "香",
  "N": "桂",
  "S": "銀",
  "G": "金",
  "B": "角",
  "R": "飛",
  "K": "玉",
  "T": "と",
  "J": "杏",
  "M": "圭",
  "A": "全",
  "H": "馬",
  "D": "龍",
};

// アルファベットと盤面に表示するテキスト色の対応表
const pieceColorMap = {
  "e": Colors.black87,
  "p": Colors.black87,
  "l": Colors.black12,
  "n": Colors.black12,
  "s": Colors.black12,
  "g": Colors.black12,
  "b": Colors.black12,
  "r": Colors.black87,
  "k": Colors.black12,
  "t": Colors.red,
  "j": Colors.red,
  "m": Colors.red,
  "a": Colors.red,
  "h": Colors.red,
  "d": Colors.red,
  "P": Colors.black12,
  "L": Colors.black12,
  "N": Colors.black12,
  "S": Colors.black12,
  "G": Colors.black12,
  "B": Colors.black12,
  "R": Colors.black12,
  "K": Colors.black12,
  "T": Colors.red,
  "J": Colors.red,
  "M": Colors.red,
  "A": Colors.red,
  "H": Colors.red,
  "D": Colors.red,
};

// アルファベットと盤面に表示する駒の角度の対応表
// 敵の駒なら180回転
const pieceRotateMap = {
  "e": 0.0,
  "p": 0.0,
  "l": 0.0,
  "n": 0.0,
  "s": 0.0,
  "g": 0.0,
  "b": 0.0,
  "r": 0.0,
  "k": 0.0,
  "t": 0.0,
  "j": 0.0,
  "m": 0.0,
  "a": 0.0,
  "h": 0.0,
  "d": 0.0,
  "P": pi,
  "L": pi,
  "N": pi,
  "S": pi,
  "G": pi,
  "B": pi,
  "R": pi,
  "K": pi,
  "T": pi,
  "J": pi,
  "M": pi,
  "A": pi,
  "H": pi,
  "D": pi,
};

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(5, 50, 20, 30),
          color: Colors.greenAccent,
          width: 455,
          height: 575,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 盤面
              Container(
                margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                color: Colors.blueAccent,
                width: 360,
                height: 360,
                child: GridView.count(
                  crossAxisCount: 6, // 横に何個入れるか
                  crossAxisSpacing: 4.0, // cell間の縦スペース
                  mainAxisSpacing: 4.0, // cell間の縦スペース
                  padding: EdgeInsets.all(5.0),

                  //childAspectRatio: 3.5 / 3.9, // 3.5/3.9
                  children: _buildBoardCells(context),
                ),
              ),
              //　持ち駒
              Container(
                margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                color: Colors.redAccent,
                width: 350,
                height: 100,
                child: GridView.count(
                  crossAxisCount: 6, // 横に何個入れるか
                  crossAxisSpacing: 4.0, // cell間の縦スペース
                  mainAxisSpacing: 4.0, // cell間の縦スペース
                  padding: EdgeInsets.all(5.0),

                  childAspectRatio: 3.5 / 3.9,
                  children: _buildHandCells(context),
                ),
              ),
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
