# LotsDrawer

[![hackmd-github-sync-badge](https://hackmd.io/ftY2p9YOS4aR7es2d3pK_g/badge)](https://hackmd.io/ftY2p9YOS4aR7es2d3pK_g)


## 開發緣由
因家人是老師，需要抽點學生，找不到市面上好用且沒有廣告的抽籤軟體，剛好在這次 DSC summer bootcamp 學會了很多新技術，便拿來運用親自打造一套好用的抽籤軟體。

## 使用技術
- [Flutter](https://flutter.dev/)
- [Google Cloud Plateform](https://cloud.google.com/gcp)

## Contributor 團隊成員
> 2位
- 劉子豪 [oxygen-TW](https://github.com/oxygen-TW)
  - RandomCore.dart 開發
  - UI layout
- 陳俊瑜 [junyussh](https://github.com/junyussh)
  - UI layout
  - UI optimization

## Web PWA
https://web.oxygentw.net/LotsDrawer/#/

## 操作截圖
<img src="https://i.imgur.com/p90CcZ0.jpg" width="50%" height="50%" /> 

<img src="https://i.imgur.com/Sd82AXH.jpg" width="50%" height="50%" />

<img src="https://i.imgur.com/0qkrn9Q.jpg" width="50%" height="50%" />


## Draw lots app Random API

引用

命名規則
- 以下底線開頭的函式設計為內部函式，請勿外部呼叫。

---
## RandomCore.dart
- [X] `RandomCore(int start, int end)`
    - 初始化
    - 設定亂數的上限與下限
- [X] `void dispose()`
    - delete class
- [X] `setRange(int start, int end)`
    - 設定亂數的上限與下限
- [X] `void setExcludeNumbers(List<int>)`
    - 直接指定所有排除數字
- [X] `void addExcludeNumber(int)`
    - 新增一個排除數字
- [X] `void getExcludeNumbers(int)`
    - 取得目前被排除的數字
- [X] `void setMultiDraw(int)`
    - 設定單次抽取數量
- [X] `int getMultiDraw()`
    - 取得目前單次抽取數量
- [X] `void _shuffleList()`
    - 重新排序
- [X] `bool check()`
    - 檢查上限與下限是否合法
    - 檢查是否已經抽完所有數字
- [X] `List<int> getRandomList()`
    - 抽取數字 LotsDrawer


## BasicRandom.dart
> inherit RandomCore
- [X] `BasicRandom(int start, int end)`
    - 初始化
- [X] `List<int> getRoundNumbers()`
    - 取得單次抽籤數字 List
- [X] `List<int> getTotalNumbers()`
    - 取得所有已抽中數字 List
- [X] `List<int> getExcludeNumbers()`
    - 取得目前被排除的數字 List
- [X] `String getRoundNumbersString()`
    - 取得單次抽籤數字字串
- [X] `String getTotalNumbersString()`
    - 取得所有已抽中數字字串
- [X] `String getExcludeNumbersString()`
    - 取得目前被排除的數字字串
- [X] `void dispose()`
    - 刪除 class

## CatalogRandom.dart
> inherit RandomCore

- [X] `CatalogRandom()`
    - 初始化
- [X] `int addCatalog(String item)`
    - 新增 item 至 catalog
    - if item already exsit, throw exception `CatalogRandomItemExsit`
- [X] `List<String> getCatalog()`
    - 取得目前 catalog
- [X] `bool removeCatalog(String item)`
    - success return `true`, otherwise return `false`
- [X] `String random()`
    - if All catalogs have been selected, throw exception `CatalogRandomNoItem`
- [X] `void requireUnique(bool)`
    - 設定不可重複
- [X] `bool _isAllselected()`
    - 是否已經抽完所有 item
- [X] `dispose()`
    - 刪除 class