# 自動化系統修復腳本

## 說明

這個庫含有一個 PowerShell 脚本，可用於自動化使用系統檔案檢查器 (SFC) 和部署式對象使用和管理工具 (DISM) 進行修復。它簡化了在 Windows 上診斷和修復損壞系統檔案的過程。

## 功能
- 自動檢查是否擔任系統管理員身份執行。
- 執行 `sfc /scannow` 以驗證和修復系統檔案。
- 如果 SFC 無法解決問題，使用 DISM 修復系統形象。
- 提供便於使用者理解修復狀況的提示。

## 要求
- Windows 操作系統。
- PowerShell 2.0 或更新版本。
- 擔任系統管理員身份以執行脚本。

## 使用方法
1. 下載您喜歡的語言版本：
   - 英文版本：`ENRepairSystem.ps1`
   - 繁體中文版本：`TCRepairSystem.ps1`
2. 以系統管理員身份執行 PowerShell。
3. 轉至包含脚本的資料夾。
4. 執行脚本：
   ```powershell
   # 繁體中文版本
   .\TCRepairSystem.ps1
   ```
5. 按照畫面上提示操作以完成修復過程。

## 發行註記
### v1.0.0
- 初始發行 Repair System Automation Script。
- 內含 SFC 和 DISM 整合，以進行自動化修復。

---

## 語言切換

這是繁體中文版 README。您可以按下面鏈接切換為英文版：

- [English README](README.md)

