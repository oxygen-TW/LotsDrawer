import 'package:flutter/material.dart';
import 'RandomLib/CatalogRandom.dart';
import 'RandomLib/RL_Exceptions.dart';

class CatalogRandomUI extends StatefulWidget {
  @override
  _CatalogRandomUIState createState() => _CatalogRandomUIState();
}

class _CatalogRandomUIState extends State<CatalogRandomUI> {
  TextEditingController _catalogC = new TextEditingController();
  var _catalogList = [];
  var _catalogRandom = new CatalogRandom();
  var _selectedCatalog = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自訂抽籤"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(hintText: "自訂選項"),
                  controller: _catalogC,
                ),
              ),
              FlatButton(
                  onPressed: () {
                    try {
                      _catalogRandom.addCatalog(_catalogC.text);
                    } on RandomItemExist {
                      print("RandomItemExist");
                    }

                    _catalogList = _catalogRandom.getCatalog();
                    _catalogC.text = "";
                    setState(() {});
                  },
                  child: Text("添加")),
              FlatButton(
                  onPressed: () {
                    try {
                      _selectedCatalog = "抽中：" + _catalogRandom.random();
                    } on CatalogRandomNoItem {
                      print("E: CatalogRandomNoItem");
                    }

                    setState(() {});
                  },
                  child: Text("抽籤"))
            ],
          ),
          Row(
            children: [
              Text(_selectedCatalog),
            ],
          ),
          Divider(
            height: 2.0,
            color: Colors.grey,
          ),
          new Expanded(
              child: new ListView.builder(
                  itemCount: _catalogList.length,
                  itemBuilder: (BuildContext ctxt, int Index) {
                    return new Text(_catalogList[Index]);
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _catalogList.clear();
          _selectedCatalog = " ";
          _catalogC.text = "";
          _catalogRandom.dispose();
          _catalogRandom = new CatalogRandom();
          setState(() {});
        },
        tooltip: 'Reset',
        child: Icon(Icons.autorenew),
      ),
    );
  }
}
