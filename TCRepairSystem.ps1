# 自動執行 SFC 和 DISM 修復的 PowerShell 腳本

# 檢查是否以系統管理員身份執行
If (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "請以系統管理員身份執行此腳本。" -ForegroundColor Red
    Exit
}

# 執行 SFC /scannow
Write-Host "正在執行系統文件檢查器 (SFC)..." -ForegroundColor Green
sfc /scannow

# 檢查 SFC 結果
If ($LASTEXITCODE -eq 0) {
    Write-Host "SFC 已完成，未發現任何問題。" -ForegroundColor Green
} ElseIf ($LASTEXITCODE -eq 1) {
    Write-Host "SFC 已完成，但修復了一些問題。" -ForegroundColor Yellow
} Else {
    Write-Host "SFC 遇到問題，將嘗試使用 DISM 進行修復。" -ForegroundColor Red

    # 使用 DISM 修復
    Write-Host "正在使用 DISM 修復系統映像..." -ForegroundColor Green
    DISM /Online /Cleanup-Image /CheckHealth
    DISM /Online /Cleanup-Image /ScanHealth
    DISM /Online /Cleanup-Image /RestoreHealth

    # 檢查 DISM 結果
    If ($LASTEXITCODE -eq 0) {
        Write-Host "DISM 修復成功。" -ForegroundColor Green
    } Else {
        Write-Host "DISM 修復失敗，建議進行系統還原或重新安裝 Windows。" -ForegroundColor Red
    }
}

Write-Host "操作完成。請重新啟動電腦以應用所有更改。" -ForegroundColor Cyan
