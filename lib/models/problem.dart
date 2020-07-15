class Problem {
  // 問題の文字列は下記のようになっている
  // 盤面,持駒
  // 9/7k1/5SN2/9/8L/9/9/9/9,G2r2b3g3s3n3l18p
  final String problemText;
  final int turn; // N手詰め
  final String answer; // 解答

  Problem(
      {this.problemText = '9/7k1/5SN2/9/8L/9/9/9/9,G2r2b3g3s3n3l18p',
      this.turn = 3,
      this.answer = 'noans'});
}
