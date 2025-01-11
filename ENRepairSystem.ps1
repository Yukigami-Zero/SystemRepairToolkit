# PowerShell script for automated execution of SFC and DISM repairs

# Check if running as Administrator
If (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Please run this script as an Administrator." -ForegroundColor Red
    Exit
}

# Run SFC /scannow
Write-Host "Running System File Checker (SFC)..." -ForegroundColor Green
sfc /scannow

# Check SFC results
If ($LASTEXITCODE -eq 0) {
    Write-Host "SFC completed, no issues found." -ForegroundColor Green
} ElseIf ($LASTEXITCODE -eq 1) {
    Write-Host "SFC completed and fixed some issues." -ForegroundColor Yellow
} Else {
    Write-Host "SFC encountered issues, attempting to repair with DISM." -ForegroundColor Red

    # Use DISM for repair
    Write-Host "Using DISM to repair the system image..." -ForegroundColor Green
    DISM /Online /Cleanup-Image /CheckHealth
    DISM /Online /Cleanup-Image /ScanHealth
    DISM /Online /Cleanup-Image /RestoreHealth

    # Check DISM results
    If ($LASTEXITCODE -eq 0) {
        Write-Host "DISM repair succeeded." -ForegroundColor Green
    } Else {
        Write-Host "DISM repair failed. Consider performing a system restore or reinstalling Windows." -ForegroundColor Red
    }
}

Write-Host "Operation completed. Please restart your computer to apply all changes." -ForegroundColor Cyan
