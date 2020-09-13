//Dev test only, DO NOT change.

import 'BasicRandom.dart';
import 'CatalogRandom.dart';

main(List<String> args) {
  var br = new BasicRandom(10, 100);
  br.getRoundNumbers();
  br.getRoundNumbers();
  br.getRoundNumbers();
  br.getRoundNumbers();
  br.getRoundNumbers();
  print(br.getTotalNumbers());
}
