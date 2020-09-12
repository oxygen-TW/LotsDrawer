import 'package:LotsDrawer/RandomLib/RandomCore.dart';

class CatalogRandomUI extends RandomCore {
  var catalog = {};

  CatalogRandomUI() : super(1, 2);

  int addCatalog(String newItem) {
    int tmpId = this.catalog.length;
    this.catalog.update(tmpId, (newItem) => null);
    return tmpId;
  }

  bool removeCatalog(int id) {
    try {
      this.catalog.remove(id);
    } on Exception catch (e) {
      return false;
    }
    return true;
  }

  bool _checkSetting(){
    return this.catalog.isNotEmpty;
  }

  String catalogRandom(){
    if(!_checkSetting()){
      return "";
    }

    RandomCore rdc = new RandomCore(0, catalog.length-1);
    int randomNum = rdc.getRandomList()[0];

    return catalog[randomNum.toString()];
  }

  void dispose(){
    this.catalog.clear();
    super.dispose();
  }
}
