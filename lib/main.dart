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
  String roundStr;
  String allStr;
  TextEditingController _start = TextEditingController();
  TextEditingController _end = TextEditingController();

  RandomCore rdc = new RandomCore(1, 10);
  Random random = new Random();

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

    if(!rdc.check()){
      Fluttertoast.showToast(
          msg: "All numbers have been selected!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return false;
    }
    return true;
  }

  void _resetApp() {
    randomNumList.clear();
    _start.text = "";
    _end.text = "";
    _getNumberList(true);
    rdc.reset();
    setState(() {
      roundStr = "";
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

  String _getNumberList(bool isclean) {
    if(isclean){
      return "";
    }
    return rdc.getNumberString();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            tooltip: "設定",
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new SettingUI()),
              );
            },
          )
        ],
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
                    '$roundStr',
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
                          rdc = new RandomCore(int.parse(_start.text), int.parse(_end.text));
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
                            rdc = new RandomCore(int.parse(_start.text), int.parse(_end.text));
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
                              roundStr = rdc.getRoundString();
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
                      _getNumberList(false),
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
