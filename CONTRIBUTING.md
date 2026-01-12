# 貢獻指南 (Contributing Guide)

感謝您對道路標線施工統計工具的興趣！本文件將幫助您了解如何參與專案開發。

---

## 📋 目錄

- [開發環境設置](#開發環境設置)
- [程式碼規範](#程式碼規範)
- [開發流程](#開發流程)
- [測試指南](#測試指南)
- [提交規範](#提交規範)
- [問題回報](#問題回報)

---

## 🛠️ 開發環境設置

### 必要工具

- **文字編輯器**：VSCode、Sublime Text、Notepad++ 等
- **瀏覽器**：Chrome 或 Edge（建議安裝開發者擴充功能）
- **Git**：版本控制工具

### 取得程式碼

```bash
# Clone 專案（如果使用版本控制）
git clone <repository-url>
cd kennyanti

# 或直接下載檔案
# 260112-報表-標線計算-鍵盤可-完整地點-項目修正-班別背景.html
```

### 開啟專案

1. 使用文字編輯器開啟 HTML 檔案
2. 用瀏覽器開啟檔案進行測試
3. 開啟瀏覽器開發者工具（F12）查看 Console

### 推薦 VSCode 擴充功能

- **Live Server** - 即時預覽 HTML 變更
- **Prettier** - 程式碼格式化
- **ESLint** - JavaScript 語法檢查
- **Tailwind CSS IntelliSense** - Tailwind CSS 自動完成

---

## 📝 程式碼規範

### JavaScript 規範

#### 命名規則

```javascript
// ✅ 良好的命名
const userName = 'John';              // 變數使用 camelCase
const MAX_RETRY_COUNT = 3;            // 常數使用 UPPER_SNAKE_CASE
function calculateArea() {}            // 函式使用 camelCase
const FORM_OPTIONS = {};              // 配置物件使用 UPPER_SNAKE_CASE

// ❌ 避免的命名
const user_name = 'John';             // 避免 snake_case
const CALCULATEAREA = () => {};       // 避免全大寫函式
```

#### 程式碼風格

```javascript
// ✅ 清晰的程式碼
function submitInput() {
    const val = parseFloat(inputValue);
    const type = getSelectedType();
    
    if (!type || isNaN(val) || val <= 0) {
        return; // 提早返回，減少巢狀
    }
    
    const area = calculateArea(val, type);
    addToHistory(type, val, area);
}

// ❌ 避免的寫法
function submitInput() {
    const val = parseFloat(inputValue);
    const type = getSelectedType();
    if (type && !isNaN(val) && val > 0) {  // 過深的巢狀
        const area = calculateArea(val, type);
        addToHistory(type, val, area);
    }
}
```

#### 註解規範

```javascript
// ✅ 有意義的註解
// 計算標線面積：長度 × 寬度係數
function calculateArea(length, type) {
    return length * getFactorProduct(type.factors);
}

// 修正班別主題切換邏輯 - Issue #42
function updateThemeByShift(shift) {
    // ...
}

// ❌ 無意義的註解
// 這個函式計算面積
function calculateArea(length, type) {
    return length * getFactorProduct(type.factors); // 返回面積
}
```

### HTML 規範

```html
<!-- ✅ 良好的 HTML -->
<button 
    class="btn-primary w-full py-3" 
    onclick="submitInput()" 
    aria-label="提交數據">
    確認
</button>

<!-- ❌ 避免的寫法 -->
<button class="btn-primary w-full py-3" onclick="submitInput()">確認</button>
```

### CSS 規範

```css
/* ✅ 使用 Tailwind 優先 */
<div class="p-4 bg-white rounded-lg shadow-md">

/* ✅ 自訂 CSS 使用有意義的類別名稱 */
.keyboard-focused {
    outline: 3px solid #f59e0b;
    outline-offset: 2px;
}

/* ❌ 避免行內樣式 */
<div style="padding: 16px; background: white;">
```

---

## 🔄 開發流程

### 1. 建立分支（如使用 Git）

```bash
# 從 main 分支建立新功能分支
git checkout -b feature/add-export-function

# 或建立修復分支
git checkout -b fix/calculation-bug
```

### 2. 進行開發

1. 在文字編輯器中修改程式碼
2. 在瀏覽器中測試變更
3. 確保新功能不破壞現有功能
4. 添加適當的註解

### 3. 自我檢查清單

- [ ] 程式碼遵循規範
- [ ] 已添加必要的註解
- [ ] 在多種瀏覽器測試（Chrome、Edge、Firefox）
- [ ] 在行動裝置測試（響應式設計）
- [ ] 已測試鍵盤操作功能
- [ ] 已測試 localStorage 資料持久化
- [ ] 沒有 Console 錯誤訊息
- [ ] 向下相容（不破壞現有資料）

### 4. 提交變更

```bash
# 查看變更
git status
git diff

# 添加檔案
git add 260112-報表-標線計算-鍵盤可-完整地點-項目修正-班別背景.html

# 提交（遵循提交訊息規範）
git commit -m "feat: 新增 JSON 匯出功能"

# 推送到遠端
git push origin feature/add-export-function
```

---

## 🧪 測試指南

### 功能測試檢查表

#### 前置作業頁面
- [ ] 日期選擇器正常運作
- [ ] 所有選項按鈕可點擊
- [ ] 鍵盤導航正常（WASD）
- [ ] 班別切換主題正常
- [ ] 「開始統計」按鈕功能正常

#### 主程式頁面
- [ ] 標線類型顯示完整
- [ ] 類型選擇有視覺回饋
- [ ] 數字鍵盤輸入正確
- [ ] 計算公式顯示正確
- [ ] 面積計算準確
- [ ] 歷史列表正常顯示
- [ ] 刪除功能正常
- [ ] 總計計算正確

#### 報表功能
- [ ] 報表格式正確
- [ ] 複製功能正常
- [ ] Line 貼上格式正確
- [ ] Excel 貼上格式正確

#### 鍵盤操作
- [ ] WASD 導航正常
- [ ] 空白鍵選取正常
- [ ] Enter 確認正常
- [ ] 數字鍵輸入正常
- [ ] P 鍵複製正常

#### 語音與音效
- [ ] 語音播報正常
- [ ] 音效播放正常
- [ ] 聲音開關正常

### 瀏覽器相容性測試

| 功能         | Chrome | Edge | Firefox | Safari |
| ------------ | ------ | ---- | ------- | ------ |
| 基本顯示     | ✅      | ✅    | ✅       | ✅      |
| 鍵盤導航     | ✅      | ✅    | ✅       | ✅      |
| LocalStorage | ✅      | ✅    | ✅       | ✅      |
| 語音合成     | ✅      | ✅    | ✅       | ⚠️      |
| Web Audio    | ✅      | ✅    | ✅       | ✅      |

### 行動裝置測試

- [ ] iPhone (Safari)
- [ ] Android 手機 (Chrome)
- [ ] iPad (Safari)
- [ ] Android 平板 (Chrome)

### 測試數據範例

```javascript
// 測試白線計算
// 輸入：10.5m
// 預期：10.5 × 0.1 = 1.05m²

// 測試行穿線計算
// 類型：1m行穿線
// 輸入：8條
// 預期：8 × 1 × 0.4 = 3.2m²

// 測試自訂項目
// 名稱：特殊圖案
// 係數：1.5*0.3
// 輸入：5
// 預期：5 × 0.45 = 2.25m²
```

---

## 📤 提交規範

### Commit Message 格式

使用 [Conventional Commits](https://www.conventionalcommits.org/) 規範：

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Type 類型

- **feat**: 新功能
- **fix**: 錯誤修復
- **docs**: 文件更新
- **style**: 程式碼格式（不影響功能）
- **refactor**: 重構（不新增功能也不修復錯誤）
- **perf**: 效能改善
- **test**: 測試相關
- **chore**: 建置工具或輔助工具變動

### 範例

```bash
# 新增功能
git commit -m "feat: 新增 JSON 匯出功能"

# 修復錯誤
git commit -m "fix: 修正行穿線面積計算錯誤"

# 文件更新
git commit -m "docs: 更新 README 使用說明"

# 程式碼重構
git commit -m "refactor: 將音效邏輯抽取為獨立模組"

# 效能改善
git commit -m "perf: 優化標線類型渲染效能"
```

### 詳細說明範例

```bash
git commit -m "feat: 新增 JSON 匯出功能

- 新增匯出歷史記錄為 JSON 檔案功能
- 新增從 JSON 匯入功能
- 支援資料備份與還原

Closes #123"
```

---

## 🐛 問題回報

### 回報前檢查

1. 確認是否為已知問題
2. 更新到最新版本
3. 清除瀏覽器快取
4. 嘗試在不同瀏覽器重現

### 問題範本

```markdown
**環境資訊**
- 瀏覽器：Chrome 120 (Windows 11)
- 裝置：桌面電腦
- 版本：1.0.0

**問題描述**
簡要描述問題

**重現步驟**
1. 開啟工具
2. 選擇「白線」
3. 輸入 10.5
4. 點擊確認
5. 觀察到錯誤

**預期行為**
應該計算為 1.05m²

**實際行為**
顯示 NaN

**截圖**
（如有請附上）

**額外資訊**
Console 錯誤訊息：
```
Uncaught TypeError: Cannot read property 'factors' of undefined
```
```

---

## 🎯 開發重點提醒

### ⚠️ 重要注意事項

1. **保持向下相容**
   - 不可破壞現有 localStorage 資料結構
   - 新功能應能處理舊版資料

2. **單檔案優勢**
   - 目前設計為單一 HTML 檔案，方便部署
   - 如需分離檔案，請確保部署仍然簡便

3. **行動優先**
   - 所有功能必須在觸控裝置上可用
   - 按鈕大小至少 44×44px

4. **無障礙設計**
   - 支援完整鍵盤操作
   - 適當的 ARIA 標籤
   - 良好的對比度

### 💡 最佳實踐

1. **測試驅動**
   - 先寫測試案例
   - 確保新功能有測試覆蓋

2. **漸進增強**
   - 核心功能優先
   - 進階功能為附加

3. **效能優先**
   - 避免不必要的 DOM 操作
   - 適當使用防抖（debounce）和節流（throttle）

4. **安全考量**
   - 驗證使用者輸入
   - 避免 XSS 攻擊
   - 安全處理 localStorage

---

## 📚 開發資源

### 參考文件

- [Tailwind CSS 文件](https://tailwindcss.com/docs)
- [Lucide Icons](https://lucide.dev/)
- [Web Audio API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API)
- [Web Speech API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Speech_API)
- [LocalStorage](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage)

### 學習資源

- [JavaScript 最佳實踐](https://github.com/ryanmcdermott/clean-code-javascript)
- [HTML 語意化](https://developer.mozilla.org/en-US/docs/Glossary/Semantics)
- [響應式設計](https://web.dev/responsive-web-design-basics/)

---

## 🎉 特別感謝

感謝所有貢獻者的付出！您的每一個 commit 都讓這個工具變得更好。

---

## 📧 聯絡方式

如有任何問題或建議，請聯絡開發團隊。

**祝開發愉快！** 🚀
