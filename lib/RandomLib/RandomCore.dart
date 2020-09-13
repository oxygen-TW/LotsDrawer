import 'RL_Exceptions.dart';

class RandomCore {
  //class variables
  var numList = <int>[];
  var allNumberList = <int>[];
  var excludeList = <int>[];
  int startNum = 0;
  int endNum = 0;
  int multiDraw = 1;

  //Constructor
  RandomCore(int start, int end) {
    this.startNum = start;
    this.endNum = end;
    this.numList = new List<int>.generate(
        (this.endNum - this.startNum + 1), (i) => i + startNum);

    //Do random
    this._shuffleList();
  }

  void setRange(int start, int end) {
    if (start <= end) {
      throw new RandomCoreValueInvalid();
    }

    this.startNum = start;
    this.endNum = end;
  }

  void _shuffleList() {
    this.numList.shuffle();
  }

  List<int> getRandomList() {
    //排除Exclude number
    numList = numList.toSet().difference(this.excludeList.toSet()).toList();
    var returnList = <int>[];
    int limit = 0;

    //print("length: " + this.numList.length.toString());
    //print("exclude: " + this.excludeList.length.toString());
    if (this.numList.length < this.multiDraw) {
      limit = this.numList.length;
      //print("min mode:" + limit.toString());
    } else {
      limit = this.multiDraw;
    }

    for (int i = limit - 1; i >= 0; i--) {
      //print(this.numList[i]);
      //排除 Exclude
      returnList.add(this.numList[i]);
      allNumberList.add(this.numList[i]);
      this.numList.removeAt(i);
    }
    //print("after L:" + this.numList.toString());
    return returnList;
  }

  void setExcludeNumbers(List<int> newExcludeList) {
    this.excludeList = newExcludeList;
  }

  void addExcludeNumber(int newExcludeNumber) {
    if (this.excludeList.contains(newExcludeNumber)) {
      throw new RandomItemExist();
    }
    
    this.excludeList.add(newExcludeNumber);
  }

  void removeExcludeNumber(int exExcludeNumber) {
    this.excludeList.remove(exExcludeNumber);
  }

  List<int> getExcludeNumbers() {
    return this.excludeList;
  }

  void setMultiDraw(int newMultiDrawNumber) {
    this.multiDraw = newMultiDrawNumber;
  }

  int getMultiDraw() {
    return this.multiDraw;
  }

  bool check() {
    if (this.startNum >= this.endNum) {
      return false;
    }

    if (this.numList.isEmpty) {
      return false;
    }
    return true;
  }

  void dispose() {
    this.allNumberList.clear();
    this.numList.clear();
    this.excludeList.clear();
  }
}
