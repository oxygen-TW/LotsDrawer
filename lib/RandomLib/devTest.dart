//Dev test only, DO NOT change.

import 'BasicRandom.dart';
import 'CatalogRandom.dart';

main(List<String> args) {
  var cr = new CatalogRandom();
  cr.addCatalog("拉麵");
  cr.addCatalog("水餃");
  cr.addCatalog("披薩");
  cr.addCatalog("搜水");

  print("今天晚餐吃" + cr.random());
}
