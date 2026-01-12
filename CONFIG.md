# 配置指南

本文件說明如何自訂道路標線施工統計工具的配置。

---

## 自訂人員清單

開啟 HTML 檔案，找到 `FORM_OPTIONS` 物件中的 `user` 陣列：

```javascript
const FORM_OPTIONS = {
    user: [
        "陳易璘", "吳文龍", "陳清建", // ... 現有人員
    ],
    // ...
};
```

**修改方式：**
1. 新增人員：在陣列中加入新名字
2. 刪除人員：移除對應的名字
3. 修改順序：調整陣列順序

**範例：**
```javascript
user: [
    "張三", 
    "李四", 
    "王五",
    "趙六"
],
```

---

## 自訂業主清單

找到 `FORM_OPTIONS.owner` 陣列進行修改：

```javascript
owner: [
    "磐碩8上", 
    "磐碩8下", 
    "磐碩",
    // ... 新增您的業主
],
```

---

## 自訂施工地點

地點分為多個群組，每個群組有一個標籤和選項清單：

```javascript
location: [
    {
        label: "臺北市（12個區）",
        options: [
            "中正區", "大同區", // ... 
        ]
    },
    {
        label: "新北市（29個區）",
        options: [
            "板橋區", "新莊區", // ...
        ]
    },
    // 新增自訂群組
    {
        label: "您的區域名稱",
        options: ["地點1", "地點2", "地點3"]
    }
],
```

---

## 自訂車輛清單

修改 `FORM_OPTIONS.car` 陣列：

```javascript
car: [
    "A車", 
    "B車", 
    "C車", 
    "您的車輛編號"
],
```

---

## 修改標線類型

### 修改現有類型的係數

找到 `INITIAL_TYPES` 陣列中的對應項目：

```javascript
{ 
    id: 'white_line', 
    name: '白線', 
    category: 'A', 
    type: 'linear', 
    factors: [0.1],  // 修改這裡的係數
    color: 'bg-blue-50 border-blue-200 text-blue-800' 
},
```

### 新增預設標線類型

在 `INITIAL_TYPES` 陣列末尾新增：

```javascript
{ 
    id: 'custom_new_marking',        // 唯一 ID
    name: '自訂標線名稱',              // 顯示名稱
    category: 'G',                    // 分類 (A-H)
    type: 'linear',                   // 計算類型: linear/count/item
    factors: [0.12],                  // 係數
    color: 'bg-purple-50 border-purple-200 text-purple-800' 
},
```

**type 說明：**
- `linear`：線性計算（輸入長度 × 係數）
- `count`：數量計算（輸入數量 × 係數）
- `item`：計次統計（不計算面積）

**category 分類：**
- A: 10cm道路標線
- B: 15cm道路標線
- C: 40cm道路標線
- D: 停等區與車格類
- E: 字模標線
- F: 內外型標線
- G: 其他與自訂
- H: 非標線項目

---

## 修改主題顏色

### 自訂班別主題

找到 `updateThemeByShift` 函式：

```javascript
function updateThemeByShift(shift) {
    const startPage = document.getElementById('start-page');
    startPage.classList.remove('theme-dark', 'theme-blue');
    
    if (shift === '早班') {
        // 白色背景
        startPage.style.backgroundColor = '#f8fafc';
    } else if (shift === '晚班') {
        // 深色背景
        startPage.classList.add('theme-dark');
    } else {
        // 藍色背景
        startPage.classList.add('theme-blue');
    }
}
```

您可以：
1. 修改背景顏色代碼
2. 新增更多班別條件
3. 自訂主題 CSS 類別

---

## 修改音效設定

### 調整語音速度

找到 `speak` 函式：

```javascript
utterance.rate = 1.2;  // 修改語速（0.1 - 10）
utterance.volume = 1.0; // 修改音量（0.0 - 1.0）
```

### 停用音效

在 HTML 檔案開頭設定：

```javascript
let isSoundEnabled = false;  // 改為 false 預設關閉音效
```

---

## 修改報表格式

找到 `copyReport` 函式，自訂報表templates：

```javascript
let text = `【道路標線施工日報表】\n`;  // 修改標題
text += `日期: ${formData.date || '未填寫'}\n`;
// ... 自訂您的報表格式
```

---

## 注意事項

> ⚠️ **備份原始檔案**  
> 修改前請備份原始 HTML 檔案

> ⚠️ **測試修改**  
> 修改後務必在瀏覽器中測試所有功能

> ⚠️ **清除快取**  
> 若修改未生效，請清除瀏覽器快取或強制重新整理（Ctrl+F5）

> ⚠️ **語法正確**  
> JavaScript 語法錯誤會導致整個程式無法運作，建議使用程式碼編輯器檢查語法

---

## 進階配置

如需更進階的配置選項，建議：

1. 使用文字編輯器（如 VSCode）開啟檔案
2. 善用編輯器的搜尋功能找到要修改的部分
3. 參考 CONTRIBUTING.md 了解程式碼結構
4. 加入團隊的 Git 版本控制系統

---

## 取得協助

如對配置有疑問，請參考：
- README.md - 使用手冊
- CONTRIBUTING.md - 開發指南
- PRD.md - 功能詳細說明
