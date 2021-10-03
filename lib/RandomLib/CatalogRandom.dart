import 'package:LotsDrawer/RandomLib/RandomCore.dart';
import 'RL_Exceptions.dart';

class CatalogRandom extends RandomCore {
  var catalog = <String>[];
  var randomCatalog = <String>[];
  bool _isUnique = true;

  CatalogRandom() : super(1, 2);

  int addCatalog(String newItem) {
    if (this.catalog.contains(newItem)) {
      throw new RandomItemExist();
    }

    int tmpId = this.catalog.length;
    this.catalog.add(newItem);
    this.randomCatalog.clear();
    this.randomCatalog = []..addAll(this.catalog); //複製List)
    return tmpId;
  }

  bool removeCatalog(String item) {
    try {
      this.catalog.remove(item);
    } on Exception catch (e) {
      print(e);
      return false;
    }
    this.randomCatalog = this.catalog; //複製List
    return true;
  }

  List<String> getCatalog() {
    return this.catalog;
  }

  void requireUnique(bool flag) {
    this._isUnique = flag;
  }

  bool _isAllselected() {
    return this.randomCatalog.isEmpty;
  }

  String random() {
    if (_isAllselected()) {
      throw new CatalogRandomNoItem();
    }

    RandomCore rdc = new RandomCore(0, randomCatalog.length - 1);
    int randomNum = rdc.getRandomList()[0];

    var returnStr = this.randomCatalog[randomNum];

    if (this._isUnique) {
      this.randomCatalog.removeAt(randomNum);
    }

    return returnStr;
  }

  void dispose() {
    this.randomCatalog.clear();
    this.catalog.clear();
    super.dispose();
  }
}
