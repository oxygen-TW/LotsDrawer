import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Draw lots App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Draw lots App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _randomNum = 0;
  var numList = <int>[];
  TextEditingController _start = TextEditingController();
  TextEditingController _end = TextEditingController();

  Random random = new Random();
  bool _isSort = true;
  bool _isUnique = true;

  int _randomNumber() {
    int s = int.parse(_start.text);
    int e = int.parse(_end.text) + 1;
    int num = 0;

    print("$s $e");
    do {
      num = random.nextInt(e - s) + s;
      print("$num");
    }while(numList.contains(num) && _isUnique);
    return num;
  }

  bool _checkNum(){
    if(_start.text == "" || int.parse(_start.text) < 0 || int.parse(_start.text) > 10000){
      Fluttertoast.showToast(
          msg: "valid number is between 0 to 10000",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return false;
    }
    if(_end.text == "" || int.parse(_end.text) < 0 || int.parse(_end.text) > 10000){
      Fluttertoast.showToast(
          msg: "valid number is between 0 to 10000",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return false;
    }
    if(int.parse(_end.text) < int.parse(_start.text)){
      String tmp = _end.text;
      _end.text = _start.text;
      _start.text = tmp;
    }

    if((int.parse(_end.text) + 1) - int.parse(_start.text) == numList.length && _isUnique){
      Fluttertoast.showToast(
          msg: "All number have been selected!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blueGrey,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return false;
    }

    return true;
  }
  void _resetApp(){
    numList.clear();
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
        fontSize: 16.0
    );
  }

  String _getNumberList(){
    String str = "已抽中：\n";
    if(_isSort){
      numList.sort();
    }

    for(int i=0; i<numList.length;i++){
      str += numList[i].toString() + ", ";
    }
    return str;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Text(
                  '$_randomNum',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                  child: TextField(
                    onChanged: (tmp){
                      numList.clear();
                    },
                    scrollPadding: const EdgeInsets.symmetric(horizontal: 16),
                    controller: _start,
                    keyboardType: TextInputType.numberWithOptions(decimal: false, signed: false),
                    decoration: InputDecoration(hintText: "開始數字"),
                  ),
                  ),
                  Expanded(
                      child: TextField(
                        onChanged: (tmp){
                          numList.clear();
                        },
                        controller: _end,
                        keyboardType: TextInputType.numberWithOptions(decimal: false, signed: false),
                        decoration: InputDecoration(hintText: "結束數字"),
                      )
                  ),
                ],
              ),
              Row(
                children: [
                  Text("是否排序"),
                  Checkbox(value: _isSort, onChanged: (flag){
                    _isSort = flag;
                    setState(() {});
                  }),
                  Text("不重複"),
                  Checkbox(value: _isUnique, onChanged: (flag){
                    _isUnique = flag;
                    setState(() {});
                  }),
                  Text("  "),
                  Padding(
                      padding: EdgeInsets.all(16),
                      child: Align(
                      alignment: Alignment.centerRight,
                      child: RaisedButton(
                        child: Text("抽籤 "),
                        onPressed: (){
                          int num=0;
                          if(_checkNum()){
                            num = _randomNumber();
                            numList.add(num); //存入陣列

                            setState(() {
                              _randomNum = num;
                            });
                          }
                          //print(num);
                        },
                      ),
                  ),
                  ),
                ]
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    _getNumberList(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26
                    ),
                  ),
                ),
              ),
            ],
          ),
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {_resetApp();},
        tooltip: 'Random',
        child: Icon(Icons.autorenew),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
