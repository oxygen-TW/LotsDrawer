class RandomItemExist implements Exception {
  String errMsg() => 'E: Item is already exsit in list.';
}

class CatalogRandomNoItem implements Exception {
  String errMsg() => 'E: No item in the catalog.';
}

class RandomCoreValueInvalid implements Exception{
  String errMsg() => 'E: start or end value is invalid.';
}