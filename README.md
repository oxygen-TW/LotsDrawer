# LotsDrawer

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

## 操作截圖
![Imgur](https://imgur.com/p90CcZ0)    
![Imgur](https://imgur.com/tCW0lCG)    
![Imgur](https://imgur.com/MxxSJW8)
## RandomCore.dart Usage
---

### RandomCore(int start, int end)
`Constructor `
傳入亂數起始值與結束值    

import:
```dart
import 'RandomCore.dart';
```     
    
Example:
```dart
RandomCore rdc = new RandomCore(1, 10);
```

### String getRoundString(void)

取得單次亂數結果，以字串形式回傳

### String getNumberString(void)

取得已被抽中的數字字串

### getExcludeString(void)

取得被排除的數字字串

### void reset(void)
重設 RandomCore，**注意，此行為不會影響亂數起始值與結束值**，若要修改請重新宣告執行 constructor

### void listShuffle(void)
> 盡量不要外部呼叫

進行隨機打亂

### List<int> _random(void)
> 盡量不要外部呼叫

實作隨機功能

---

## ToDo

- [ ] README.md
- [ ] Home page 排版優化    
- [ ] Home page 程式碼重構並使用 Random Core    
- [X] 實作 RandomCore 功能    
- [X] 測試 RandomCore 功能    
- [ ] Home page 單元測試    
- [ ] Settings page 單元測試    
- [ ] 整合測試    
