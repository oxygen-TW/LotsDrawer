import 'dart:math';
import 'globals.dart' as globals;

class RandomCore {
  //class variables
  var numList = <int>[];
  var allNumberList = <int>[];
  int startNum = 0;
  int endNum = 0;
  Random rd;

  //Constructor
  RandomCore(int start, int end) {
    this.startNum = start;
    this.endNum = end + 1;
    this.rd = new Random();
    this.numList = new List<int>.generate(
        (this.endNum - this.startNum), (i) => i + startNum);

    //Do random
    listShuffle();
  }

  void listShuffle() {
    this.numList.shuffle();
  }

  List<int> _random() {
    var index = this.numList.length - 1;
    var returnList = <int>[];
    int limit = 0;

    if(this.numList.length < globals.multiNum){
      limit = this.numList.length;
    }else{
      limit = globals.multiNum;
    }

    for (int i = 0; i < limit; i++) {
      print(this.numList[i]);
      //排除 Exclude
      if(globals.excludeList.contains(this.numList[i])){
        this.numList.removeAt(i);
        i -= 1;//回復index
        continue;
      }
      returnList.add(this.numList[i]);
      allNumberList.add(this.numList[i]);
      this.numList.removeAt(i);
    }
    return returnList;
  }

  String getRoundString() {
    List<int> tmpList = this._random();
    if(globals.requireSort){
      tmpList.sort();
    }
    String returnStr = "";
    for (int i = 0; i < tmpList.length - 1 ; i++) {
      returnStr += tmpList[i].toString() + ", ";
    }
    returnStr += tmpList.last.toString();
    return returnStr;
  }

  String getNumberString() {
    if(globals.requireSort){
      this.allNumberList.sort();
    }

    String returnStr = "已抽中：";
    if (this.allNumberList.isNotEmpty) {
      for (int i = 0; i < this.allNumberList.length - 1; i++) {
        returnStr += this.allNumberList[i].toString() + ", ";
      }
      returnStr += this.allNumberList.last.toString();
    }

    return returnStr;
  }

  String getExcludeString() {
    String returnStr = "排除：";
    if (globals.excludeList.isNotEmpty) {
      for (int i = 0; i < globals.excludeList.length - 1; i++) {
        returnStr += globals.excludeList[i].toString() + ", ";
      }
      returnStr += globals.excludeList.last.toString();
    }

    return returnStr;
  }

  bool check() {
    if (numList.isEmpty) {
      return false;
    }
    return true;
  }

  void reset() {
    this.allNumberList.clear();
    this.numList.clear();
    globals.excludeList.clear();
  }
}
