import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

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
