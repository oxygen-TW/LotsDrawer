import 'globals.dart' as globals;
import 'RandomCore.dart';

class BasicRandom extends RandomCore {
  //class variables
  var totalNumbersList = <int>[];

  //Constructor
  BasicRandom(int start, int end) : super(start, end);

  List<int> getRoundNumbers() {
    var randomList = getRandomList();
    this.totalNumbersList.addAll(randomList);
    return randomList;
  }

  List<int> getTotalNumbers() {
    return this.totalNumbersList;
  }

  String getRoundNumbersString() {
    List<int> tmpList = getRandomList();
    if (globals.requireSort) {
      tmpList.sort();
    }
    String returnStr = "";
    for (int i = 0; i < tmpList.length - 1; i++) {
      returnStr += tmpList[i].toString() + ", ";
    }
    returnStr += tmpList.last.toString();
    return returnStr;
  }

  String getTotalNumbersString() {
    if (globals.requireSort) {
      this.allNumberList.sort();
    }

    String returnStr = "";
    if (allNumberList.isNotEmpty) {
      for (int i = 0; i < allNumberList.length - 1; i++) {
        returnStr += allNumberList[i].toString() + ", ";
      }
      returnStr += allNumberList.last.toString();
    }
    return returnStr;
  }

  String getExcludeNumbersString() {
    String returnStr = "";

    if (excludeList.isNotEmpty) {
      print("getExcludeString");
      for (int i = 0; i < excludeList.length - 1; i++) {
        returnStr += excludeList[i].toString() + ", ";
      }
      returnStr += excludeList.last.toString();
    }
    print(returnStr);
    return returnStr;
  }

  void dispose() {
    this.totalNumbersList.clear();
    super.dispose();
  }
}
