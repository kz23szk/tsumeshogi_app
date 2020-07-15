import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsumeshogiapp/models/board_data.dart';
import 'package:tsumeshogiapp/widgets/piece_tile.dart';

class PiecesList extends StatelessWidget {
  final Size size;

  PiecesList({this.size});

  @override
  Widget build(BuildContext context) {
    return Consumer<BoardData>(builder: (context, boardData, child) {
      return Container(
        //margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        color: Colors.blueAccent,
        width: size.width,
        height: size.width,
        child: GridView.count(
          crossAxisCount: 9,
          // 横に何個入れるか
          crossAxisSpacing: 4.0,
          // cell間の縦スペース
          mainAxisSpacing: 4.0,
          // cell間の縦スペース
          padding: EdgeInsets.all(5.0),
          //childAspectRatio: 3.5 / 3.9, // 3.5/3.9
          children: List<Widget>.generate(81, (index) {
            final piece = boardData.cell(index);
            return PieceTile(
              piece: piece,
              tapCallback: () {
                print("tap ${piece.index}");
              },
            );
          }),
        ),
      );
    });
  }
}
