import 'package:LotsDrawer/RandomLib/RandomLib.dart';
import 'package:flutter/material.dart';
import 'file:///D:/Programming/Projects/LotsDrawer/lib/RandomLib/RandomCore.dart';
import 'RandomLib/BasicRandom.dart' as rc;
import 'RandomLib/globals.dart' as globals;

class SettingUI extends StatefulWidget {
  @override
  _SettingUIState createState() => _SettingUIState();
}

class _SettingUIState extends State<SettingUI> {
  String _excludeString = "排除：";
  TextEditingController _excludeC = TextEditingController();
  TextEditingController _multiC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListView.builder(
        itemBuilder: (context, position) {
          return Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                        child: Text(
                          "是否排序",
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //Switch(onChanged: null, value: true),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Switch(
                              onChanged: (flag) {
                                globals.requireSort = flag;
                                setState(() {});
                              },
                              value: globals.requireSort),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                height: 2.0,
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                        child: Text(
                          "不允許重複",
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //Switch(onChanged: null, value: true),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Switch(
                              onChanged: (flag) {
                                globals.requireUnique = flag;
                                setState(() {});
                              },
                              value: globals.requireUnique),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                height: 2.0,
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                        child: Text(
                          "排除數字",
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //Switch(onChanged: null, value: true),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Switch(
                              onChanged: (flag) {
                                globals.requireExclude = flag;
                                setState(() {});
                              },
                              value: globals.requireExclude),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                height: 2.0,
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(12.0, 5.0, 12.0, 6.0),
                        child: Text(
                          "單次抽籤數量",
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //Switch(onChanged: null, value: true),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Switch(
                              onChanged: (flag) {
                                globals.requireMultiple = flag;
                                setState(() {});
                              },
                              value: globals.requireMultiple),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                height: 2.0,
                color: Colors.grey,
              ),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child: TextField(
                        enabled: globals.requireExclude,
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: false, signed: false),
                        decoration: InputDecoration(hintText: "排除數字"),
                        controller: _excludeC,
                      ),
                    ),
                  ),
                  FlatButton(
                      onPressed: () {
                        if(_excludeC.text == ""){
                          return;
                        }
                        globals.excludeList.add(int.parse(_excludeC.text));
                        _excludeC.text = "";
                        //_excludeString = BasicRandom.getExcludeString();
                        setState(() {});
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            WidgetSpan(
                              child: Icon(Icons.add_circle, size: 20),
                            ),
                          ]))
                        ],
                      )),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child: TextField(
                        enabled: globals.requireMultiple,
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: false, signed: false),
                        decoration: InputDecoration(hintText: "抽出組數"),
                        controller: _multiC,
                      ),
                    ),
                  ),
                  FlatButton(
                      onPressed: () {
                        if(_multiC.text == ""){
                          return;
                        }
                        globals.multiNum = int.parse(_multiC.text);
                        print(globals.multiNum);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            WidgetSpan(
                              child: Icon(Icons.add_circle, size: 20),
                            ),
                          ]))
                        ],
                      )),
                ],
              ),
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(16, 20, 16, 0),
                      child: Text("$_excludeString",
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.black,
                          )))
                ],
              )
            ],
          );
        },
        itemCount: 1,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          globals.requireSort = true;
          globals.requireUnique = true;
          globals.requireExclude = false;
          globals.requireMultiple = false;
          globals.excludeList.clear();
          globals.multiNum = 1;
          _excludeString = "排除：";
          setState(() {});
        },
        tooltip: 'Reset',
        child: Icon(Icons.autorenew),
      ),
    );
  }
}
