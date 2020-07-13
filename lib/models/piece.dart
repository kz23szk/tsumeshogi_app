class Piece {
  int index; // 盤面の場所番号　TODO:どうやって決めるのがいいのか？
  String type; // 駒の種類（先手後手、成不成も含む）
  bool hold; // 持っているか
  bool controlled; // 利いているか

  Piece(
      {this.index,
      this.type = 'e',
      this.hold = false,
      this.controlled = false});

  void toggleHold() {
    hold = !hold;
  }
}
