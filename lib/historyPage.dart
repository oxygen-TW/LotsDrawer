import 'package:LotsDrawer/RandomLib/BasicRandom.dart';
import 'package:LotsDrawer/RandomLib/RandomCore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final BasicRandom basicRandom;
  HistoryPage({Key key, @required this.basicRandom}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<int> randomList = basicRandom.getTotalNumbers();
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: randomList.length,
          itemBuilder: (context, index) {
            return new ListTile(
              title: new Text(randomList[index].toString()),
            );
          },
        ),
      ),
    );
  }
}
