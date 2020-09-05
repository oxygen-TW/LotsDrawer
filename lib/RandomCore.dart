import 'dart:math';
import 'globals.dart' as globals;

class RandomCore{

  //class variables
  int _randomNum = 0;
  var numList = <int>[];
  int startNum = 0;
  int endNum = 0;
  Random rd;

  //Constructor
  RandomCore(int start, int end){
    this.startNum = start;
    this.endNum = end + 1;
    this.rd = new Random();
    this.numList = new List<int>.generate((this.endNum - this.startNum + 1), (i) => i + startNum);
  }

  void listShuffle(){
    this.numList.shuffle();
  }

  List<int> random() {
    var index = this.numList.length - 1;
    var returnList = <int>[];

    for(int i=0; i<globals.multiNum;i++){
      returnList.add(this.numList[index]);
      this.numList.removeAt(index);
    }
    return returnList;
  }

  void reset(){

  }
}