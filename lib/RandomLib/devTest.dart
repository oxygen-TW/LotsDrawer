//Dev test only, DO NOT change.

import 'BasicRandom.dart';
import 'CatalogRandom.dart';

main(List<String> args) {
  var br = new BasicRandom(10, 100);
  for (int i = 0; i < 10;i++){
    br.getRoundNumbersString();
  } 
  print(br.getTotalNumbersString());
}
