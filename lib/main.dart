import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import "settingUI.dart";
import 'RandomCore.dart';
import 'globals.dart' as globals;

void main() => runApp(AppMainUI());

class AppMainUI extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Draw lots App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: <String, WidgetBuilder>{
        Navigator.defaultRouteName: (context) =>
            HomePage(title: 'Draw lots App'),
        //SettingUI.routeName: (context) => SettingUI(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int _randomNum = 0;
  var randomNumList = <int>[];
  TextEditingController _start = TextEditingController();
  TextEditingController _end = TextEditingController();

  //RandomCore rdc = new RandomCore(int.parse(_start.text), end)
  Random random = new Random();

  void _randomNumber() {
    int s = int.parse(_start.text);
    int e = int.parse(_end.text);
    var rdc = RandomCore(s, e);

    print("$s $e");
    randomNumList = rdc.random();
  }

  bool _checkNum() {
    if (_start.text == "" ||
        int.parse(_start.text) < 0 ||
        int.parse(_start.text) > 10000) {
      Fluttertoast.showToast(
          msg: "valid number is between 0 to 10000",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return false;
    }
    if (_end.text == "" ||
        int.parse(_end.text) < 0 ||
        int.parse(_end.text) > 10000) {
      Fluttertoast.showToast(
          msg: "valid number is between 0 to 10000",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return false;
    }
    if (int.parse(_end.text) < int.parse(_start.text)) {
      String tmp = _end.text;
      _end.text = _start.text;
      _start.text = tmp;
    }

    return true;
  }

  void _resetApp() {
    randomNumList.clear();
    _start.text = "";
    _end.text = "";
    setState(() {
      _randomNum = 0;
    });
    Fluttertoast.showToast(
        msg: "App has been reset.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  String _getNumberList() {
    String str = "已抽中：\n";
    if (globals.requireSort) {
      randomNumList.sort();
    }

    for (int i = 0; i < randomNumList.length; i++) {
      str += randomNumList[i].toString() + ", ";
    }
    return str;
  }

  String _getRoundList(){
    String returnStr = "";
    for (int i = 0; i < randomNumList.length - 1; i++) {
      var num = randomNumList[i];
      returnStr += "$num, ";
    }
    returnStr += randomNumList[randomNumList.length-1].toString();
    return returnStr;
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new SettingUI()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                          WidgetSpan(
                            child: Icon(Icons.settings, size: 20),
                          ),
                          TextSpan(
                            text: "  Settings",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ]))
                  ],
                )),
            Divider(
              height: 2.0,
              color: Colors.grey,
            ),
          ],
        ),
      ),
      body: Center(
          child: Column(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text(
                    '$_randomNum',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline4,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        onChanged: (tmp) {
                          randomNumList.clear();
                        },
                        scrollPadding: const EdgeInsets.symmetric(
                            horizontal: 16),
                        controller: _start,
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: false, signed: false),
                        decoration: InputDecoration(hintText: "開始數字"),
                      ),
                    ),
                    Expanded(
                        child: TextField(
                          onChanged: (tmp) {
                            randomNumList.clear();
                          },
                          controller: _end,
                          keyboardType: TextInputType.numberWithOptions(
                              decimal: false, signed: false),
                          decoration: InputDecoration(hintText: "結束數字"),
                        )),
                  ],
                ),
                Row(children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: RaisedButton(
                        child: Text("抽籤 "),
                        onPressed: () {
                          int num = 0;
                          if (_checkNum()) {
                            _randomNumber();
                            setState(() {
                              _randomNum = num;
                            });
                          }
                          //print(num);
                        },
                      ),
                    ),
                  ),
                ]),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 16),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      _getNumberList(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 26),
                    ),
                  ),
                ),
              ],
            ),
          ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _resetApp();
        },
        tooltip: 'Random',
        child: Icon(Icons.autorenew),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
