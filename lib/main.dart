import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/main_screen.dart';
import 'package:flutter/services.dart';
import 'package:tsumeshogiapp/models/board_data.dart';

void main() => runApp(TsumeshogiApp());
//  // 画面を縦に固定する
//  SystemChrome.setPreferredOrientations([
//    DeviceOrientation.portraitUp,
//    DeviceOrientation.portraitDown,
//  ]).then((_) {
//    runApp(TsumeshogiApp());
//  });
//}

class TsumeshogiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BoardData>(
        create: (_) => BoardData(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.green,
            //fontFamily: 'roundedMplus',
          ),
          home: MainScreen(),
        ));
  }
}
