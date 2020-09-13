import 'package:LotsDrawer/RandomLib/RandomCore.dart';

class CatalogRandomItemExist implements Exception {
  String errMsg() => 'Item is already exsit in catalog.';
}

class CatalogRandomNoItem implements Exception {
  String errMsg() => 'No item in the catalog.';
}

class CatalogRandom extends RandomCore {
  var catalog = <String>[];
  var randomCatalog = <String>[];

  CatalogRandom() : super(1, 2);

  int addCatalog(String newItem) {
    if (this.catalog.contains(newItem)) {
      throw new CatalogRandomItemExist();
    }

    int tmpId = this.catalog.length;
    this.catalog.add(newItem);
    this.randomCatalog = this.catalog; //複製List
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

  bool _isAllselected() {
    return this.randomCatalog.isEmpty;
  }

  String random() {
    if (_isAllselected()) {
      throw new CatalogRandomNoItem();
    }

    RandomCore rdc = new RandomCore(0, catalog.length - 1);
    int randomNum = rdc.getRandomList()[0];

    var returnStr = this.randomCatalog[randomNum];
    this.randomCatalog.removeAt(randomNum);
    return returnStr;
  }

  void dispose() {
    this.randomCatalog.clear();
    this.catalog.clear();
    super.dispose();
  }
}
