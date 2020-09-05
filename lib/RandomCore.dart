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
  }

  void listShuffle(){
    globals.numberList.shuffle();
  }

  void initNumberList(){
    //globals.numberList = {16 => }
  }

  int random() {
    print("$this.startNum $this.endNum");
    do {
      this._randomNum = rd.nextInt(this.endNum - this.startNum) + this.startNum;
      print("$num");
    }while(numList.contains(num) && globals.requireUnique);
    return this._randomNum;
  }

}